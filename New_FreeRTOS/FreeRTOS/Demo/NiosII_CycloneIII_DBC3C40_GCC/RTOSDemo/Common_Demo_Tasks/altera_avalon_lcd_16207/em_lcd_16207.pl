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

&make_lcd_interface ($project->top(), $project);

$project->output();









sub make_lcd_interface
{
   my ($module, $project) = (@_);
   
   my $Opt = &copy_of_hash($project->WSA());
   
   my $SBI  = $project->SBI("control_slave");






   my $marker = e_default_module_marker->new($module);

   e_port->adds(# Avalon slave ports:
                ["clk",           1,   "in"],
                ["reset_n",       1,   "in"],
                ["address",       2,   "in" ],
                ["writedata",     8,   "in" ],
                ["readdata",      8,   "out"],
                ["write",         1,   "in" ],
                ["begintransfer", 1,   "in" ],


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

   e_avalon_slave->add ({name => "control_slave",});  
}








