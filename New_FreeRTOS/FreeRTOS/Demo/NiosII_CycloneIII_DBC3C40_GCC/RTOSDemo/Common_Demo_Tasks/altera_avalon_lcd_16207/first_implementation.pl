#Copyright (C)2001-2010 Altera Corporation
#Any megafunction design, and related net list (encrypted or decrypted),
#support information, device programming or simulation file, and any other
#associated documentation or information provided by Altera or a partner
#under Altera's Megafunction Partnership Program may be used only to
#program PLD devices (but not masked PLD devices) from Altera.  Any other
#use of such megafunction design, net list, support information, device
#programming or simulation file, or any other related documentation or
#information is prohibited for any other purpose, including, but not
#limited to modification, reverse engineering, de-compiling, or use with
#any other silicon devices, unless such use is explicitly licensed under
#a separate agreement with Altera or a megafunction partner.  Title to
#the intellectual property, including patents, copyrights, trademarks,
#trade secrets, or maskworks, embodied in any such megafunction design,
#net list, support information, device programming or simulation file, or
#any other related documentation or information provided by Altera or a
#megafunction partner, remains with Altera, the megafunction partner, or
#their respective licensors.  No other licenses, including any licenses
#needed under any third party's intellectual property, are provided herein.
#Copying or modifying any file, or portion thereof, to which this notice
#is attached violates this copyright.









































































use europa_all;
use europa_utils;
use strict;



my $project = e_project->new(@ARGV);

&make_performance_counter ($project->top(), $project);

$project->output();




sub Validate_Options 
{
   my ($Opt, $SBI, $project) = (@_);




   $Opt->{counter_load_value} =
    int  (($Options->{clock_freq} * (100.0/1000000.0)) + 0.5);


}







sub overly_complicated_make_lcd_interface
{
   my ($module, $project) = (@_);
   
   my $Opt = &copy_of_hash($project->WSA());
   

   $Opt->{clock_freq} = $project->get_module_clock_frequency();

   my $SBI  = $project->SBI("control_slave");






   my $marker = e_default_module_marker->new($module);

   e_port->adds(# Avalon slave ports:
                ["address",       2,   "in" ],
                ["writedata",     8,   "in" ],
                ["readdata",      8,   "out"],
                ["write",         1,   "in" ],
                ["begintransfer", 1,   "in" ],
                ["irq",           1,   "out"], 


                ["LCD_data",      8, "inout"],
                ["LCD_RS",        1,   "out"],
                ["LCD_RW",        1,   "out"],
                ["LCD_E",         1,   "out"],
                );


   e_assign->adds (["LCD_RW",   "address[0]"                     ],
                   ["LCD_RS",   "address[1]"                     ],
                   ["LCD_E",    "read | write"                   ],
                   ["LCD_data", "(address[0]) ? 8'bz : writedata"],
                   ["readdata", "LCD_data"                       ],
                   );
}

sub overly_complicated_make_lcd_interface
{
   my ($module, $project) = (@_);
   
   my $Opt = &copy_of_hash($project->WSA());
   

   $Opt->{clock_freq} = $project->get_module_clock_frequency();

   my $SBI  = $project->SBI("control_slave");
   &Validate_Options ($Opt, $SBI, $project);





   my $marker = e_default_module_marker->new($module);

   e_port->adds(# Avalon slave ports:
                ["address",       2,   "in" ],
                ["writedata",     8,   "in" ],
                ["readdata",      8,   "out"],
                ["write",         1,   "in" ],
                ["begintransfer", 1,   "in" ],
                ["irq",           1,   "out"], 


                ["LCD_data",      8,   "out"],
                ["LCD_RS",        1,   "out"],
                ["LCD_RW",        1,   "out"],
                ["LCD_E",         1,   "out"],
                );


   e_assign->add (["LCD_RW", "0"]);

   e_avalon_slave->add ({name => "control_slave",});  
   e_assign->add (["clk_en", "-1"]);
   my @read_mux_table = ();


   e_assign->adds
       (["write_strobe",        "write & begintransfer"                ],


        ["transaction_request", "(write_strobe                    )&& 
                                 ((address == 0) || (address == 1))   "],
        );



   e_register->add 
       ({out         => e_signal->add(["control_register", 1]),
         in          => "writedata",
         enable      => "(address == 2) && write_strobe ",
         async_value => "1'b0",
         });
   push (@read_mux_table, "(address == 0)",  "control_register");
   e_assign->add ([&concatenate ("IE"), "control_register"]);

   e_assign->add (["irq", "IE & RDY"]);






   e_register->add 
       ({out        => "LCD_data", 
         in         => "writedata",
         enable     => "transaction_request",
         });





   e_register->add 
       ({out        => "LCD_RS", 
         sync_reset => "transaction_request && (address == 0)",
         sync_set   => "transaction_request && (address == 1)",
      });








   $counter_bits = &Bits_To_Encode ($Opt->{counter_load_value});
   e_register->add 
       ({out     => e_signal->add (["counter", $counter_bits]),
         in      => "counter_input",
         enable  => "counter_enable",
      });


   e_assign->add 
       ({lhs => ["counter_input", $counter_bits],
         rhs => "counter_load ? $Opt->{counter_load_value} : counter - 1",
       });

   e_assign->adds 
       (["counter_enable", "counter_load || ~RDY"                 ],
        ["counter_load",   "transaction_request || (counter == 0)"],
        );

   e_register->add 
       ({out        => "LCD_E",
         sync_set   => "transaction_request",
         sync_reset => "(counter == 0) && LCD_E",
         priority   => "set",
      });
       







   e_register->add 
       ({out        => e_signal->add(["RDY", 1]),
         sync_reset => "transaction_request",
         sync_set   => "(counter == 0) && ~LCD_E",
         priority   => "reset",
      });



   e_assign->add ({lhs => ["status_register, 1"], 
                   rhs => &concatenate ("RDY")
                    });
   push (@read_mux_table, "(address == 3)", "status_register");







   e_mux->add ({out   => e_signal->add(["read_mux_out", 32]),
                table => \@read_mux_table,
                type  => "and-or"
               });

  e_register->add ({out => "readdata",
                    in  => "read_mux_out"});
}



