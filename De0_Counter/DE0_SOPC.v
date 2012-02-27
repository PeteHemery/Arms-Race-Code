//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2012 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_0_in_arbitrator (
                                        // inputs:
                                         DE0_SOPC_clock_0_in_endofpacket,
                                         DE0_SOPC_clock_0_in_readdata,
                                         DE0_SOPC_clock_0_in_waitrequest,
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_byteenable,
                                         cpu_data_master_read,
                                         cpu_data_master_waitrequest,
                                         cpu_data_master_write,
                                         cpu_data_master_writedata,
                                         reset_n,

                                        // outputs:
                                         DE0_SOPC_clock_0_in_address,
                                         DE0_SOPC_clock_0_in_byteenable,
                                         DE0_SOPC_clock_0_in_endofpacket_from_sa,
                                         DE0_SOPC_clock_0_in_nativeaddress,
                                         DE0_SOPC_clock_0_in_read,
                                         DE0_SOPC_clock_0_in_readdata_from_sa,
                                         DE0_SOPC_clock_0_in_reset_n,
                                         DE0_SOPC_clock_0_in_waitrequest_from_sa,
                                         DE0_SOPC_clock_0_in_write,
                                         DE0_SOPC_clock_0_in_writedata,
                                         cpu_data_master_granted_DE0_SOPC_clock_0_in,
                                         cpu_data_master_qualified_request_DE0_SOPC_clock_0_in,
                                         cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in,
                                         cpu_data_master_requests_DE0_SOPC_clock_0_in,
                                         d1_DE0_SOPC_clock_0_in_end_xfer
                                      )
;

  output  [  3: 0] DE0_SOPC_clock_0_in_address;
  output  [  1: 0] DE0_SOPC_clock_0_in_byteenable;
  output           DE0_SOPC_clock_0_in_endofpacket_from_sa;
  output  [  2: 0] DE0_SOPC_clock_0_in_nativeaddress;
  output           DE0_SOPC_clock_0_in_read;
  output  [ 15: 0] DE0_SOPC_clock_0_in_readdata_from_sa;
  output           DE0_SOPC_clock_0_in_reset_n;
  output           DE0_SOPC_clock_0_in_waitrequest_from_sa;
  output           DE0_SOPC_clock_0_in_write;
  output  [ 15: 0] DE0_SOPC_clock_0_in_writedata;
  output           cpu_data_master_granted_DE0_SOPC_clock_0_in;
  output           cpu_data_master_qualified_request_DE0_SOPC_clock_0_in;
  output           cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in;
  output           cpu_data_master_requests_DE0_SOPC_clock_0_in;
  output           d1_DE0_SOPC_clock_0_in_end_xfer;
  input            DE0_SOPC_clock_0_in_endofpacket;
  input   [ 15: 0] DE0_SOPC_clock_0_in_readdata;
  input            DE0_SOPC_clock_0_in_waitrequest;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  3: 0] DE0_SOPC_clock_0_in_address;
  wire             DE0_SOPC_clock_0_in_allgrants;
  wire             DE0_SOPC_clock_0_in_allow_new_arb_cycle;
  wire             DE0_SOPC_clock_0_in_any_bursting_master_saved_grant;
  wire             DE0_SOPC_clock_0_in_any_continuerequest;
  wire             DE0_SOPC_clock_0_in_arb_counter_enable;
  reg     [  1: 0] DE0_SOPC_clock_0_in_arb_share_counter;
  wire    [  1: 0] DE0_SOPC_clock_0_in_arb_share_counter_next_value;
  wire    [  1: 0] DE0_SOPC_clock_0_in_arb_share_set_values;
  wire             DE0_SOPC_clock_0_in_beginbursttransfer_internal;
  wire             DE0_SOPC_clock_0_in_begins_xfer;
  wire    [  1: 0] DE0_SOPC_clock_0_in_byteenable;
  wire             DE0_SOPC_clock_0_in_end_xfer;
  wire             DE0_SOPC_clock_0_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_0_in_firsttransfer;
  wire             DE0_SOPC_clock_0_in_grant_vector;
  wire             DE0_SOPC_clock_0_in_in_a_read_cycle;
  wire             DE0_SOPC_clock_0_in_in_a_write_cycle;
  wire             DE0_SOPC_clock_0_in_master_qreq_vector;
  wire    [  2: 0] DE0_SOPC_clock_0_in_nativeaddress;
  wire             DE0_SOPC_clock_0_in_non_bursting_master_requests;
  wire             DE0_SOPC_clock_0_in_read;
  wire    [ 15: 0] DE0_SOPC_clock_0_in_readdata_from_sa;
  reg              DE0_SOPC_clock_0_in_reg_firsttransfer;
  wire             DE0_SOPC_clock_0_in_reset_n;
  reg              DE0_SOPC_clock_0_in_slavearbiterlockenable;
  wire             DE0_SOPC_clock_0_in_slavearbiterlockenable2;
  wire             DE0_SOPC_clock_0_in_unreg_firsttransfer;
  wire             DE0_SOPC_clock_0_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_0_in_waits_for_read;
  wire             DE0_SOPC_clock_0_in_waits_for_write;
  wire             DE0_SOPC_clock_0_in_write;
  wire    [ 15: 0] DE0_SOPC_clock_0_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_requests_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_saved_grant_DE0_SOPC_clock_0_in;
  reg              d1_DE0_SOPC_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 25: 0] shifted_address_to_DE0_SOPC_clock_0_in_from_cpu_data_master;
  wire             wait_for_DE0_SOPC_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_SOPC_clock_0_in_end_xfer;
    end


  assign DE0_SOPC_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_DE0_SOPC_clock_0_in));
  //assign DE0_SOPC_clock_0_in_readdata_from_sa = DE0_SOPC_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_0_in_readdata_from_sa = DE0_SOPC_clock_0_in_readdata;

  assign cpu_data_master_requests_DE0_SOPC_clock_0_in = ({cpu_data_master_address_to_slave[25 : 5] , 5'b0} == 26'h2811000) & (cpu_data_master_read | cpu_data_master_write);
  //assign DE0_SOPC_clock_0_in_waitrequest_from_sa = DE0_SOPC_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_0_in_waitrequest_from_sa = DE0_SOPC_clock_0_in_waitrequest;

  //DE0_SOPC_clock_0_in_arb_share_counter set values, which is an e_mux
  assign DE0_SOPC_clock_0_in_arb_share_set_values = 1;

  //DE0_SOPC_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_SOPC_clock_0_in_non_bursting_master_requests = cpu_data_master_requests_DE0_SOPC_clock_0_in;

  //DE0_SOPC_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_SOPC_clock_0_in_any_bursting_master_saved_grant = 0;

  //DE0_SOPC_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_SOPC_clock_0_in_arb_share_counter_next_value = DE0_SOPC_clock_0_in_firsttransfer ? (DE0_SOPC_clock_0_in_arb_share_set_values - 1) : |DE0_SOPC_clock_0_in_arb_share_counter ? (DE0_SOPC_clock_0_in_arb_share_counter - 1) : 0;

  //DE0_SOPC_clock_0_in_allgrants all slave grants, which is an e_mux
  assign DE0_SOPC_clock_0_in_allgrants = |DE0_SOPC_clock_0_in_grant_vector;

  //DE0_SOPC_clock_0_in_end_xfer assignment, which is an e_assign
  assign DE0_SOPC_clock_0_in_end_xfer = ~(DE0_SOPC_clock_0_in_waits_for_read | DE0_SOPC_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in = DE0_SOPC_clock_0_in_end_xfer & (~DE0_SOPC_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_SOPC_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_SOPC_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in & DE0_SOPC_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in & ~DE0_SOPC_clock_0_in_non_bursting_master_requests);

  //DE0_SOPC_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_in_arb_share_counter <= 0;
      else if (DE0_SOPC_clock_0_in_arb_counter_enable)
          DE0_SOPC_clock_0_in_arb_share_counter <= DE0_SOPC_clock_0_in_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|DE0_SOPC_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_0_in & ~DE0_SOPC_clock_0_in_non_bursting_master_requests))
          DE0_SOPC_clock_0_in_slavearbiterlockenable <= |DE0_SOPC_clock_0_in_arb_share_counter_next_value;
    end


  //cpu/data_master DE0_SOPC_clock_0/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = DE0_SOPC_clock_0_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_0_in_slavearbiterlockenable2 = |DE0_SOPC_clock_0_in_arb_share_counter_next_value;

  //cpu/data_master DE0_SOPC_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = DE0_SOPC_clock_0_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //DE0_SOPC_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_SOPC_clock_0_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_DE0_SOPC_clock_0_in = cpu_data_master_requests_DE0_SOPC_clock_0_in & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //DE0_SOPC_clock_0_in_writedata mux, which is an e_mux
  assign DE0_SOPC_clock_0_in_writedata = cpu_data_master_writedata;

  //assign DE0_SOPC_clock_0_in_endofpacket_from_sa = DE0_SOPC_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_0_in_endofpacket_from_sa = DE0_SOPC_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_DE0_SOPC_clock_0_in = cpu_data_master_qualified_request_DE0_SOPC_clock_0_in;

  //cpu/data_master saved-grant DE0_SOPC_clock_0/in, which is an e_assign
  assign cpu_data_master_saved_grant_DE0_SOPC_clock_0_in = cpu_data_master_requests_DE0_SOPC_clock_0_in;

  //allow new arb cycle for DE0_SOPC_clock_0/in, which is an e_assign
  assign DE0_SOPC_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_SOPC_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_SOPC_clock_0_in_master_qreq_vector = 1;

  //DE0_SOPC_clock_0_in_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_0_in_reset_n = reset_n;

  //DE0_SOPC_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_0_in_firsttransfer = DE0_SOPC_clock_0_in_begins_xfer ? DE0_SOPC_clock_0_in_unreg_firsttransfer : DE0_SOPC_clock_0_in_reg_firsttransfer;

  //DE0_SOPC_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_0_in_unreg_firsttransfer = ~(DE0_SOPC_clock_0_in_slavearbiterlockenable & DE0_SOPC_clock_0_in_any_continuerequest);

  //DE0_SOPC_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (DE0_SOPC_clock_0_in_begins_xfer)
          DE0_SOPC_clock_0_in_reg_firsttransfer <= DE0_SOPC_clock_0_in_unreg_firsttransfer;
    end


  //DE0_SOPC_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_SOPC_clock_0_in_beginbursttransfer_internal = DE0_SOPC_clock_0_in_begins_xfer;

  //DE0_SOPC_clock_0_in_read assignment, which is an e_mux
  assign DE0_SOPC_clock_0_in_read = cpu_data_master_granted_DE0_SOPC_clock_0_in & cpu_data_master_read;

  //DE0_SOPC_clock_0_in_write assignment, which is an e_mux
  assign DE0_SOPC_clock_0_in_write = cpu_data_master_granted_DE0_SOPC_clock_0_in & cpu_data_master_write;

  assign shifted_address_to_DE0_SOPC_clock_0_in_from_cpu_data_master = cpu_data_master_address_to_slave;
  //DE0_SOPC_clock_0_in_address mux, which is an e_mux
  assign DE0_SOPC_clock_0_in_address = shifted_address_to_DE0_SOPC_clock_0_in_from_cpu_data_master >> 2;

  //slaveid DE0_SOPC_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_SOPC_clock_0_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_DE0_SOPC_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_SOPC_clock_0_in_end_xfer <= 1;
      else 
        d1_DE0_SOPC_clock_0_in_end_xfer <= DE0_SOPC_clock_0_in_end_xfer;
    end


  //DE0_SOPC_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_SOPC_clock_0_in_waits_for_read = DE0_SOPC_clock_0_in_in_a_read_cycle & DE0_SOPC_clock_0_in_waitrequest_from_sa;

  //DE0_SOPC_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_0_in_in_a_read_cycle = cpu_data_master_granted_DE0_SOPC_clock_0_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_SOPC_clock_0_in_in_a_read_cycle;

  //DE0_SOPC_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_SOPC_clock_0_in_waits_for_write = DE0_SOPC_clock_0_in_in_a_write_cycle & DE0_SOPC_clock_0_in_waitrequest_from_sa;

  //DE0_SOPC_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_0_in_in_a_write_cycle = cpu_data_master_granted_DE0_SOPC_clock_0_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_SOPC_clock_0_in_in_a_write_cycle;

  assign wait_for_DE0_SOPC_clock_0_in_counter = 0;
  //DE0_SOPC_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign DE0_SOPC_clock_0_in_byteenable = (cpu_data_master_granted_DE0_SOPC_clock_0_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_0_out_arbitrator (
                                         // inputs:
                                          DE0_SOPC_clock_0_out_address,
                                          DE0_SOPC_clock_0_out_byteenable,
                                          DE0_SOPC_clock_0_out_granted_pll_s1,
                                          DE0_SOPC_clock_0_out_qualified_request_pll_s1,
                                          DE0_SOPC_clock_0_out_read,
                                          DE0_SOPC_clock_0_out_read_data_valid_pll_s1,
                                          DE0_SOPC_clock_0_out_requests_pll_s1,
                                          DE0_SOPC_clock_0_out_write,
                                          DE0_SOPC_clock_0_out_writedata,
                                          clk,
                                          d1_pll_s1_end_xfer,
                                          pll_s1_readdata_from_sa,
                                          reset_n,

                                         // outputs:
                                          DE0_SOPC_clock_0_out_address_to_slave,
                                          DE0_SOPC_clock_0_out_readdata,
                                          DE0_SOPC_clock_0_out_reset_n,
                                          DE0_SOPC_clock_0_out_waitrequest
                                       )
;

  output  [  3: 0] DE0_SOPC_clock_0_out_address_to_slave;
  output  [ 15: 0] DE0_SOPC_clock_0_out_readdata;
  output           DE0_SOPC_clock_0_out_reset_n;
  output           DE0_SOPC_clock_0_out_waitrequest;
  input   [  3: 0] DE0_SOPC_clock_0_out_address;
  input   [  1: 0] DE0_SOPC_clock_0_out_byteenable;
  input            DE0_SOPC_clock_0_out_granted_pll_s1;
  input            DE0_SOPC_clock_0_out_qualified_request_pll_s1;
  input            DE0_SOPC_clock_0_out_read;
  input            DE0_SOPC_clock_0_out_read_data_valid_pll_s1;
  input            DE0_SOPC_clock_0_out_requests_pll_s1;
  input            DE0_SOPC_clock_0_out_write;
  input   [ 15: 0] DE0_SOPC_clock_0_out_writedata;
  input            clk;
  input            d1_pll_s1_end_xfer;
  input   [ 15: 0] pll_s1_readdata_from_sa;
  input            reset_n;

  reg     [  3: 0] DE0_SOPC_clock_0_out_address_last_time;
  wire    [  3: 0] DE0_SOPC_clock_0_out_address_to_slave;
  reg     [  1: 0] DE0_SOPC_clock_0_out_byteenable_last_time;
  reg              DE0_SOPC_clock_0_out_read_last_time;
  wire    [ 15: 0] DE0_SOPC_clock_0_out_readdata;
  wire             DE0_SOPC_clock_0_out_reset_n;
  wire             DE0_SOPC_clock_0_out_run;
  wire             DE0_SOPC_clock_0_out_waitrequest;
  reg              DE0_SOPC_clock_0_out_write_last_time;
  reg     [ 15: 0] DE0_SOPC_clock_0_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~DE0_SOPC_clock_0_out_qualified_request_pll_s1 | ~DE0_SOPC_clock_0_out_read | (1 & ~d1_pll_s1_end_xfer & DE0_SOPC_clock_0_out_read))) & ((~DE0_SOPC_clock_0_out_qualified_request_pll_s1 | ~DE0_SOPC_clock_0_out_write | (1 & DE0_SOPC_clock_0_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign DE0_SOPC_clock_0_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_SOPC_clock_0_out_address_to_slave = DE0_SOPC_clock_0_out_address;

  //DE0_SOPC_clock_0/out readdata mux, which is an e_mux
  assign DE0_SOPC_clock_0_out_readdata = pll_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_SOPC_clock_0_out_waitrequest = ~DE0_SOPC_clock_0_out_run;

  //DE0_SOPC_clock_0_out_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_out_address_last_time <= 0;
      else 
        DE0_SOPC_clock_0_out_address_last_time <= DE0_SOPC_clock_0_out_address;
    end


  //DE0_SOPC_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_SOPC_clock_0_out_waitrequest & (DE0_SOPC_clock_0_out_read | DE0_SOPC_clock_0_out_write);
    end


  //DE0_SOPC_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_0_out_address != DE0_SOPC_clock_0_out_address_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_out_byteenable_last_time <= 0;
      else 
        DE0_SOPC_clock_0_out_byteenable_last_time <= DE0_SOPC_clock_0_out_byteenable;
    end


  //DE0_SOPC_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_0_out_byteenable != DE0_SOPC_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_out_read_last_time <= 0;
      else 
        DE0_SOPC_clock_0_out_read_last_time <= DE0_SOPC_clock_0_out_read;
    end


  //DE0_SOPC_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_0_out_read != DE0_SOPC_clock_0_out_read_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_out_write_last_time <= 0;
      else 
        DE0_SOPC_clock_0_out_write_last_time <= DE0_SOPC_clock_0_out_write;
    end


  //DE0_SOPC_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_0_out_write != DE0_SOPC_clock_0_out_write_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_0_out_writedata_last_time <= 0;
      else 
        DE0_SOPC_clock_0_out_writedata_last_time <= DE0_SOPC_clock_0_out_writedata;
    end


  //DE0_SOPC_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_0_out_writedata != DE0_SOPC_clock_0_out_writedata_last_time) & DE0_SOPC_clock_0_out_write)
        begin
          $write("%0d ns: DE0_SOPC_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_1_in_arbitrator (
                                        // inputs:
                                         DE0_SOPC_clock_1_in_endofpacket,
                                         DE0_SOPC_clock_1_in_readdata,
                                         DE0_SOPC_clock_1_in_waitrequest,
                                         clk,
                                         clock_crossing_bridge_m1_address_to_slave,
                                         clock_crossing_bridge_m1_byteenable,
                                         clock_crossing_bridge_m1_latency_counter,
                                         clock_crossing_bridge_m1_nativeaddress,
                                         clock_crossing_bridge_m1_read,
                                         clock_crossing_bridge_m1_write,
                                         clock_crossing_bridge_m1_writedata,
                                         reset_n,

                                        // outputs:
                                         DE0_SOPC_clock_1_in_address,
                                         DE0_SOPC_clock_1_in_byteenable,
                                         DE0_SOPC_clock_1_in_endofpacket_from_sa,
                                         DE0_SOPC_clock_1_in_nativeaddress,
                                         DE0_SOPC_clock_1_in_read,
                                         DE0_SOPC_clock_1_in_readdata_from_sa,
                                         DE0_SOPC_clock_1_in_reset_n,
                                         DE0_SOPC_clock_1_in_waitrequest_from_sa,
                                         DE0_SOPC_clock_1_in_write,
                                         DE0_SOPC_clock_1_in_writedata,
                                         clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in,
                                         clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in,
                                         clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in,
                                         clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in,
                                         d1_DE0_SOPC_clock_1_in_end_xfer
                                      )
;

  output  [  3: 0] DE0_SOPC_clock_1_in_address;
  output  [  1: 0] DE0_SOPC_clock_1_in_byteenable;
  output           DE0_SOPC_clock_1_in_endofpacket_from_sa;
  output  [  2: 0] DE0_SOPC_clock_1_in_nativeaddress;
  output           DE0_SOPC_clock_1_in_read;
  output  [ 15: 0] DE0_SOPC_clock_1_in_readdata_from_sa;
  output           DE0_SOPC_clock_1_in_reset_n;
  output           DE0_SOPC_clock_1_in_waitrequest_from_sa;
  output           DE0_SOPC_clock_1_in_write;
  output  [ 15: 0] DE0_SOPC_clock_1_in_writedata;
  output           clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in;
  output           clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in;
  output           clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in;
  output           clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in;
  output           d1_DE0_SOPC_clock_1_in_end_xfer;
  input            DE0_SOPC_clock_1_in_endofpacket;
  input   [ 15: 0] DE0_SOPC_clock_1_in_readdata;
  input            DE0_SOPC_clock_1_in_waitrequest;
  input            clk;
  input   [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  input   [  3: 0] clock_crossing_bridge_m1_byteenable;
  input            clock_crossing_bridge_m1_latency_counter;
  input   [  8: 0] clock_crossing_bridge_m1_nativeaddress;
  input            clock_crossing_bridge_m1_read;
  input            clock_crossing_bridge_m1_write;
  input   [ 31: 0] clock_crossing_bridge_m1_writedata;
  input            reset_n;

  wire    [  3: 0] DE0_SOPC_clock_1_in_address;
  wire             DE0_SOPC_clock_1_in_allgrants;
  wire             DE0_SOPC_clock_1_in_allow_new_arb_cycle;
  wire             DE0_SOPC_clock_1_in_any_bursting_master_saved_grant;
  wire             DE0_SOPC_clock_1_in_any_continuerequest;
  wire             DE0_SOPC_clock_1_in_arb_counter_enable;
  reg              DE0_SOPC_clock_1_in_arb_share_counter;
  wire             DE0_SOPC_clock_1_in_arb_share_counter_next_value;
  wire             DE0_SOPC_clock_1_in_arb_share_set_values;
  wire             DE0_SOPC_clock_1_in_beginbursttransfer_internal;
  wire             DE0_SOPC_clock_1_in_begins_xfer;
  wire    [  1: 0] DE0_SOPC_clock_1_in_byteenable;
  wire             DE0_SOPC_clock_1_in_end_xfer;
  wire             DE0_SOPC_clock_1_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_1_in_firsttransfer;
  wire             DE0_SOPC_clock_1_in_grant_vector;
  wire             DE0_SOPC_clock_1_in_in_a_read_cycle;
  wire             DE0_SOPC_clock_1_in_in_a_write_cycle;
  wire             DE0_SOPC_clock_1_in_master_qreq_vector;
  wire    [  2: 0] DE0_SOPC_clock_1_in_nativeaddress;
  wire             DE0_SOPC_clock_1_in_non_bursting_master_requests;
  wire             DE0_SOPC_clock_1_in_read;
  wire    [ 15: 0] DE0_SOPC_clock_1_in_readdata_from_sa;
  reg              DE0_SOPC_clock_1_in_reg_firsttransfer;
  wire             DE0_SOPC_clock_1_in_reset_n;
  reg              DE0_SOPC_clock_1_in_slavearbiterlockenable;
  wire             DE0_SOPC_clock_1_in_slavearbiterlockenable2;
  wire             DE0_SOPC_clock_1_in_unreg_firsttransfer;
  wire             DE0_SOPC_clock_1_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_1_in_waits_for_read;
  wire             DE0_SOPC_clock_1_in_waits_for_write;
  wire             DE0_SOPC_clock_1_in_write;
  wire    [ 15: 0] DE0_SOPC_clock_1_in_writedata;
  wire             clock_crossing_bridge_m1_arbiterlock;
  wire             clock_crossing_bridge_m1_arbiterlock2;
  wire             clock_crossing_bridge_m1_continuerequest;
  wire             clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in;
  wire             clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in;
  wire             clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in;
  wire             clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in;
  wire             clock_crossing_bridge_m1_saved_grant_DE0_SOPC_clock_1_in;
  reg              d1_DE0_SOPC_clock_1_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_DE0_SOPC_clock_1_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_SOPC_clock_1_in_end_xfer;
    end


  assign DE0_SOPC_clock_1_in_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in));
  //assign DE0_SOPC_clock_1_in_readdata_from_sa = DE0_SOPC_clock_1_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_1_in_readdata_from_sa = DE0_SOPC_clock_1_in_readdata;

  assign clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in = ({clock_crossing_bridge_m1_address_to_slave[10 : 5] , 5'b0} == 11'h440) & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write);
  //assign DE0_SOPC_clock_1_in_waitrequest_from_sa = DE0_SOPC_clock_1_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_1_in_waitrequest_from_sa = DE0_SOPC_clock_1_in_waitrequest;

  //DE0_SOPC_clock_1_in_arb_share_counter set values, which is an e_mux
  assign DE0_SOPC_clock_1_in_arb_share_set_values = 1;

  //DE0_SOPC_clock_1_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_SOPC_clock_1_in_non_bursting_master_requests = clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in;

  //DE0_SOPC_clock_1_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_SOPC_clock_1_in_any_bursting_master_saved_grant = 0;

  //DE0_SOPC_clock_1_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_SOPC_clock_1_in_arb_share_counter_next_value = DE0_SOPC_clock_1_in_firsttransfer ? (DE0_SOPC_clock_1_in_arb_share_set_values - 1) : |DE0_SOPC_clock_1_in_arb_share_counter ? (DE0_SOPC_clock_1_in_arb_share_counter - 1) : 0;

  //DE0_SOPC_clock_1_in_allgrants all slave grants, which is an e_mux
  assign DE0_SOPC_clock_1_in_allgrants = |DE0_SOPC_clock_1_in_grant_vector;

  //DE0_SOPC_clock_1_in_end_xfer assignment, which is an e_assign
  assign DE0_SOPC_clock_1_in_end_xfer = ~(DE0_SOPC_clock_1_in_waits_for_read | DE0_SOPC_clock_1_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in = DE0_SOPC_clock_1_in_end_xfer & (~DE0_SOPC_clock_1_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_SOPC_clock_1_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_SOPC_clock_1_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in & DE0_SOPC_clock_1_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in & ~DE0_SOPC_clock_1_in_non_bursting_master_requests);

  //DE0_SOPC_clock_1_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_in_arb_share_counter <= 0;
      else if (DE0_SOPC_clock_1_in_arb_counter_enable)
          DE0_SOPC_clock_1_in_arb_share_counter <= DE0_SOPC_clock_1_in_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_1_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_in_slavearbiterlockenable <= 0;
      else if ((|DE0_SOPC_clock_1_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_1_in & ~DE0_SOPC_clock_1_in_non_bursting_master_requests))
          DE0_SOPC_clock_1_in_slavearbiterlockenable <= |DE0_SOPC_clock_1_in_arb_share_counter_next_value;
    end


  //clock_crossing_bridge/m1 DE0_SOPC_clock_1/in arbiterlock, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock = DE0_SOPC_clock_1_in_slavearbiterlockenable & clock_crossing_bridge_m1_continuerequest;

  //DE0_SOPC_clock_1_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_1_in_slavearbiterlockenable2 = |DE0_SOPC_clock_1_in_arb_share_counter_next_value;

  //clock_crossing_bridge/m1 DE0_SOPC_clock_1/in arbiterlock2, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock2 = DE0_SOPC_clock_1_in_slavearbiterlockenable2 & clock_crossing_bridge_m1_continuerequest;

  //DE0_SOPC_clock_1_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_SOPC_clock_1_in_any_continuerequest = 1;

  //clock_crossing_bridge_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_bridge_m1_continuerequest = 1;

  assign clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in = clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in & ~((clock_crossing_bridge_m1_read & ((clock_crossing_bridge_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in, which is an e_mux
  assign clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in = clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in & clock_crossing_bridge_m1_read & ~DE0_SOPC_clock_1_in_waits_for_read;

  //DE0_SOPC_clock_1_in_writedata mux, which is an e_mux
  assign DE0_SOPC_clock_1_in_writedata = clock_crossing_bridge_m1_writedata;

  //assign DE0_SOPC_clock_1_in_endofpacket_from_sa = DE0_SOPC_clock_1_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_1_in_endofpacket_from_sa = DE0_SOPC_clock_1_in_endofpacket;

  //master is always granted when requested
  assign clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in = clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in;

  //clock_crossing_bridge/m1 saved-grant DE0_SOPC_clock_1/in, which is an e_assign
  assign clock_crossing_bridge_m1_saved_grant_DE0_SOPC_clock_1_in = clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in;

  //allow new arb cycle for DE0_SOPC_clock_1/in, which is an e_assign
  assign DE0_SOPC_clock_1_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_SOPC_clock_1_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_SOPC_clock_1_in_master_qreq_vector = 1;

  //DE0_SOPC_clock_1_in_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_1_in_reset_n = reset_n;

  //DE0_SOPC_clock_1_in_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_1_in_firsttransfer = DE0_SOPC_clock_1_in_begins_xfer ? DE0_SOPC_clock_1_in_unreg_firsttransfer : DE0_SOPC_clock_1_in_reg_firsttransfer;

  //DE0_SOPC_clock_1_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_1_in_unreg_firsttransfer = ~(DE0_SOPC_clock_1_in_slavearbiterlockenable & DE0_SOPC_clock_1_in_any_continuerequest);

  //DE0_SOPC_clock_1_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_in_reg_firsttransfer <= 1'b1;
      else if (DE0_SOPC_clock_1_in_begins_xfer)
          DE0_SOPC_clock_1_in_reg_firsttransfer <= DE0_SOPC_clock_1_in_unreg_firsttransfer;
    end


  //DE0_SOPC_clock_1_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_SOPC_clock_1_in_beginbursttransfer_internal = DE0_SOPC_clock_1_in_begins_xfer;

  //DE0_SOPC_clock_1_in_read assignment, which is an e_mux
  assign DE0_SOPC_clock_1_in_read = clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in & clock_crossing_bridge_m1_read;

  //DE0_SOPC_clock_1_in_write assignment, which is an e_mux
  assign DE0_SOPC_clock_1_in_write = clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in & clock_crossing_bridge_m1_write;

  //DE0_SOPC_clock_1_in_address mux, which is an e_mux
  assign DE0_SOPC_clock_1_in_address = clock_crossing_bridge_m1_address_to_slave;

  //slaveid DE0_SOPC_clock_1_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_SOPC_clock_1_in_nativeaddress = clock_crossing_bridge_m1_nativeaddress;

  //d1_DE0_SOPC_clock_1_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_SOPC_clock_1_in_end_xfer <= 1;
      else 
        d1_DE0_SOPC_clock_1_in_end_xfer <= DE0_SOPC_clock_1_in_end_xfer;
    end


  //DE0_SOPC_clock_1_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_SOPC_clock_1_in_waits_for_read = DE0_SOPC_clock_1_in_in_a_read_cycle & DE0_SOPC_clock_1_in_waitrequest_from_sa;

  //DE0_SOPC_clock_1_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_1_in_in_a_read_cycle = clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in & clock_crossing_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_SOPC_clock_1_in_in_a_read_cycle;

  //DE0_SOPC_clock_1_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_SOPC_clock_1_in_waits_for_write = DE0_SOPC_clock_1_in_in_a_write_cycle & DE0_SOPC_clock_1_in_waitrequest_from_sa;

  //DE0_SOPC_clock_1_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_1_in_in_a_write_cycle = clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in & clock_crossing_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_SOPC_clock_1_in_in_a_write_cycle;

  assign wait_for_DE0_SOPC_clock_1_in_counter = 0;
  //DE0_SOPC_clock_1_in_byteenable byte enable port mux, which is an e_mux
  assign DE0_SOPC_clock_1_in_byteenable = (clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in)? clock_crossing_bridge_m1_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_1/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_1_out_arbitrator (
                                         // inputs:
                                          DE0_SOPC_clock_1_out_address,
                                          DE0_SOPC_clock_1_out_byteenable,
                                          DE0_SOPC_clock_1_out_granted_timer_0_s1,
                                          DE0_SOPC_clock_1_out_qualified_request_timer_0_s1,
                                          DE0_SOPC_clock_1_out_read,
                                          DE0_SOPC_clock_1_out_read_data_valid_timer_0_s1,
                                          DE0_SOPC_clock_1_out_requests_timer_0_s1,
                                          DE0_SOPC_clock_1_out_write,
                                          DE0_SOPC_clock_1_out_writedata,
                                          clk,
                                          d1_timer_0_s1_end_xfer,
                                          reset_n,
                                          timer_0_s1_readdata_from_sa,

                                         // outputs:
                                          DE0_SOPC_clock_1_out_address_to_slave,
                                          DE0_SOPC_clock_1_out_readdata,
                                          DE0_SOPC_clock_1_out_reset_n,
                                          DE0_SOPC_clock_1_out_waitrequest
                                       )
;

  output  [  3: 0] DE0_SOPC_clock_1_out_address_to_slave;
  output  [ 15: 0] DE0_SOPC_clock_1_out_readdata;
  output           DE0_SOPC_clock_1_out_reset_n;
  output           DE0_SOPC_clock_1_out_waitrequest;
  input   [  3: 0] DE0_SOPC_clock_1_out_address;
  input   [  1: 0] DE0_SOPC_clock_1_out_byteenable;
  input            DE0_SOPC_clock_1_out_granted_timer_0_s1;
  input            DE0_SOPC_clock_1_out_qualified_request_timer_0_s1;
  input            DE0_SOPC_clock_1_out_read;
  input            DE0_SOPC_clock_1_out_read_data_valid_timer_0_s1;
  input            DE0_SOPC_clock_1_out_requests_timer_0_s1;
  input            DE0_SOPC_clock_1_out_write;
  input   [ 15: 0] DE0_SOPC_clock_1_out_writedata;
  input            clk;
  input            d1_timer_0_s1_end_xfer;
  input            reset_n;
  input   [ 15: 0] timer_0_s1_readdata_from_sa;

  reg     [  3: 0] DE0_SOPC_clock_1_out_address_last_time;
  wire    [  3: 0] DE0_SOPC_clock_1_out_address_to_slave;
  reg     [  1: 0] DE0_SOPC_clock_1_out_byteenable_last_time;
  reg              DE0_SOPC_clock_1_out_read_last_time;
  wire    [ 15: 0] DE0_SOPC_clock_1_out_readdata;
  wire             DE0_SOPC_clock_1_out_reset_n;
  wire             DE0_SOPC_clock_1_out_run;
  wire             DE0_SOPC_clock_1_out_waitrequest;
  reg              DE0_SOPC_clock_1_out_write_last_time;
  reg     [ 15: 0] DE0_SOPC_clock_1_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_2;
  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & ((~DE0_SOPC_clock_1_out_qualified_request_timer_0_s1 | ~DE0_SOPC_clock_1_out_read | (1 & ~d1_timer_0_s1_end_xfer & DE0_SOPC_clock_1_out_read))) & ((~DE0_SOPC_clock_1_out_qualified_request_timer_0_s1 | ~DE0_SOPC_clock_1_out_write | (1 & DE0_SOPC_clock_1_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign DE0_SOPC_clock_1_out_run = r_2;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_SOPC_clock_1_out_address_to_slave = DE0_SOPC_clock_1_out_address;

  //DE0_SOPC_clock_1/out readdata mux, which is an e_mux
  assign DE0_SOPC_clock_1_out_readdata = timer_0_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_SOPC_clock_1_out_waitrequest = ~DE0_SOPC_clock_1_out_run;

  //DE0_SOPC_clock_1_out_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_1_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_1_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_out_address_last_time <= 0;
      else 
        DE0_SOPC_clock_1_out_address_last_time <= DE0_SOPC_clock_1_out_address;
    end


  //DE0_SOPC_clock_1/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_SOPC_clock_1_out_waitrequest & (DE0_SOPC_clock_1_out_read | DE0_SOPC_clock_1_out_write);
    end


  //DE0_SOPC_clock_1_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_1_out_address != DE0_SOPC_clock_1_out_address_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_1_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_1_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_out_byteenable_last_time <= 0;
      else 
        DE0_SOPC_clock_1_out_byteenable_last_time <= DE0_SOPC_clock_1_out_byteenable;
    end


  //DE0_SOPC_clock_1_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_1_out_byteenable != DE0_SOPC_clock_1_out_byteenable_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_1_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_1_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_out_read_last_time <= 0;
      else 
        DE0_SOPC_clock_1_out_read_last_time <= DE0_SOPC_clock_1_out_read;
    end


  //DE0_SOPC_clock_1_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_1_out_read != DE0_SOPC_clock_1_out_read_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_1_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_1_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_out_write_last_time <= 0;
      else 
        DE0_SOPC_clock_1_out_write_last_time <= DE0_SOPC_clock_1_out_write;
    end


  //DE0_SOPC_clock_1_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_1_out_write != DE0_SOPC_clock_1_out_write_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_1_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_1_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_1_out_writedata_last_time <= 0;
      else 
        DE0_SOPC_clock_1_out_writedata_last_time <= DE0_SOPC_clock_1_out_writedata;
    end


  //DE0_SOPC_clock_1_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_1_out_writedata != DE0_SOPC_clock_1_out_writedata_last_time) & DE0_SOPC_clock_1_out_write)
        begin
          $write("%0d ns: DE0_SOPC_clock_1_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_2_in_arbitrator (
                                        // inputs:
                                         DE0_SOPC_clock_2_in_endofpacket,
                                         DE0_SOPC_clock_2_in_readdata,
                                         DE0_SOPC_clock_2_in_waitrequest,
                                         clk,
                                         clock_crossing_bridge_m1_address_to_slave,
                                         clock_crossing_bridge_m1_byteenable,
                                         clock_crossing_bridge_m1_latency_counter,
                                         clock_crossing_bridge_m1_nativeaddress,
                                         clock_crossing_bridge_m1_read,
                                         clock_crossing_bridge_m1_write,
                                         clock_crossing_bridge_m1_writedata,
                                         reset_n,

                                        // outputs:
                                         DE0_SOPC_clock_2_in_address,
                                         DE0_SOPC_clock_2_in_byteenable,
                                         DE0_SOPC_clock_2_in_endofpacket_from_sa,
                                         DE0_SOPC_clock_2_in_nativeaddress,
                                         DE0_SOPC_clock_2_in_read,
                                         DE0_SOPC_clock_2_in_readdata_from_sa,
                                         DE0_SOPC_clock_2_in_reset_n,
                                         DE0_SOPC_clock_2_in_waitrequest_from_sa,
                                         DE0_SOPC_clock_2_in_write,
                                         DE0_SOPC_clock_2_in_writedata,
                                         clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in,
                                         clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in,
                                         clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in,
                                         clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in,
                                         d1_DE0_SOPC_clock_2_in_end_xfer
                                      )
;

  output  [  9: 0] DE0_SOPC_clock_2_in_address;
  output  [  3: 0] DE0_SOPC_clock_2_in_byteenable;
  output           DE0_SOPC_clock_2_in_endofpacket_from_sa;
  output  [  7: 0] DE0_SOPC_clock_2_in_nativeaddress;
  output           DE0_SOPC_clock_2_in_read;
  output  [ 31: 0] DE0_SOPC_clock_2_in_readdata_from_sa;
  output           DE0_SOPC_clock_2_in_reset_n;
  output           DE0_SOPC_clock_2_in_waitrequest_from_sa;
  output           DE0_SOPC_clock_2_in_write;
  output  [ 31: 0] DE0_SOPC_clock_2_in_writedata;
  output           clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in;
  output           clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in;
  output           clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in;
  output           clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in;
  output           d1_DE0_SOPC_clock_2_in_end_xfer;
  input            DE0_SOPC_clock_2_in_endofpacket;
  input   [ 31: 0] DE0_SOPC_clock_2_in_readdata;
  input            DE0_SOPC_clock_2_in_waitrequest;
  input            clk;
  input   [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  input   [  3: 0] clock_crossing_bridge_m1_byteenable;
  input            clock_crossing_bridge_m1_latency_counter;
  input   [  8: 0] clock_crossing_bridge_m1_nativeaddress;
  input            clock_crossing_bridge_m1_read;
  input            clock_crossing_bridge_m1_write;
  input   [ 31: 0] clock_crossing_bridge_m1_writedata;
  input            reset_n;

  wire    [  9: 0] DE0_SOPC_clock_2_in_address;
  wire             DE0_SOPC_clock_2_in_allgrants;
  wire             DE0_SOPC_clock_2_in_allow_new_arb_cycle;
  wire             DE0_SOPC_clock_2_in_any_bursting_master_saved_grant;
  wire             DE0_SOPC_clock_2_in_any_continuerequest;
  wire             DE0_SOPC_clock_2_in_arb_counter_enable;
  reg              DE0_SOPC_clock_2_in_arb_share_counter;
  wire             DE0_SOPC_clock_2_in_arb_share_counter_next_value;
  wire             DE0_SOPC_clock_2_in_arb_share_set_values;
  wire             DE0_SOPC_clock_2_in_beginbursttransfer_internal;
  wire             DE0_SOPC_clock_2_in_begins_xfer;
  wire    [  3: 0] DE0_SOPC_clock_2_in_byteenable;
  wire             DE0_SOPC_clock_2_in_end_xfer;
  wire             DE0_SOPC_clock_2_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_2_in_firsttransfer;
  wire             DE0_SOPC_clock_2_in_grant_vector;
  wire             DE0_SOPC_clock_2_in_in_a_read_cycle;
  wire             DE0_SOPC_clock_2_in_in_a_write_cycle;
  wire             DE0_SOPC_clock_2_in_master_qreq_vector;
  wire    [  7: 0] DE0_SOPC_clock_2_in_nativeaddress;
  wire             DE0_SOPC_clock_2_in_non_bursting_master_requests;
  wire             DE0_SOPC_clock_2_in_read;
  wire    [ 31: 0] DE0_SOPC_clock_2_in_readdata_from_sa;
  reg              DE0_SOPC_clock_2_in_reg_firsttransfer;
  wire             DE0_SOPC_clock_2_in_reset_n;
  reg              DE0_SOPC_clock_2_in_slavearbiterlockenable;
  wire             DE0_SOPC_clock_2_in_slavearbiterlockenable2;
  wire             DE0_SOPC_clock_2_in_unreg_firsttransfer;
  wire             DE0_SOPC_clock_2_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_2_in_waits_for_read;
  wire             DE0_SOPC_clock_2_in_waits_for_write;
  wire             DE0_SOPC_clock_2_in_write;
  wire    [ 31: 0] DE0_SOPC_clock_2_in_writedata;
  wire             clock_crossing_bridge_m1_arbiterlock;
  wire             clock_crossing_bridge_m1_arbiterlock2;
  wire             clock_crossing_bridge_m1_continuerequest;
  wire             clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in;
  wire             clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in;
  wire             clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in;
  wire             clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in;
  wire             clock_crossing_bridge_m1_saved_grant_DE0_SOPC_clock_2_in;
  reg              d1_DE0_SOPC_clock_2_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_DE0_SOPC_clock_2_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DE0_SOPC_clock_2_in_end_xfer;
    end


  assign DE0_SOPC_clock_2_in_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in));
  //assign DE0_SOPC_clock_2_in_readdata_from_sa = DE0_SOPC_clock_2_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_2_in_readdata_from_sa = DE0_SOPC_clock_2_in_readdata;

  assign clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in = ({clock_crossing_bridge_m1_address_to_slave[10] , 10'b0} == 11'h0) & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write);
  //assign DE0_SOPC_clock_2_in_waitrequest_from_sa = DE0_SOPC_clock_2_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_2_in_waitrequest_from_sa = DE0_SOPC_clock_2_in_waitrequest;

  //DE0_SOPC_clock_2_in_arb_share_counter set values, which is an e_mux
  assign DE0_SOPC_clock_2_in_arb_share_set_values = 1;

  //DE0_SOPC_clock_2_in_non_bursting_master_requests mux, which is an e_mux
  assign DE0_SOPC_clock_2_in_non_bursting_master_requests = clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in;

  //DE0_SOPC_clock_2_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign DE0_SOPC_clock_2_in_any_bursting_master_saved_grant = 0;

  //DE0_SOPC_clock_2_in_arb_share_counter_next_value assignment, which is an e_assign
  assign DE0_SOPC_clock_2_in_arb_share_counter_next_value = DE0_SOPC_clock_2_in_firsttransfer ? (DE0_SOPC_clock_2_in_arb_share_set_values - 1) : |DE0_SOPC_clock_2_in_arb_share_counter ? (DE0_SOPC_clock_2_in_arb_share_counter - 1) : 0;

  //DE0_SOPC_clock_2_in_allgrants all slave grants, which is an e_mux
  assign DE0_SOPC_clock_2_in_allgrants = |DE0_SOPC_clock_2_in_grant_vector;

  //DE0_SOPC_clock_2_in_end_xfer assignment, which is an e_assign
  assign DE0_SOPC_clock_2_in_end_xfer = ~(DE0_SOPC_clock_2_in_waits_for_read | DE0_SOPC_clock_2_in_waits_for_write);

  //end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in = DE0_SOPC_clock_2_in_end_xfer & (~DE0_SOPC_clock_2_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DE0_SOPC_clock_2_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign DE0_SOPC_clock_2_in_arb_counter_enable = (end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in & DE0_SOPC_clock_2_in_allgrants) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in & ~DE0_SOPC_clock_2_in_non_bursting_master_requests);

  //DE0_SOPC_clock_2_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_in_arb_share_counter <= 0;
      else if (DE0_SOPC_clock_2_in_arb_counter_enable)
          DE0_SOPC_clock_2_in_arb_share_counter <= DE0_SOPC_clock_2_in_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_2_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_in_slavearbiterlockenable <= 0;
      else if ((|DE0_SOPC_clock_2_in_master_qreq_vector & end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in) | (end_xfer_arb_share_counter_term_DE0_SOPC_clock_2_in & ~DE0_SOPC_clock_2_in_non_bursting_master_requests))
          DE0_SOPC_clock_2_in_slavearbiterlockenable <= |DE0_SOPC_clock_2_in_arb_share_counter_next_value;
    end


  //clock_crossing_bridge/m1 DE0_SOPC_clock_2/in arbiterlock, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock = DE0_SOPC_clock_2_in_slavearbiterlockenable & clock_crossing_bridge_m1_continuerequest;

  //DE0_SOPC_clock_2_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_2_in_slavearbiterlockenable2 = |DE0_SOPC_clock_2_in_arb_share_counter_next_value;

  //clock_crossing_bridge/m1 DE0_SOPC_clock_2/in arbiterlock2, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock2 = DE0_SOPC_clock_2_in_slavearbiterlockenable2 & clock_crossing_bridge_m1_continuerequest;

  //DE0_SOPC_clock_2_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DE0_SOPC_clock_2_in_any_continuerequest = 1;

  //clock_crossing_bridge_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_bridge_m1_continuerequest = 1;

  assign clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in = clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in & ~((clock_crossing_bridge_m1_read & ((clock_crossing_bridge_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in, which is an e_mux
  assign clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in = clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in & clock_crossing_bridge_m1_read & ~DE0_SOPC_clock_2_in_waits_for_read;

  //DE0_SOPC_clock_2_in_writedata mux, which is an e_mux
  assign DE0_SOPC_clock_2_in_writedata = clock_crossing_bridge_m1_writedata;

  //assign DE0_SOPC_clock_2_in_endofpacket_from_sa = DE0_SOPC_clock_2_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DE0_SOPC_clock_2_in_endofpacket_from_sa = DE0_SOPC_clock_2_in_endofpacket;

  //master is always granted when requested
  assign clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in = clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in;

  //clock_crossing_bridge/m1 saved-grant DE0_SOPC_clock_2/in, which is an e_assign
  assign clock_crossing_bridge_m1_saved_grant_DE0_SOPC_clock_2_in = clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in;

  //allow new arb cycle for DE0_SOPC_clock_2/in, which is an e_assign
  assign DE0_SOPC_clock_2_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DE0_SOPC_clock_2_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DE0_SOPC_clock_2_in_master_qreq_vector = 1;

  //DE0_SOPC_clock_2_in_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_2_in_reset_n = reset_n;

  //DE0_SOPC_clock_2_in_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_2_in_firsttransfer = DE0_SOPC_clock_2_in_begins_xfer ? DE0_SOPC_clock_2_in_unreg_firsttransfer : DE0_SOPC_clock_2_in_reg_firsttransfer;

  //DE0_SOPC_clock_2_in_unreg_firsttransfer first transaction, which is an e_assign
  assign DE0_SOPC_clock_2_in_unreg_firsttransfer = ~(DE0_SOPC_clock_2_in_slavearbiterlockenable & DE0_SOPC_clock_2_in_any_continuerequest);

  //DE0_SOPC_clock_2_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_in_reg_firsttransfer <= 1'b1;
      else if (DE0_SOPC_clock_2_in_begins_xfer)
          DE0_SOPC_clock_2_in_reg_firsttransfer <= DE0_SOPC_clock_2_in_unreg_firsttransfer;
    end


  //DE0_SOPC_clock_2_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DE0_SOPC_clock_2_in_beginbursttransfer_internal = DE0_SOPC_clock_2_in_begins_xfer;

  //DE0_SOPC_clock_2_in_read assignment, which is an e_mux
  assign DE0_SOPC_clock_2_in_read = clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in & clock_crossing_bridge_m1_read;

  //DE0_SOPC_clock_2_in_write assignment, which is an e_mux
  assign DE0_SOPC_clock_2_in_write = clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in & clock_crossing_bridge_m1_write;

  //DE0_SOPC_clock_2_in_address mux, which is an e_mux
  assign DE0_SOPC_clock_2_in_address = clock_crossing_bridge_m1_address_to_slave;

  //slaveid DE0_SOPC_clock_2_in_nativeaddress nativeaddress mux, which is an e_mux
  assign DE0_SOPC_clock_2_in_nativeaddress = clock_crossing_bridge_m1_nativeaddress;

  //d1_DE0_SOPC_clock_2_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DE0_SOPC_clock_2_in_end_xfer <= 1;
      else 
        d1_DE0_SOPC_clock_2_in_end_xfer <= DE0_SOPC_clock_2_in_end_xfer;
    end


  //DE0_SOPC_clock_2_in_waits_for_read in a cycle, which is an e_mux
  assign DE0_SOPC_clock_2_in_waits_for_read = DE0_SOPC_clock_2_in_in_a_read_cycle & DE0_SOPC_clock_2_in_waitrequest_from_sa;

  //DE0_SOPC_clock_2_in_in_a_read_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_2_in_in_a_read_cycle = clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in & clock_crossing_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DE0_SOPC_clock_2_in_in_a_read_cycle;

  //DE0_SOPC_clock_2_in_waits_for_write in a cycle, which is an e_mux
  assign DE0_SOPC_clock_2_in_waits_for_write = DE0_SOPC_clock_2_in_in_a_write_cycle & DE0_SOPC_clock_2_in_waitrequest_from_sa;

  //DE0_SOPC_clock_2_in_in_a_write_cycle assignment, which is an e_assign
  assign DE0_SOPC_clock_2_in_in_a_write_cycle = clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in & clock_crossing_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DE0_SOPC_clock_2_in_in_a_write_cycle;

  assign wait_for_DE0_SOPC_clock_2_in_counter = 0;
  //DE0_SOPC_clock_2_in_byteenable byte enable port mux, which is an e_mux
  assign DE0_SOPC_clock_2_in_byteenable = (clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in)? clock_crossing_bridge_m1_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_2/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_clock_2_out_arbitrator (
                                         // inputs:
                                          DE0_SOPC_clock_2_out_address,
                                          DE0_SOPC_clock_2_out_byteenable,
                                          DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave,
                                          DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave,
                                          DE0_SOPC_clock_2_out_read,
                                          DE0_SOPC_clock_2_out_read_data_valid_SD_CARD_Interface_avalon_slave,
                                          DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave,
                                          DE0_SOPC_clock_2_out_write,
                                          DE0_SOPC_clock_2_out_writedata,
                                          SD_CARD_Interface_avalon_slave_readdata_from_sa,
                                          SD_CARD_Interface_avalon_slave_waitrequest_from_sa,
                                          clk,
                                          d1_SD_CARD_Interface_avalon_slave_end_xfer,
                                          reset_n,

                                         // outputs:
                                          DE0_SOPC_clock_2_out_address_to_slave,
                                          DE0_SOPC_clock_2_out_readdata,
                                          DE0_SOPC_clock_2_out_reset_n,
                                          DE0_SOPC_clock_2_out_waitrequest
                                       )
;

  output  [  9: 0] DE0_SOPC_clock_2_out_address_to_slave;
  output  [ 31: 0] DE0_SOPC_clock_2_out_readdata;
  output           DE0_SOPC_clock_2_out_reset_n;
  output           DE0_SOPC_clock_2_out_waitrequest;
  input   [  9: 0] DE0_SOPC_clock_2_out_address;
  input   [  3: 0] DE0_SOPC_clock_2_out_byteenable;
  input            DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave;
  input            DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave;
  input            DE0_SOPC_clock_2_out_read;
  input            DE0_SOPC_clock_2_out_read_data_valid_SD_CARD_Interface_avalon_slave;
  input            DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave;
  input            DE0_SOPC_clock_2_out_write;
  input   [ 31: 0] DE0_SOPC_clock_2_out_writedata;
  input   [ 31: 0] SD_CARD_Interface_avalon_slave_readdata_from_sa;
  input            SD_CARD_Interface_avalon_slave_waitrequest_from_sa;
  input            clk;
  input            d1_SD_CARD_Interface_avalon_slave_end_xfer;
  input            reset_n;

  reg     [  9: 0] DE0_SOPC_clock_2_out_address_last_time;
  wire    [  9: 0] DE0_SOPC_clock_2_out_address_to_slave;
  reg     [  3: 0] DE0_SOPC_clock_2_out_byteenable_last_time;
  reg              DE0_SOPC_clock_2_out_read_last_time;
  wire    [ 31: 0] DE0_SOPC_clock_2_out_readdata;
  wire             DE0_SOPC_clock_2_out_reset_n;
  wire             DE0_SOPC_clock_2_out_run;
  wire             DE0_SOPC_clock_2_out_waitrequest;
  reg              DE0_SOPC_clock_2_out_write_last_time;
  reg     [ 31: 0] DE0_SOPC_clock_2_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave | ~(DE0_SOPC_clock_2_out_read | DE0_SOPC_clock_2_out_write) | (1 & ~SD_CARD_Interface_avalon_slave_waitrequest_from_sa & (DE0_SOPC_clock_2_out_read | DE0_SOPC_clock_2_out_write)))) & ((~DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave | ~(DE0_SOPC_clock_2_out_read | DE0_SOPC_clock_2_out_write) | (1 & ~SD_CARD_Interface_avalon_slave_waitrequest_from_sa & (DE0_SOPC_clock_2_out_read | DE0_SOPC_clock_2_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign DE0_SOPC_clock_2_out_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign DE0_SOPC_clock_2_out_address_to_slave = DE0_SOPC_clock_2_out_address;

  //DE0_SOPC_clock_2/out readdata mux, which is an e_mux
  assign DE0_SOPC_clock_2_out_readdata = SD_CARD_Interface_avalon_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign DE0_SOPC_clock_2_out_waitrequest = ~DE0_SOPC_clock_2_out_run;

  //DE0_SOPC_clock_2_out_reset_n assignment, which is an e_assign
  assign DE0_SOPC_clock_2_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DE0_SOPC_clock_2_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_out_address_last_time <= 0;
      else 
        DE0_SOPC_clock_2_out_address_last_time <= DE0_SOPC_clock_2_out_address;
    end


  //DE0_SOPC_clock_2/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= DE0_SOPC_clock_2_out_waitrequest & (DE0_SOPC_clock_2_out_read | DE0_SOPC_clock_2_out_write);
    end


  //DE0_SOPC_clock_2_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_2_out_address != DE0_SOPC_clock_2_out_address_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_2_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_2_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_out_byteenable_last_time <= 0;
      else 
        DE0_SOPC_clock_2_out_byteenable_last_time <= DE0_SOPC_clock_2_out_byteenable;
    end


  //DE0_SOPC_clock_2_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_2_out_byteenable != DE0_SOPC_clock_2_out_byteenable_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_2_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_2_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_out_read_last_time <= 0;
      else 
        DE0_SOPC_clock_2_out_read_last_time <= DE0_SOPC_clock_2_out_read;
    end


  //DE0_SOPC_clock_2_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_2_out_read != DE0_SOPC_clock_2_out_read_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_2_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_2_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_out_write_last_time <= 0;
      else 
        DE0_SOPC_clock_2_out_write_last_time <= DE0_SOPC_clock_2_out_write;
    end


  //DE0_SOPC_clock_2_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_2_out_write != DE0_SOPC_clock_2_out_write_last_time))
        begin
          $write("%0d ns: DE0_SOPC_clock_2_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //DE0_SOPC_clock_2_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DE0_SOPC_clock_2_out_writedata_last_time <= 0;
      else 
        DE0_SOPC_clock_2_out_writedata_last_time <= DE0_SOPC_clock_2_out_writedata;
    end


  //DE0_SOPC_clock_2_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (DE0_SOPC_clock_2_out_writedata != DE0_SOPC_clock_2_out_writedata_last_time) & DE0_SOPC_clock_2_out_write)
        begin
          $write("%0d ns: DE0_SOPC_clock_2_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SD_CARD_Interface_avalon_slave_arbitrator (
                                                   // inputs:
                                                    DE0_SOPC_clock_2_out_address_to_slave,
                                                    DE0_SOPC_clock_2_out_byteenable,
                                                    DE0_SOPC_clock_2_out_read,
                                                    DE0_SOPC_clock_2_out_write,
                                                    DE0_SOPC_clock_2_out_writedata,
                                                    SD_CARD_Interface_avalon_slave_readdata,
                                                    SD_CARD_Interface_avalon_slave_waitrequest,
                                                    clk,
                                                    reset_n,

                                                   // outputs:
                                                    DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave,
                                                    DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave,
                                                    DE0_SOPC_clock_2_out_read_data_valid_SD_CARD_Interface_avalon_slave,
                                                    DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave,
                                                    SD_CARD_Interface_avalon_slave_address,
                                                    SD_CARD_Interface_avalon_slave_byteenable,
                                                    SD_CARD_Interface_avalon_slave_chipselect,
                                                    SD_CARD_Interface_avalon_slave_read,
                                                    SD_CARD_Interface_avalon_slave_readdata_from_sa,
                                                    SD_CARD_Interface_avalon_slave_reset_n,
                                                    SD_CARD_Interface_avalon_slave_waitrequest_from_sa,
                                                    SD_CARD_Interface_avalon_slave_write,
                                                    SD_CARD_Interface_avalon_slave_writedata,
                                                    d1_SD_CARD_Interface_avalon_slave_end_xfer
                                                 )
;

  output           DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave;
  output           DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave;
  output           DE0_SOPC_clock_2_out_read_data_valid_SD_CARD_Interface_avalon_slave;
  output           DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave;
  output  [  7: 0] SD_CARD_Interface_avalon_slave_address;
  output  [  3: 0] SD_CARD_Interface_avalon_slave_byteenable;
  output           SD_CARD_Interface_avalon_slave_chipselect;
  output           SD_CARD_Interface_avalon_slave_read;
  output  [ 31: 0] SD_CARD_Interface_avalon_slave_readdata_from_sa;
  output           SD_CARD_Interface_avalon_slave_reset_n;
  output           SD_CARD_Interface_avalon_slave_waitrequest_from_sa;
  output           SD_CARD_Interface_avalon_slave_write;
  output  [ 31: 0] SD_CARD_Interface_avalon_slave_writedata;
  output           d1_SD_CARD_Interface_avalon_slave_end_xfer;
  input   [  9: 0] DE0_SOPC_clock_2_out_address_to_slave;
  input   [  3: 0] DE0_SOPC_clock_2_out_byteenable;
  input            DE0_SOPC_clock_2_out_read;
  input            DE0_SOPC_clock_2_out_write;
  input   [ 31: 0] DE0_SOPC_clock_2_out_writedata;
  input   [ 31: 0] SD_CARD_Interface_avalon_slave_readdata;
  input            SD_CARD_Interface_avalon_slave_waitrequest;
  input            clk;
  input            reset_n;

  wire             DE0_SOPC_clock_2_out_arbiterlock;
  wire             DE0_SOPC_clock_2_out_arbiterlock2;
  wire             DE0_SOPC_clock_2_out_continuerequest;
  wire             DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave;
  wire             DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave;
  wire             DE0_SOPC_clock_2_out_read_data_valid_SD_CARD_Interface_avalon_slave;
  wire             DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave;
  wire             DE0_SOPC_clock_2_out_saved_grant_SD_CARD_Interface_avalon_slave;
  wire    [  7: 0] SD_CARD_Interface_avalon_slave_address;
  wire             SD_CARD_Interface_avalon_slave_allgrants;
  wire             SD_CARD_Interface_avalon_slave_allow_new_arb_cycle;
  wire             SD_CARD_Interface_avalon_slave_any_bursting_master_saved_grant;
  wire             SD_CARD_Interface_avalon_slave_any_continuerequest;
  wire             SD_CARD_Interface_avalon_slave_arb_counter_enable;
  reg              SD_CARD_Interface_avalon_slave_arb_share_counter;
  wire             SD_CARD_Interface_avalon_slave_arb_share_counter_next_value;
  wire             SD_CARD_Interface_avalon_slave_arb_share_set_values;
  wire             SD_CARD_Interface_avalon_slave_beginbursttransfer_internal;
  wire             SD_CARD_Interface_avalon_slave_begins_xfer;
  wire    [  3: 0] SD_CARD_Interface_avalon_slave_byteenable;
  wire             SD_CARD_Interface_avalon_slave_chipselect;
  wire             SD_CARD_Interface_avalon_slave_end_xfer;
  wire             SD_CARD_Interface_avalon_slave_firsttransfer;
  wire             SD_CARD_Interface_avalon_slave_grant_vector;
  wire             SD_CARD_Interface_avalon_slave_in_a_read_cycle;
  wire             SD_CARD_Interface_avalon_slave_in_a_write_cycle;
  wire             SD_CARD_Interface_avalon_slave_master_qreq_vector;
  wire             SD_CARD_Interface_avalon_slave_non_bursting_master_requests;
  wire             SD_CARD_Interface_avalon_slave_read;
  wire    [ 31: 0] SD_CARD_Interface_avalon_slave_readdata_from_sa;
  reg              SD_CARD_Interface_avalon_slave_reg_firsttransfer;
  wire             SD_CARD_Interface_avalon_slave_reset_n;
  reg              SD_CARD_Interface_avalon_slave_slavearbiterlockenable;
  wire             SD_CARD_Interface_avalon_slave_slavearbiterlockenable2;
  wire             SD_CARD_Interface_avalon_slave_unreg_firsttransfer;
  wire             SD_CARD_Interface_avalon_slave_waitrequest_from_sa;
  wire             SD_CARD_Interface_avalon_slave_waits_for_read;
  wire             SD_CARD_Interface_avalon_slave_waits_for_write;
  wire             SD_CARD_Interface_avalon_slave_write;
  wire    [ 31: 0] SD_CARD_Interface_avalon_slave_writedata;
  reg              d1_SD_CARD_Interface_avalon_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_SD_CARD_Interface_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  9: 0] shifted_address_to_SD_CARD_Interface_avalon_slave_from_DE0_SOPC_clock_2_out;
  wire             wait_for_SD_CARD_Interface_avalon_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~SD_CARD_Interface_avalon_slave_end_xfer;
    end


  assign SD_CARD_Interface_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave));
  //assign SD_CARD_Interface_avalon_slave_readdata_from_sa = SD_CARD_Interface_avalon_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_readdata_from_sa = SD_CARD_Interface_avalon_slave_readdata;

  assign DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave = (1) & (DE0_SOPC_clock_2_out_read | DE0_SOPC_clock_2_out_write);
  //assign SD_CARD_Interface_avalon_slave_waitrequest_from_sa = SD_CARD_Interface_avalon_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_waitrequest_from_sa = SD_CARD_Interface_avalon_slave_waitrequest;

  //SD_CARD_Interface_avalon_slave_arb_share_counter set values, which is an e_mux
  assign SD_CARD_Interface_avalon_slave_arb_share_set_values = 1;

  //SD_CARD_Interface_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign SD_CARD_Interface_avalon_slave_non_bursting_master_requests = DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave;

  //SD_CARD_Interface_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign SD_CARD_Interface_avalon_slave_any_bursting_master_saved_grant = 0;

  //SD_CARD_Interface_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_arb_share_counter_next_value = SD_CARD_Interface_avalon_slave_firsttransfer ? (SD_CARD_Interface_avalon_slave_arb_share_set_values - 1) : |SD_CARD_Interface_avalon_slave_arb_share_counter ? (SD_CARD_Interface_avalon_slave_arb_share_counter - 1) : 0;

  //SD_CARD_Interface_avalon_slave_allgrants all slave grants, which is an e_mux
  assign SD_CARD_Interface_avalon_slave_allgrants = |SD_CARD_Interface_avalon_slave_grant_vector;

  //SD_CARD_Interface_avalon_slave_end_xfer assignment, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_end_xfer = ~(SD_CARD_Interface_avalon_slave_waits_for_read | SD_CARD_Interface_avalon_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_SD_CARD_Interface_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_SD_CARD_Interface_avalon_slave = SD_CARD_Interface_avalon_slave_end_xfer & (~SD_CARD_Interface_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //SD_CARD_Interface_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_SD_CARD_Interface_avalon_slave & SD_CARD_Interface_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_SD_CARD_Interface_avalon_slave & ~SD_CARD_Interface_avalon_slave_non_bursting_master_requests);

  //SD_CARD_Interface_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SD_CARD_Interface_avalon_slave_arb_share_counter <= 0;
      else if (SD_CARD_Interface_avalon_slave_arb_counter_enable)
          SD_CARD_Interface_avalon_slave_arb_share_counter <= SD_CARD_Interface_avalon_slave_arb_share_counter_next_value;
    end


  //SD_CARD_Interface_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SD_CARD_Interface_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|SD_CARD_Interface_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_SD_CARD_Interface_avalon_slave) | (end_xfer_arb_share_counter_term_SD_CARD_Interface_avalon_slave & ~SD_CARD_Interface_avalon_slave_non_bursting_master_requests))
          SD_CARD_Interface_avalon_slave_slavearbiterlockenable <= |SD_CARD_Interface_avalon_slave_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_2/out SD_CARD_Interface/avalon_slave arbiterlock, which is an e_assign
  assign DE0_SOPC_clock_2_out_arbiterlock = SD_CARD_Interface_avalon_slave_slavearbiterlockenable & DE0_SOPC_clock_2_out_continuerequest;

  //SD_CARD_Interface_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_slavearbiterlockenable2 = |SD_CARD_Interface_avalon_slave_arb_share_counter_next_value;

  //DE0_SOPC_clock_2/out SD_CARD_Interface/avalon_slave arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_2_out_arbiterlock2 = SD_CARD_Interface_avalon_slave_slavearbiterlockenable2 & DE0_SOPC_clock_2_out_continuerequest;

  //SD_CARD_Interface_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_any_continuerequest = 1;

  //DE0_SOPC_clock_2_out_continuerequest continued request, which is an e_assign
  assign DE0_SOPC_clock_2_out_continuerequest = 1;

  assign DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave = DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave;
  //SD_CARD_Interface_avalon_slave_writedata mux, which is an e_mux
  assign SD_CARD_Interface_avalon_slave_writedata = DE0_SOPC_clock_2_out_writedata;

  //master is always granted when requested
  assign DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave = DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave;

  //DE0_SOPC_clock_2/out saved-grant SD_CARD_Interface/avalon_slave, which is an e_assign
  assign DE0_SOPC_clock_2_out_saved_grant_SD_CARD_Interface_avalon_slave = DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave;

  //allow new arb cycle for SD_CARD_Interface/avalon_slave, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign SD_CARD_Interface_avalon_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign SD_CARD_Interface_avalon_slave_master_qreq_vector = 1;

  //SD_CARD_Interface_avalon_slave_reset_n assignment, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_reset_n = reset_n;

  assign SD_CARD_Interface_avalon_slave_chipselect = DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave;
  //SD_CARD_Interface_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_firsttransfer = SD_CARD_Interface_avalon_slave_begins_xfer ? SD_CARD_Interface_avalon_slave_unreg_firsttransfer : SD_CARD_Interface_avalon_slave_reg_firsttransfer;

  //SD_CARD_Interface_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_unreg_firsttransfer = ~(SD_CARD_Interface_avalon_slave_slavearbiterlockenable & SD_CARD_Interface_avalon_slave_any_continuerequest);

  //SD_CARD_Interface_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SD_CARD_Interface_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (SD_CARD_Interface_avalon_slave_begins_xfer)
          SD_CARD_Interface_avalon_slave_reg_firsttransfer <= SD_CARD_Interface_avalon_slave_unreg_firsttransfer;
    end


  //SD_CARD_Interface_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_beginbursttransfer_internal = SD_CARD_Interface_avalon_slave_begins_xfer;

  //SD_CARD_Interface_avalon_slave_read assignment, which is an e_mux
  assign SD_CARD_Interface_avalon_slave_read = DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave & DE0_SOPC_clock_2_out_read;

  //SD_CARD_Interface_avalon_slave_write assignment, which is an e_mux
  assign SD_CARD_Interface_avalon_slave_write = DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave & DE0_SOPC_clock_2_out_write;

  assign shifted_address_to_SD_CARD_Interface_avalon_slave_from_DE0_SOPC_clock_2_out = DE0_SOPC_clock_2_out_address_to_slave;
  //SD_CARD_Interface_avalon_slave_address mux, which is an e_mux
  assign SD_CARD_Interface_avalon_slave_address = shifted_address_to_SD_CARD_Interface_avalon_slave_from_DE0_SOPC_clock_2_out >> 2;

  //d1_SD_CARD_Interface_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_SD_CARD_Interface_avalon_slave_end_xfer <= 1;
      else 
        d1_SD_CARD_Interface_avalon_slave_end_xfer <= SD_CARD_Interface_avalon_slave_end_xfer;
    end


  //SD_CARD_Interface_avalon_slave_waits_for_read in a cycle, which is an e_mux
  assign SD_CARD_Interface_avalon_slave_waits_for_read = SD_CARD_Interface_avalon_slave_in_a_read_cycle & SD_CARD_Interface_avalon_slave_waitrequest_from_sa;

  //SD_CARD_Interface_avalon_slave_in_a_read_cycle assignment, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_in_a_read_cycle = DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave & DE0_SOPC_clock_2_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = SD_CARD_Interface_avalon_slave_in_a_read_cycle;

  //SD_CARD_Interface_avalon_slave_waits_for_write in a cycle, which is an e_mux
  assign SD_CARD_Interface_avalon_slave_waits_for_write = SD_CARD_Interface_avalon_slave_in_a_write_cycle & SD_CARD_Interface_avalon_slave_waitrequest_from_sa;

  //SD_CARD_Interface_avalon_slave_in_a_write_cycle assignment, which is an e_assign
  assign SD_CARD_Interface_avalon_slave_in_a_write_cycle = DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave & DE0_SOPC_clock_2_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = SD_CARD_Interface_avalon_slave_in_a_write_cycle;

  assign wait_for_SD_CARD_Interface_avalon_slave_counter = 0;
  //SD_CARD_Interface_avalon_slave_byteenable byte enable port mux, which is an e_mux
  assign SD_CARD_Interface_avalon_slave_byteenable = (DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave)? DE0_SOPC_clock_2_out_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //SD_CARD_Interface/avalon_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module buttons_s1_arbitrator (
                               // inputs:
                                buttons_s1_irq,
                                buttons_s1_readdata,
                                clk,
                                clock_crossing_bridge_m1_address_to_slave,
                                clock_crossing_bridge_m1_latency_counter,
                                clock_crossing_bridge_m1_nativeaddress,
                                clock_crossing_bridge_m1_read,
                                clock_crossing_bridge_m1_write,
                                clock_crossing_bridge_m1_writedata,
                                reset_n,

                               // outputs:
                                buttons_s1_address,
                                buttons_s1_chipselect,
                                buttons_s1_irq_from_sa,
                                buttons_s1_readdata_from_sa,
                                buttons_s1_reset_n,
                                buttons_s1_write_n,
                                buttons_s1_writedata,
                                clock_crossing_bridge_m1_granted_buttons_s1,
                                clock_crossing_bridge_m1_qualified_request_buttons_s1,
                                clock_crossing_bridge_m1_read_data_valid_buttons_s1,
                                clock_crossing_bridge_m1_requests_buttons_s1,
                                d1_buttons_s1_end_xfer
                             )
;

  output  [  1: 0] buttons_s1_address;
  output           buttons_s1_chipselect;
  output           buttons_s1_irq_from_sa;
  output  [ 31: 0] buttons_s1_readdata_from_sa;
  output           buttons_s1_reset_n;
  output           buttons_s1_write_n;
  output  [ 31: 0] buttons_s1_writedata;
  output           clock_crossing_bridge_m1_granted_buttons_s1;
  output           clock_crossing_bridge_m1_qualified_request_buttons_s1;
  output           clock_crossing_bridge_m1_read_data_valid_buttons_s1;
  output           clock_crossing_bridge_m1_requests_buttons_s1;
  output           d1_buttons_s1_end_xfer;
  input            buttons_s1_irq;
  input   [ 31: 0] buttons_s1_readdata;
  input            clk;
  input   [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  input            clock_crossing_bridge_m1_latency_counter;
  input   [  8: 0] clock_crossing_bridge_m1_nativeaddress;
  input            clock_crossing_bridge_m1_read;
  input            clock_crossing_bridge_m1_write;
  input   [ 31: 0] clock_crossing_bridge_m1_writedata;
  input            reset_n;

  wire    [  1: 0] buttons_s1_address;
  wire             buttons_s1_allgrants;
  wire             buttons_s1_allow_new_arb_cycle;
  wire             buttons_s1_any_bursting_master_saved_grant;
  wire             buttons_s1_any_continuerequest;
  wire             buttons_s1_arb_counter_enable;
  reg              buttons_s1_arb_share_counter;
  wire             buttons_s1_arb_share_counter_next_value;
  wire             buttons_s1_arb_share_set_values;
  wire             buttons_s1_beginbursttransfer_internal;
  wire             buttons_s1_begins_xfer;
  wire             buttons_s1_chipselect;
  wire             buttons_s1_end_xfer;
  wire             buttons_s1_firsttransfer;
  wire             buttons_s1_grant_vector;
  wire             buttons_s1_in_a_read_cycle;
  wire             buttons_s1_in_a_write_cycle;
  wire             buttons_s1_irq_from_sa;
  wire             buttons_s1_master_qreq_vector;
  wire             buttons_s1_non_bursting_master_requests;
  wire    [ 31: 0] buttons_s1_readdata_from_sa;
  reg              buttons_s1_reg_firsttransfer;
  wire             buttons_s1_reset_n;
  reg              buttons_s1_slavearbiterlockenable;
  wire             buttons_s1_slavearbiterlockenable2;
  wire             buttons_s1_unreg_firsttransfer;
  wire             buttons_s1_waits_for_read;
  wire             buttons_s1_waits_for_write;
  wire             buttons_s1_write_n;
  wire    [ 31: 0] buttons_s1_writedata;
  wire             clock_crossing_bridge_m1_arbiterlock;
  wire             clock_crossing_bridge_m1_arbiterlock2;
  wire             clock_crossing_bridge_m1_continuerequest;
  wire             clock_crossing_bridge_m1_granted_buttons_s1;
  wire             clock_crossing_bridge_m1_qualified_request_buttons_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_buttons_s1;
  wire             clock_crossing_bridge_m1_requests_buttons_s1;
  wire             clock_crossing_bridge_m1_saved_grant_buttons_s1;
  reg              d1_buttons_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_buttons_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_buttons_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~buttons_s1_end_xfer;
    end


  assign buttons_s1_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_bridge_m1_qualified_request_buttons_s1));
  //assign buttons_s1_readdata_from_sa = buttons_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign buttons_s1_readdata_from_sa = buttons_s1_readdata;

  assign clock_crossing_bridge_m1_requests_buttons_s1 = ({clock_crossing_bridge_m1_address_to_slave[10 : 4] , 4'b0} == 11'h480) & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write);
  //buttons_s1_arb_share_counter set values, which is an e_mux
  assign buttons_s1_arb_share_set_values = 1;

  //buttons_s1_non_bursting_master_requests mux, which is an e_mux
  assign buttons_s1_non_bursting_master_requests = clock_crossing_bridge_m1_requests_buttons_s1;

  //buttons_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign buttons_s1_any_bursting_master_saved_grant = 0;

  //buttons_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign buttons_s1_arb_share_counter_next_value = buttons_s1_firsttransfer ? (buttons_s1_arb_share_set_values - 1) : |buttons_s1_arb_share_counter ? (buttons_s1_arb_share_counter - 1) : 0;

  //buttons_s1_allgrants all slave grants, which is an e_mux
  assign buttons_s1_allgrants = |buttons_s1_grant_vector;

  //buttons_s1_end_xfer assignment, which is an e_assign
  assign buttons_s1_end_xfer = ~(buttons_s1_waits_for_read | buttons_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_buttons_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_buttons_s1 = buttons_s1_end_xfer & (~buttons_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //buttons_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign buttons_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_buttons_s1 & buttons_s1_allgrants) | (end_xfer_arb_share_counter_term_buttons_s1 & ~buttons_s1_non_bursting_master_requests);

  //buttons_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          buttons_s1_arb_share_counter <= 0;
      else if (buttons_s1_arb_counter_enable)
          buttons_s1_arb_share_counter <= buttons_s1_arb_share_counter_next_value;
    end


  //buttons_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          buttons_s1_slavearbiterlockenable <= 0;
      else if ((|buttons_s1_master_qreq_vector & end_xfer_arb_share_counter_term_buttons_s1) | (end_xfer_arb_share_counter_term_buttons_s1 & ~buttons_s1_non_bursting_master_requests))
          buttons_s1_slavearbiterlockenable <= |buttons_s1_arb_share_counter_next_value;
    end


  //clock_crossing_bridge/m1 buttons/s1 arbiterlock, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock = buttons_s1_slavearbiterlockenable & clock_crossing_bridge_m1_continuerequest;

  //buttons_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign buttons_s1_slavearbiterlockenable2 = |buttons_s1_arb_share_counter_next_value;

  //clock_crossing_bridge/m1 buttons/s1 arbiterlock2, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock2 = buttons_s1_slavearbiterlockenable2 & clock_crossing_bridge_m1_continuerequest;

  //buttons_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign buttons_s1_any_continuerequest = 1;

  //clock_crossing_bridge_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_bridge_m1_continuerequest = 1;

  assign clock_crossing_bridge_m1_qualified_request_buttons_s1 = clock_crossing_bridge_m1_requests_buttons_s1 & ~((clock_crossing_bridge_m1_read & ((clock_crossing_bridge_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_bridge_m1_read_data_valid_buttons_s1, which is an e_mux
  assign clock_crossing_bridge_m1_read_data_valid_buttons_s1 = clock_crossing_bridge_m1_granted_buttons_s1 & clock_crossing_bridge_m1_read & ~buttons_s1_waits_for_read;

  //buttons_s1_writedata mux, which is an e_mux
  assign buttons_s1_writedata = clock_crossing_bridge_m1_writedata;

  //master is always granted when requested
  assign clock_crossing_bridge_m1_granted_buttons_s1 = clock_crossing_bridge_m1_qualified_request_buttons_s1;

  //clock_crossing_bridge/m1 saved-grant buttons/s1, which is an e_assign
  assign clock_crossing_bridge_m1_saved_grant_buttons_s1 = clock_crossing_bridge_m1_requests_buttons_s1;

  //allow new arb cycle for buttons/s1, which is an e_assign
  assign buttons_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign buttons_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign buttons_s1_master_qreq_vector = 1;

  //buttons_s1_reset_n assignment, which is an e_assign
  assign buttons_s1_reset_n = reset_n;

  assign buttons_s1_chipselect = clock_crossing_bridge_m1_granted_buttons_s1;
  //buttons_s1_firsttransfer first transaction, which is an e_assign
  assign buttons_s1_firsttransfer = buttons_s1_begins_xfer ? buttons_s1_unreg_firsttransfer : buttons_s1_reg_firsttransfer;

  //buttons_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign buttons_s1_unreg_firsttransfer = ~(buttons_s1_slavearbiterlockenable & buttons_s1_any_continuerequest);

  //buttons_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          buttons_s1_reg_firsttransfer <= 1'b1;
      else if (buttons_s1_begins_xfer)
          buttons_s1_reg_firsttransfer <= buttons_s1_unreg_firsttransfer;
    end


  //buttons_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign buttons_s1_beginbursttransfer_internal = buttons_s1_begins_xfer;

  //~buttons_s1_write_n assignment, which is an e_mux
  assign buttons_s1_write_n = ~(clock_crossing_bridge_m1_granted_buttons_s1 & clock_crossing_bridge_m1_write);

  //buttons_s1_address mux, which is an e_mux
  assign buttons_s1_address = clock_crossing_bridge_m1_nativeaddress;

  //d1_buttons_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_buttons_s1_end_xfer <= 1;
      else 
        d1_buttons_s1_end_xfer <= buttons_s1_end_xfer;
    end


  //buttons_s1_waits_for_read in a cycle, which is an e_mux
  assign buttons_s1_waits_for_read = buttons_s1_in_a_read_cycle & buttons_s1_begins_xfer;

  //buttons_s1_in_a_read_cycle assignment, which is an e_assign
  assign buttons_s1_in_a_read_cycle = clock_crossing_bridge_m1_granted_buttons_s1 & clock_crossing_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = buttons_s1_in_a_read_cycle;

  //buttons_s1_waits_for_write in a cycle, which is an e_mux
  assign buttons_s1_waits_for_write = buttons_s1_in_a_write_cycle & 0;

  //buttons_s1_in_a_write_cycle assignment, which is an e_assign
  assign buttons_s1_in_a_write_cycle = clock_crossing_bridge_m1_granted_buttons_s1 & clock_crossing_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = buttons_s1_in_a_write_cycle;

  assign wait_for_buttons_s1_counter = 0;
  //assign buttons_s1_irq_from_sa = buttons_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign buttons_s1_irq_from_sa = buttons_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //buttons/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_clock_crossing_bridge_s1_module (
                                                                         // inputs:
                                                                          clear_fifo,
                                                                          clk,
                                                                          data_in,
                                                                          read,
                                                                          reset_n,
                                                                          sync_reset,
                                                                          write,

                                                                         // outputs:
                                                                          data_out,
                                                                          empty,
                                                                          fifo_contains_ones_n,
                                                                          full
                                                                       )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  wire             full_32;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_31;
  assign empty = !full_0;
  assign full_32 = 0;
  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    0;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module clock_crossing_bridge_s1_arbitrator (
                                             // inputs:
                                              clk,
                                              clock_crossing_bridge_s1_endofpacket,
                                              clock_crossing_bridge_s1_readdata,
                                              clock_crossing_bridge_s1_readdatavalid,
                                              clock_crossing_bridge_s1_waitrequest,
                                              cpu_data_master_address_to_slave,
                                              cpu_data_master_byteenable,
                                              cpu_data_master_read,
                                              cpu_data_master_waitrequest,
                                              cpu_data_master_write,
                                              cpu_data_master_writedata,
                                              reset_n,

                                             // outputs:
                                              clock_crossing_bridge_s1_address,
                                              clock_crossing_bridge_s1_byteenable,
                                              clock_crossing_bridge_s1_endofpacket_from_sa,
                                              clock_crossing_bridge_s1_nativeaddress,
                                              clock_crossing_bridge_s1_read,
                                              clock_crossing_bridge_s1_readdata_from_sa,
                                              clock_crossing_bridge_s1_reset_n,
                                              clock_crossing_bridge_s1_waitrequest_from_sa,
                                              clock_crossing_bridge_s1_write,
                                              clock_crossing_bridge_s1_writedata,
                                              cpu_data_master_granted_clock_crossing_bridge_s1,
                                              cpu_data_master_qualified_request_clock_crossing_bridge_s1,
                                              cpu_data_master_read_data_valid_clock_crossing_bridge_s1,
                                              cpu_data_master_read_data_valid_clock_crossing_bridge_s1_shift_register,
                                              cpu_data_master_requests_clock_crossing_bridge_s1,
                                              d1_clock_crossing_bridge_s1_end_xfer
                                           )
;

  output  [  8: 0] clock_crossing_bridge_s1_address;
  output  [  3: 0] clock_crossing_bridge_s1_byteenable;
  output           clock_crossing_bridge_s1_endofpacket_from_sa;
  output  [  8: 0] clock_crossing_bridge_s1_nativeaddress;
  output           clock_crossing_bridge_s1_read;
  output  [ 31: 0] clock_crossing_bridge_s1_readdata_from_sa;
  output           clock_crossing_bridge_s1_reset_n;
  output           clock_crossing_bridge_s1_waitrequest_from_sa;
  output           clock_crossing_bridge_s1_write;
  output  [ 31: 0] clock_crossing_bridge_s1_writedata;
  output           cpu_data_master_granted_clock_crossing_bridge_s1;
  output           cpu_data_master_qualified_request_clock_crossing_bridge_s1;
  output           cpu_data_master_read_data_valid_clock_crossing_bridge_s1;
  output           cpu_data_master_read_data_valid_clock_crossing_bridge_s1_shift_register;
  output           cpu_data_master_requests_clock_crossing_bridge_s1;
  output           d1_clock_crossing_bridge_s1_end_xfer;
  input            clk;
  input            clock_crossing_bridge_s1_endofpacket;
  input   [ 31: 0] clock_crossing_bridge_s1_readdata;
  input            clock_crossing_bridge_s1_readdatavalid;
  input            clock_crossing_bridge_s1_waitrequest;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  8: 0] clock_crossing_bridge_s1_address;
  wire             clock_crossing_bridge_s1_allgrants;
  wire             clock_crossing_bridge_s1_allow_new_arb_cycle;
  wire             clock_crossing_bridge_s1_any_bursting_master_saved_grant;
  wire             clock_crossing_bridge_s1_any_continuerequest;
  wire             clock_crossing_bridge_s1_arb_counter_enable;
  reg     [  1: 0] clock_crossing_bridge_s1_arb_share_counter;
  wire    [  1: 0] clock_crossing_bridge_s1_arb_share_counter_next_value;
  wire    [  1: 0] clock_crossing_bridge_s1_arb_share_set_values;
  wire             clock_crossing_bridge_s1_beginbursttransfer_internal;
  wire             clock_crossing_bridge_s1_begins_xfer;
  wire    [  3: 0] clock_crossing_bridge_s1_byteenable;
  wire             clock_crossing_bridge_s1_end_xfer;
  wire             clock_crossing_bridge_s1_endofpacket_from_sa;
  wire             clock_crossing_bridge_s1_firsttransfer;
  wire             clock_crossing_bridge_s1_grant_vector;
  wire             clock_crossing_bridge_s1_in_a_read_cycle;
  wire             clock_crossing_bridge_s1_in_a_write_cycle;
  wire             clock_crossing_bridge_s1_master_qreq_vector;
  wire             clock_crossing_bridge_s1_move_on_to_next_transaction;
  wire    [  8: 0] clock_crossing_bridge_s1_nativeaddress;
  wire             clock_crossing_bridge_s1_non_bursting_master_requests;
  wire             clock_crossing_bridge_s1_read;
  wire    [ 31: 0] clock_crossing_bridge_s1_readdata_from_sa;
  wire             clock_crossing_bridge_s1_readdatavalid_from_sa;
  reg              clock_crossing_bridge_s1_reg_firsttransfer;
  wire             clock_crossing_bridge_s1_reset_n;
  reg              clock_crossing_bridge_s1_slavearbiterlockenable;
  wire             clock_crossing_bridge_s1_slavearbiterlockenable2;
  wire             clock_crossing_bridge_s1_unreg_firsttransfer;
  wire             clock_crossing_bridge_s1_waitrequest_from_sa;
  wire             clock_crossing_bridge_s1_waits_for_read;
  wire             clock_crossing_bridge_s1_waits_for_write;
  wire             clock_crossing_bridge_s1_write;
  wire    [ 31: 0] clock_crossing_bridge_s1_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_clock_crossing_bridge_s1;
  wire             cpu_data_master_qualified_request_clock_crossing_bridge_s1;
  wire             cpu_data_master_rdv_fifo_empty_clock_crossing_bridge_s1;
  wire             cpu_data_master_rdv_fifo_output_from_clock_crossing_bridge_s1;
  wire             cpu_data_master_read_data_valid_clock_crossing_bridge_s1;
  wire             cpu_data_master_read_data_valid_clock_crossing_bridge_s1_shift_register;
  wire             cpu_data_master_requests_clock_crossing_bridge_s1;
  wire             cpu_data_master_saved_grant_clock_crossing_bridge_s1;
  reg              d1_clock_crossing_bridge_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_clock_crossing_bridge_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 25: 0] shifted_address_to_clock_crossing_bridge_s1_from_cpu_data_master;
  wire             wait_for_clock_crossing_bridge_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~clock_crossing_bridge_s1_end_xfer;
    end


  assign clock_crossing_bridge_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_clock_crossing_bridge_s1));
  //assign clock_crossing_bridge_s1_readdata_from_sa = clock_crossing_bridge_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clock_crossing_bridge_s1_readdata_from_sa = clock_crossing_bridge_s1_readdata;

  assign cpu_data_master_requests_clock_crossing_bridge_s1 = ({cpu_data_master_address_to_slave[25 : 11] , 11'b0} == 26'h0) & (cpu_data_master_read | cpu_data_master_write);
  //assign clock_crossing_bridge_s1_waitrequest_from_sa = clock_crossing_bridge_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clock_crossing_bridge_s1_waitrequest_from_sa = clock_crossing_bridge_s1_waitrequest;

  //assign clock_crossing_bridge_s1_readdatavalid_from_sa = clock_crossing_bridge_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clock_crossing_bridge_s1_readdatavalid_from_sa = clock_crossing_bridge_s1_readdatavalid;

  //clock_crossing_bridge_s1_arb_share_counter set values, which is an e_mux
  assign clock_crossing_bridge_s1_arb_share_set_values = 1;

  //clock_crossing_bridge_s1_non_bursting_master_requests mux, which is an e_mux
  assign clock_crossing_bridge_s1_non_bursting_master_requests = cpu_data_master_requests_clock_crossing_bridge_s1;

  //clock_crossing_bridge_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign clock_crossing_bridge_s1_any_bursting_master_saved_grant = 0;

  //clock_crossing_bridge_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign clock_crossing_bridge_s1_arb_share_counter_next_value = clock_crossing_bridge_s1_firsttransfer ? (clock_crossing_bridge_s1_arb_share_set_values - 1) : |clock_crossing_bridge_s1_arb_share_counter ? (clock_crossing_bridge_s1_arb_share_counter - 1) : 0;

  //clock_crossing_bridge_s1_allgrants all slave grants, which is an e_mux
  assign clock_crossing_bridge_s1_allgrants = |clock_crossing_bridge_s1_grant_vector;

  //clock_crossing_bridge_s1_end_xfer assignment, which is an e_assign
  assign clock_crossing_bridge_s1_end_xfer = ~(clock_crossing_bridge_s1_waits_for_read | clock_crossing_bridge_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_clock_crossing_bridge_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_clock_crossing_bridge_s1 = clock_crossing_bridge_s1_end_xfer & (~clock_crossing_bridge_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //clock_crossing_bridge_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign clock_crossing_bridge_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_clock_crossing_bridge_s1 & clock_crossing_bridge_s1_allgrants) | (end_xfer_arb_share_counter_term_clock_crossing_bridge_s1 & ~clock_crossing_bridge_s1_non_bursting_master_requests);

  //clock_crossing_bridge_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_bridge_s1_arb_share_counter <= 0;
      else if (clock_crossing_bridge_s1_arb_counter_enable)
          clock_crossing_bridge_s1_arb_share_counter <= clock_crossing_bridge_s1_arb_share_counter_next_value;
    end


  //clock_crossing_bridge_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_bridge_s1_slavearbiterlockenable <= 0;
      else if ((|clock_crossing_bridge_s1_master_qreq_vector & end_xfer_arb_share_counter_term_clock_crossing_bridge_s1) | (end_xfer_arb_share_counter_term_clock_crossing_bridge_s1 & ~clock_crossing_bridge_s1_non_bursting_master_requests))
          clock_crossing_bridge_s1_slavearbiterlockenable <= |clock_crossing_bridge_s1_arb_share_counter_next_value;
    end


  //cpu/data_master clock_crossing_bridge/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = clock_crossing_bridge_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //clock_crossing_bridge_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign clock_crossing_bridge_s1_slavearbiterlockenable2 = |clock_crossing_bridge_s1_arb_share_counter_next_value;

  //cpu/data_master clock_crossing_bridge/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = clock_crossing_bridge_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //clock_crossing_bridge_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign clock_crossing_bridge_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_clock_crossing_bridge_s1 = cpu_data_master_requests_clock_crossing_bridge_s1 & ~((cpu_data_master_read & (~cpu_data_master_waitrequest | (|cpu_data_master_read_data_valid_clock_crossing_bridge_s1_shift_register))) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //unique name for clock_crossing_bridge_s1_move_on_to_next_transaction, which is an e_assign
  assign clock_crossing_bridge_s1_move_on_to_next_transaction = clock_crossing_bridge_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_clock_crossing_bridge_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_clock_crossing_bridge_s1_module rdv_fifo_for_cpu_data_master_to_clock_crossing_bridge_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_clock_crossing_bridge_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_clock_crossing_bridge_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_clock_crossing_bridge_s1),
      .full                 (),
      .read                 (clock_crossing_bridge_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~clock_crossing_bridge_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_clock_crossing_bridge_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_clock_crossing_bridge_s1;
  //local readdatavalid cpu_data_master_read_data_valid_clock_crossing_bridge_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_clock_crossing_bridge_s1 = clock_crossing_bridge_s1_readdatavalid_from_sa;

  //clock_crossing_bridge_s1_writedata mux, which is an e_mux
  assign clock_crossing_bridge_s1_writedata = cpu_data_master_writedata;

  //assign clock_crossing_bridge_s1_endofpacket_from_sa = clock_crossing_bridge_s1_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clock_crossing_bridge_s1_endofpacket_from_sa = clock_crossing_bridge_s1_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_clock_crossing_bridge_s1 = cpu_data_master_qualified_request_clock_crossing_bridge_s1;

  //cpu/data_master saved-grant clock_crossing_bridge/s1, which is an e_assign
  assign cpu_data_master_saved_grant_clock_crossing_bridge_s1 = cpu_data_master_requests_clock_crossing_bridge_s1;

  //allow new arb cycle for clock_crossing_bridge/s1, which is an e_assign
  assign clock_crossing_bridge_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign clock_crossing_bridge_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign clock_crossing_bridge_s1_master_qreq_vector = 1;

  //clock_crossing_bridge_s1_reset_n assignment, which is an e_assign
  assign clock_crossing_bridge_s1_reset_n = reset_n;

  //clock_crossing_bridge_s1_firsttransfer first transaction, which is an e_assign
  assign clock_crossing_bridge_s1_firsttransfer = clock_crossing_bridge_s1_begins_xfer ? clock_crossing_bridge_s1_unreg_firsttransfer : clock_crossing_bridge_s1_reg_firsttransfer;

  //clock_crossing_bridge_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign clock_crossing_bridge_s1_unreg_firsttransfer = ~(clock_crossing_bridge_s1_slavearbiterlockenable & clock_crossing_bridge_s1_any_continuerequest);

  //clock_crossing_bridge_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_bridge_s1_reg_firsttransfer <= 1'b1;
      else if (clock_crossing_bridge_s1_begins_xfer)
          clock_crossing_bridge_s1_reg_firsttransfer <= clock_crossing_bridge_s1_unreg_firsttransfer;
    end


  //clock_crossing_bridge_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign clock_crossing_bridge_s1_beginbursttransfer_internal = clock_crossing_bridge_s1_begins_xfer;

  //clock_crossing_bridge_s1_read assignment, which is an e_mux
  assign clock_crossing_bridge_s1_read = cpu_data_master_granted_clock_crossing_bridge_s1 & cpu_data_master_read;

  //clock_crossing_bridge_s1_write assignment, which is an e_mux
  assign clock_crossing_bridge_s1_write = cpu_data_master_granted_clock_crossing_bridge_s1 & cpu_data_master_write;

  assign shifted_address_to_clock_crossing_bridge_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //clock_crossing_bridge_s1_address mux, which is an e_mux
  assign clock_crossing_bridge_s1_address = shifted_address_to_clock_crossing_bridge_s1_from_cpu_data_master >> 2;

  //slaveid clock_crossing_bridge_s1_nativeaddress nativeaddress mux, which is an e_mux
  assign clock_crossing_bridge_s1_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_clock_crossing_bridge_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_clock_crossing_bridge_s1_end_xfer <= 1;
      else 
        d1_clock_crossing_bridge_s1_end_xfer <= clock_crossing_bridge_s1_end_xfer;
    end


  //clock_crossing_bridge_s1_waits_for_read in a cycle, which is an e_mux
  assign clock_crossing_bridge_s1_waits_for_read = clock_crossing_bridge_s1_in_a_read_cycle & clock_crossing_bridge_s1_waitrequest_from_sa;

  //clock_crossing_bridge_s1_in_a_read_cycle assignment, which is an e_assign
  assign clock_crossing_bridge_s1_in_a_read_cycle = cpu_data_master_granted_clock_crossing_bridge_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = clock_crossing_bridge_s1_in_a_read_cycle;

  //clock_crossing_bridge_s1_waits_for_write in a cycle, which is an e_mux
  assign clock_crossing_bridge_s1_waits_for_write = clock_crossing_bridge_s1_in_a_write_cycle & clock_crossing_bridge_s1_waitrequest_from_sa;

  //clock_crossing_bridge_s1_in_a_write_cycle assignment, which is an e_assign
  assign clock_crossing_bridge_s1_in_a_write_cycle = cpu_data_master_granted_clock_crossing_bridge_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = clock_crossing_bridge_s1_in_a_write_cycle;

  assign wait_for_clock_crossing_bridge_s1_counter = 0;
  //clock_crossing_bridge_s1_byteenable byte enable port mux, which is an e_mux
  assign clock_crossing_bridge_s1_byteenable = (cpu_data_master_granted_clock_crossing_bridge_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //clock_crossing_bridge/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module clock_crossing_bridge_m1_arbitrator (
                                             // inputs:
                                              DE0_SOPC_clock_1_in_endofpacket_from_sa,
                                              DE0_SOPC_clock_1_in_readdata_from_sa,
                                              DE0_SOPC_clock_1_in_waitrequest_from_sa,
                                              DE0_SOPC_clock_2_in_endofpacket_from_sa,
                                              DE0_SOPC_clock_2_in_readdata_from_sa,
                                              DE0_SOPC_clock_2_in_waitrequest_from_sa,
                                              buttons_s1_readdata_from_sa,
                                              clk,
                                              clock_crossing_bridge_m1_address,
                                              clock_crossing_bridge_m1_byteenable,
                                              clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in,
                                              clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in,
                                              clock_crossing_bridge_m1_granted_buttons_s1,
                                              clock_crossing_bridge_m1_granted_lcd_control_slave,
                                              clock_crossing_bridge_m1_granted_lcd_light_s1,
                                              clock_crossing_bridge_m1_granted_leds_s1,
                                              clock_crossing_bridge_m1_granted_seg7_s1,
                                              clock_crossing_bridge_m1_granted_switches_s1,
                                              clock_crossing_bridge_m1_granted_sysid_control_slave,
                                              clock_crossing_bridge_m1_granted_timer_s1,
                                              clock_crossing_bridge_m1_granted_uart_s1,
                                              clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in,
                                              clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in,
                                              clock_crossing_bridge_m1_qualified_request_buttons_s1,
                                              clock_crossing_bridge_m1_qualified_request_lcd_control_slave,
                                              clock_crossing_bridge_m1_qualified_request_lcd_light_s1,
                                              clock_crossing_bridge_m1_qualified_request_leds_s1,
                                              clock_crossing_bridge_m1_qualified_request_seg7_s1,
                                              clock_crossing_bridge_m1_qualified_request_switches_s1,
                                              clock_crossing_bridge_m1_qualified_request_sysid_control_slave,
                                              clock_crossing_bridge_m1_qualified_request_timer_s1,
                                              clock_crossing_bridge_m1_qualified_request_uart_s1,
                                              clock_crossing_bridge_m1_read,
                                              clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in,
                                              clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in,
                                              clock_crossing_bridge_m1_read_data_valid_buttons_s1,
                                              clock_crossing_bridge_m1_read_data_valid_lcd_control_slave,
                                              clock_crossing_bridge_m1_read_data_valid_lcd_light_s1,
                                              clock_crossing_bridge_m1_read_data_valid_leds_s1,
                                              clock_crossing_bridge_m1_read_data_valid_seg7_s1,
                                              clock_crossing_bridge_m1_read_data_valid_switches_s1,
                                              clock_crossing_bridge_m1_read_data_valid_sysid_control_slave,
                                              clock_crossing_bridge_m1_read_data_valid_timer_s1,
                                              clock_crossing_bridge_m1_read_data_valid_uart_s1,
                                              clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in,
                                              clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in,
                                              clock_crossing_bridge_m1_requests_buttons_s1,
                                              clock_crossing_bridge_m1_requests_lcd_control_slave,
                                              clock_crossing_bridge_m1_requests_lcd_light_s1,
                                              clock_crossing_bridge_m1_requests_leds_s1,
                                              clock_crossing_bridge_m1_requests_seg7_s1,
                                              clock_crossing_bridge_m1_requests_switches_s1,
                                              clock_crossing_bridge_m1_requests_sysid_control_slave,
                                              clock_crossing_bridge_m1_requests_timer_s1,
                                              clock_crossing_bridge_m1_requests_uart_s1,
                                              clock_crossing_bridge_m1_write,
                                              clock_crossing_bridge_m1_writedata,
                                              d1_DE0_SOPC_clock_1_in_end_xfer,
                                              d1_DE0_SOPC_clock_2_in_end_xfer,
                                              d1_buttons_s1_end_xfer,
                                              d1_lcd_control_slave_end_xfer,
                                              d1_lcd_light_s1_end_xfer,
                                              d1_leds_s1_end_xfer,
                                              d1_seg7_s1_end_xfer,
                                              d1_switches_s1_end_xfer,
                                              d1_sysid_control_slave_end_xfer,
                                              d1_timer_s1_end_xfer,
                                              d1_uart_s1_end_xfer,
                                              lcd_control_slave_readdata_from_sa,
                                              lcd_control_slave_wait_counter_eq_0,
                                              lcd_light_s1_readdata_from_sa,
                                              leds_s1_readdata_from_sa,
                                              reset_n,
                                              seg7_s1_readdata_from_sa,
                                              switches_s1_readdata_from_sa,
                                              sysid_control_slave_readdata_from_sa,
                                              timer_s1_readdata_from_sa,
                                              uart_s1_readdata_from_sa,

                                             // outputs:
                                              clock_crossing_bridge_m1_address_to_slave,
                                              clock_crossing_bridge_m1_endofpacket,
                                              clock_crossing_bridge_m1_latency_counter,
                                              clock_crossing_bridge_m1_readdata,
                                              clock_crossing_bridge_m1_readdatavalid,
                                              clock_crossing_bridge_m1_reset_n,
                                              clock_crossing_bridge_m1_waitrequest
                                           )
;

  output  [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  output           clock_crossing_bridge_m1_endofpacket;
  output           clock_crossing_bridge_m1_latency_counter;
  output  [ 31: 0] clock_crossing_bridge_m1_readdata;
  output           clock_crossing_bridge_m1_readdatavalid;
  output           clock_crossing_bridge_m1_reset_n;
  output           clock_crossing_bridge_m1_waitrequest;
  input            DE0_SOPC_clock_1_in_endofpacket_from_sa;
  input   [ 15: 0] DE0_SOPC_clock_1_in_readdata_from_sa;
  input            DE0_SOPC_clock_1_in_waitrequest_from_sa;
  input            DE0_SOPC_clock_2_in_endofpacket_from_sa;
  input   [ 31: 0] DE0_SOPC_clock_2_in_readdata_from_sa;
  input            DE0_SOPC_clock_2_in_waitrequest_from_sa;
  input   [ 31: 0] buttons_s1_readdata_from_sa;
  input            clk;
  input   [ 10: 0] clock_crossing_bridge_m1_address;
  input   [  3: 0] clock_crossing_bridge_m1_byteenable;
  input            clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in;
  input            clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in;
  input            clock_crossing_bridge_m1_granted_buttons_s1;
  input            clock_crossing_bridge_m1_granted_lcd_control_slave;
  input            clock_crossing_bridge_m1_granted_lcd_light_s1;
  input            clock_crossing_bridge_m1_granted_leds_s1;
  input            clock_crossing_bridge_m1_granted_seg7_s1;
  input            clock_crossing_bridge_m1_granted_switches_s1;
  input            clock_crossing_bridge_m1_granted_sysid_control_slave;
  input            clock_crossing_bridge_m1_granted_timer_s1;
  input            clock_crossing_bridge_m1_granted_uart_s1;
  input            clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in;
  input            clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in;
  input            clock_crossing_bridge_m1_qualified_request_buttons_s1;
  input            clock_crossing_bridge_m1_qualified_request_lcd_control_slave;
  input            clock_crossing_bridge_m1_qualified_request_lcd_light_s1;
  input            clock_crossing_bridge_m1_qualified_request_leds_s1;
  input            clock_crossing_bridge_m1_qualified_request_seg7_s1;
  input            clock_crossing_bridge_m1_qualified_request_switches_s1;
  input            clock_crossing_bridge_m1_qualified_request_sysid_control_slave;
  input            clock_crossing_bridge_m1_qualified_request_timer_s1;
  input            clock_crossing_bridge_m1_qualified_request_uart_s1;
  input            clock_crossing_bridge_m1_read;
  input            clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in;
  input            clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in;
  input            clock_crossing_bridge_m1_read_data_valid_buttons_s1;
  input            clock_crossing_bridge_m1_read_data_valid_lcd_control_slave;
  input            clock_crossing_bridge_m1_read_data_valid_lcd_light_s1;
  input            clock_crossing_bridge_m1_read_data_valid_leds_s1;
  input            clock_crossing_bridge_m1_read_data_valid_seg7_s1;
  input            clock_crossing_bridge_m1_read_data_valid_switches_s1;
  input            clock_crossing_bridge_m1_read_data_valid_sysid_control_slave;
  input            clock_crossing_bridge_m1_read_data_valid_timer_s1;
  input            clock_crossing_bridge_m1_read_data_valid_uart_s1;
  input            clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in;
  input            clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in;
  input            clock_crossing_bridge_m1_requests_buttons_s1;
  input            clock_crossing_bridge_m1_requests_lcd_control_slave;
  input            clock_crossing_bridge_m1_requests_lcd_light_s1;
  input            clock_crossing_bridge_m1_requests_leds_s1;
  input            clock_crossing_bridge_m1_requests_seg7_s1;
  input            clock_crossing_bridge_m1_requests_switches_s1;
  input            clock_crossing_bridge_m1_requests_sysid_control_slave;
  input            clock_crossing_bridge_m1_requests_timer_s1;
  input            clock_crossing_bridge_m1_requests_uart_s1;
  input            clock_crossing_bridge_m1_write;
  input   [ 31: 0] clock_crossing_bridge_m1_writedata;
  input            d1_DE0_SOPC_clock_1_in_end_xfer;
  input            d1_DE0_SOPC_clock_2_in_end_xfer;
  input            d1_buttons_s1_end_xfer;
  input            d1_lcd_control_slave_end_xfer;
  input            d1_lcd_light_s1_end_xfer;
  input            d1_leds_s1_end_xfer;
  input            d1_seg7_s1_end_xfer;
  input            d1_switches_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_timer_s1_end_xfer;
  input            d1_uart_s1_end_xfer;
  input   [  7: 0] lcd_control_slave_readdata_from_sa;
  input            lcd_control_slave_wait_counter_eq_0;
  input   [ 31: 0] lcd_light_s1_readdata_from_sa;
  input   [ 31: 0] leds_s1_readdata_from_sa;
  input            reset_n;
  input   [ 31: 0] seg7_s1_readdata_from_sa;
  input   [ 31: 0] switches_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input   [ 15: 0] timer_s1_readdata_from_sa;
  input   [ 15: 0] uart_s1_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 10: 0] clock_crossing_bridge_m1_address_last_time;
  wire    [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  reg     [  3: 0] clock_crossing_bridge_m1_byteenable_last_time;
  wire             clock_crossing_bridge_m1_endofpacket;
  wire             clock_crossing_bridge_m1_is_granted_some_slave;
  reg              clock_crossing_bridge_m1_latency_counter;
  reg              clock_crossing_bridge_m1_read_but_no_slave_selected;
  reg              clock_crossing_bridge_m1_read_last_time;
  wire    [ 31: 0] clock_crossing_bridge_m1_readdata;
  wire             clock_crossing_bridge_m1_readdatavalid;
  wire             clock_crossing_bridge_m1_reset_n;
  wire             clock_crossing_bridge_m1_run;
  wire             clock_crossing_bridge_m1_waitrequest;
  reg              clock_crossing_bridge_m1_write_last_time;
  reg     [ 31: 0] clock_crossing_bridge_m1_writedata_last_time;
  wire             latency_load_value;
  wire             p1_clock_crossing_bridge_m1_latency_counter;
  wire             pre_flush_clock_crossing_bridge_m1_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in | ~clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in) & ((~clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in | ~(clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write) | (1 & ~DE0_SOPC_clock_1_in_waitrequest_from_sa & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write)))) & ((~clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in | ~(clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write) | (1 & ~DE0_SOPC_clock_1_in_waitrequest_from_sa & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write)))) & 1 & (clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in | ~clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in) & ((~clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in | ~(clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write) | (1 & ~DE0_SOPC_clock_2_in_waitrequest_from_sa & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write)))) & ((~clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in | ~(clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write) | (1 & ~DE0_SOPC_clock_2_in_waitrequest_from_sa & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write)))) & 1 & (clock_crossing_bridge_m1_qualified_request_buttons_s1 | ~clock_crossing_bridge_m1_requests_buttons_s1) & ((~clock_crossing_bridge_m1_qualified_request_buttons_s1 | ~clock_crossing_bridge_m1_read | (1 & ~d1_buttons_s1_end_xfer & clock_crossing_bridge_m1_read))) & ((~clock_crossing_bridge_m1_qualified_request_buttons_s1 | ~clock_crossing_bridge_m1_write | (1 & clock_crossing_bridge_m1_write))) & 1 & (clock_crossing_bridge_m1_qualified_request_lcd_control_slave | ~clock_crossing_bridge_m1_requests_lcd_control_slave) & ((~clock_crossing_bridge_m1_qualified_request_lcd_control_slave | ~clock_crossing_bridge_m1_read | (1 & ((lcd_control_slave_wait_counter_eq_0 & ~d1_lcd_control_slave_end_xfer)) & clock_crossing_bridge_m1_read))) & ((~clock_crossing_bridge_m1_qualified_request_lcd_control_slave | ~clock_crossing_bridge_m1_write | (1 & ((lcd_control_slave_wait_counter_eq_0 & ~d1_lcd_control_slave_end_xfer)) & clock_crossing_bridge_m1_write))) & 1 & (clock_crossing_bridge_m1_qualified_request_lcd_light_s1 | ~clock_crossing_bridge_m1_requests_lcd_light_s1) & ((~clock_crossing_bridge_m1_qualified_request_lcd_light_s1 | ~clock_crossing_bridge_m1_read | (1 & ~d1_lcd_light_s1_end_xfer & clock_crossing_bridge_m1_read))) & ((~clock_crossing_bridge_m1_qualified_request_lcd_light_s1 | ~clock_crossing_bridge_m1_write | (1 & clock_crossing_bridge_m1_write)));

  //cascaded wait assignment, which is an e_assign
  assign clock_crossing_bridge_m1_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (clock_crossing_bridge_m1_qualified_request_leds_s1 | ~clock_crossing_bridge_m1_requests_leds_s1) & ((~clock_crossing_bridge_m1_qualified_request_leds_s1 | ~clock_crossing_bridge_m1_read | (1 & ~d1_leds_s1_end_xfer & clock_crossing_bridge_m1_read))) & ((~clock_crossing_bridge_m1_qualified_request_leds_s1 | ~clock_crossing_bridge_m1_write | (1 & clock_crossing_bridge_m1_write))) & 1 & (clock_crossing_bridge_m1_qualified_request_seg7_s1 | ~clock_crossing_bridge_m1_requests_seg7_s1) & ((~clock_crossing_bridge_m1_qualified_request_seg7_s1 | ~clock_crossing_bridge_m1_read | (1 & ~d1_seg7_s1_end_xfer & clock_crossing_bridge_m1_read))) & ((~clock_crossing_bridge_m1_qualified_request_seg7_s1 | ~clock_crossing_bridge_m1_write | (1 & clock_crossing_bridge_m1_write))) & 1 & (clock_crossing_bridge_m1_qualified_request_switches_s1 | ~clock_crossing_bridge_m1_requests_switches_s1) & ((~clock_crossing_bridge_m1_qualified_request_switches_s1 | ~clock_crossing_bridge_m1_read | (1 & ~d1_switches_s1_end_xfer & clock_crossing_bridge_m1_read))) & ((~clock_crossing_bridge_m1_qualified_request_switches_s1 | ~clock_crossing_bridge_m1_write | (1 & clock_crossing_bridge_m1_write))) & 1 & (clock_crossing_bridge_m1_qualified_request_sysid_control_slave | ~clock_crossing_bridge_m1_requests_sysid_control_slave) & ((~clock_crossing_bridge_m1_qualified_request_sysid_control_slave | ~clock_crossing_bridge_m1_read | (1 & ~d1_sysid_control_slave_end_xfer & clock_crossing_bridge_m1_read))) & ((~clock_crossing_bridge_m1_qualified_request_sysid_control_slave | ~clock_crossing_bridge_m1_write | (1 & clock_crossing_bridge_m1_write))) & 1 & (clock_crossing_bridge_m1_qualified_request_timer_s1 | ~clock_crossing_bridge_m1_requests_timer_s1) & ((~clock_crossing_bridge_m1_qualified_request_timer_s1 | ~clock_crossing_bridge_m1_read | (1 & ~d1_timer_s1_end_xfer & clock_crossing_bridge_m1_read))) & ((~clock_crossing_bridge_m1_qualified_request_timer_s1 | ~clock_crossing_bridge_m1_write | (1 & clock_crossing_bridge_m1_write)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (clock_crossing_bridge_m1_qualified_request_uart_s1 | ~clock_crossing_bridge_m1_requests_uart_s1) & ((~clock_crossing_bridge_m1_qualified_request_uart_s1 | ~(clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write) | (1 & ~d1_uart_s1_end_xfer & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write)))) & ((~clock_crossing_bridge_m1_qualified_request_uart_s1 | ~(clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write) | (1 & ~d1_uart_s1_end_xfer & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign clock_crossing_bridge_m1_address_to_slave = clock_crossing_bridge_m1_address[10 : 0];

  //clock_crossing_bridge_m1_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_bridge_m1_read_but_no_slave_selected <= 0;
      else 
        clock_crossing_bridge_m1_read_but_no_slave_selected <= clock_crossing_bridge_m1_read & clock_crossing_bridge_m1_run & ~clock_crossing_bridge_m1_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign clock_crossing_bridge_m1_is_granted_some_slave = clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in |
    clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in |
    clock_crossing_bridge_m1_granted_buttons_s1 |
    clock_crossing_bridge_m1_granted_lcd_control_slave |
    clock_crossing_bridge_m1_granted_lcd_light_s1 |
    clock_crossing_bridge_m1_granted_leds_s1 |
    clock_crossing_bridge_m1_granted_seg7_s1 |
    clock_crossing_bridge_m1_granted_switches_s1 |
    clock_crossing_bridge_m1_granted_sysid_control_slave |
    clock_crossing_bridge_m1_granted_timer_s1 |
    clock_crossing_bridge_m1_granted_uart_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_clock_crossing_bridge_m1_readdatavalid = 0;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign clock_crossing_bridge_m1_readdatavalid = clock_crossing_bridge_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_bridge_m1_readdatavalid |
    clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in |
    clock_crossing_bridge_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_bridge_m1_readdatavalid |
    clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in |
    clock_crossing_bridge_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_bridge_m1_readdatavalid |
    clock_crossing_bridge_m1_read_data_valid_buttons_s1 |
    clock_crossing_bridge_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_bridge_m1_readdatavalid |
    clock_crossing_bridge_m1_read_data_valid_lcd_control_slave |
    clock_crossing_bridge_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_bridge_m1_readdatavalid |
    clock_crossing_bridge_m1_read_data_valid_lcd_light_s1 |
    clock_crossing_bridge_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_bridge_m1_readdatavalid |
    clock_crossing_bridge_m1_read_data_valid_leds_s1 |
    clock_crossing_bridge_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_bridge_m1_readdatavalid |
    clock_crossing_bridge_m1_read_data_valid_seg7_s1 |
    clock_crossing_bridge_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_bridge_m1_readdatavalid |
    clock_crossing_bridge_m1_read_data_valid_switches_s1 |
    clock_crossing_bridge_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_bridge_m1_readdatavalid |
    clock_crossing_bridge_m1_read_data_valid_sysid_control_slave |
    clock_crossing_bridge_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_bridge_m1_readdatavalid |
    clock_crossing_bridge_m1_read_data_valid_timer_s1 |
    clock_crossing_bridge_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_bridge_m1_readdatavalid |
    clock_crossing_bridge_m1_read_data_valid_uart_s1;

  //clock_crossing_bridge/m1 readdata mux, which is an e_mux
  assign clock_crossing_bridge_m1_readdata = ({32 {~(clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in & clock_crossing_bridge_m1_read)}} | DE0_SOPC_clock_1_in_readdata_from_sa) &
    ({32 {~(clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in & clock_crossing_bridge_m1_read)}} | DE0_SOPC_clock_2_in_readdata_from_sa) &
    ({32 {~(clock_crossing_bridge_m1_qualified_request_buttons_s1 & clock_crossing_bridge_m1_read)}} | buttons_s1_readdata_from_sa) &
    ({32 {~(clock_crossing_bridge_m1_qualified_request_lcd_control_slave & clock_crossing_bridge_m1_read)}} | lcd_control_slave_readdata_from_sa) &
    ({32 {~(clock_crossing_bridge_m1_qualified_request_lcd_light_s1 & clock_crossing_bridge_m1_read)}} | lcd_light_s1_readdata_from_sa) &
    ({32 {~(clock_crossing_bridge_m1_qualified_request_leds_s1 & clock_crossing_bridge_m1_read)}} | leds_s1_readdata_from_sa) &
    ({32 {~(clock_crossing_bridge_m1_qualified_request_seg7_s1 & clock_crossing_bridge_m1_read)}} | seg7_s1_readdata_from_sa) &
    ({32 {~(clock_crossing_bridge_m1_qualified_request_switches_s1 & clock_crossing_bridge_m1_read)}} | switches_s1_readdata_from_sa) &
    ({32 {~(clock_crossing_bridge_m1_qualified_request_sysid_control_slave & clock_crossing_bridge_m1_read)}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~(clock_crossing_bridge_m1_qualified_request_timer_s1 & clock_crossing_bridge_m1_read)}} | timer_s1_readdata_from_sa) &
    ({32 {~(clock_crossing_bridge_m1_qualified_request_uart_s1 & clock_crossing_bridge_m1_read)}} | uart_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign clock_crossing_bridge_m1_waitrequest = ~clock_crossing_bridge_m1_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_bridge_m1_latency_counter <= 0;
      else 
        clock_crossing_bridge_m1_latency_counter <= p1_clock_crossing_bridge_m1_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_clock_crossing_bridge_m1_latency_counter = ((clock_crossing_bridge_m1_run & clock_crossing_bridge_m1_read))? latency_load_value :
    (clock_crossing_bridge_m1_latency_counter)? clock_crossing_bridge_m1_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //clock_crossing_bridge_m1_reset_n assignment, which is an e_assign
  assign clock_crossing_bridge_m1_reset_n = reset_n;

  //mux clock_crossing_bridge_m1_endofpacket, which is an e_mux
  assign clock_crossing_bridge_m1_endofpacket = (clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in)? DE0_SOPC_clock_1_in_endofpacket_from_sa :
    DE0_SOPC_clock_2_in_endofpacket_from_sa;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //clock_crossing_bridge_m1_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_bridge_m1_address_last_time <= 0;
      else 
        clock_crossing_bridge_m1_address_last_time <= clock_crossing_bridge_m1_address;
    end


  //clock_crossing_bridge/m1 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= clock_crossing_bridge_m1_waitrequest & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write);
    end


  //clock_crossing_bridge_m1_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_bridge_m1_address != clock_crossing_bridge_m1_address_last_time))
        begin
          $write("%0d ns: clock_crossing_bridge_m1_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_bridge_m1_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_bridge_m1_byteenable_last_time <= 0;
      else 
        clock_crossing_bridge_m1_byteenable_last_time <= clock_crossing_bridge_m1_byteenable;
    end


  //clock_crossing_bridge_m1_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_bridge_m1_byteenable != clock_crossing_bridge_m1_byteenable_last_time))
        begin
          $write("%0d ns: clock_crossing_bridge_m1_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_bridge_m1_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_bridge_m1_read_last_time <= 0;
      else 
        clock_crossing_bridge_m1_read_last_time <= clock_crossing_bridge_m1_read;
    end


  //clock_crossing_bridge_m1_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_bridge_m1_read != clock_crossing_bridge_m1_read_last_time))
        begin
          $write("%0d ns: clock_crossing_bridge_m1_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_bridge_m1_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_bridge_m1_write_last_time <= 0;
      else 
        clock_crossing_bridge_m1_write_last_time <= clock_crossing_bridge_m1_write;
    end


  //clock_crossing_bridge_m1_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_bridge_m1_write != clock_crossing_bridge_m1_write_last_time))
        begin
          $write("%0d ns: clock_crossing_bridge_m1_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_bridge_m1_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_bridge_m1_writedata_last_time <= 0;
      else 
        clock_crossing_bridge_m1_writedata_last_time <= clock_crossing_bridge_m1_writedata;
    end


  //clock_crossing_bridge_m1_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_bridge_m1_writedata != clock_crossing_bridge_m1_writedata_last_time) & clock_crossing_bridge_m1_write)
        begin
          $write("%0d ns: clock_crossing_bridge_m1_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module clock_crossing_bridge_bridge_arbitrator 
;



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_read,
                                           cpu_data_master_waitrequest,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_read,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 25: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_read;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg     [  1: 0] cpu_jtag_debug_module_arb_share_counter;
  wire    [  1: 0] cpu_jtag_debug_module_arb_share_counter_next_value;
  wire    [  1: 0] cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 25: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 25: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[25 : 11] , 11'b0} == 26'h2810800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[25 : 11] , 11'b0} == 26'h2810800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~(cpu_data_master_arbiterlock);
  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module buttons_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                      // inputs:
                                                                       clk,
                                                                       data_in,
                                                                       reset_n,

                                                                      // outputs:
                                                                       data_out
                                                                    )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module switches_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                       // inputs:
                                                                        clk,
                                                                        data_in,
                                                                        reset_n,

                                                                       // outputs:
                                                                        data_out
                                                                     )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                    // inputs:
                                                                     clk,
                                                                     data_in,
                                                                     reset_n,

                                                                    // outputs:
                                                                     data_out
                                                                  )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_0_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                      // inputs:
                                                                       clk,
                                                                       data_in,
                                                                       reset_n,

                                                                      // outputs:
                                                                       data_out
                                                                    )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uart_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                   // inputs:
                                                                    clk,
                                                                    data_in,
                                                                    reset_n,

                                                                   // outputs:
                                                                    data_out
                                                                 )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     DE0_SOPC_clock_0_in_readdata_from_sa,
                                     DE0_SOPC_clock_0_in_waitrequest_from_sa,
                                     buttons_s1_irq_from_sa,
                                     cfi_flash_s1_wait_counter_eq_0,
                                     cfi_flash_s1_wait_counter_eq_1,
                                     clk,
                                     clock_crossing_bridge_s1_readdata_from_sa,
                                     clock_crossing_bridge_s1_waitrequest_from_sa,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable_cfi_flash_s1,
                                     cpu_data_master_byteenable_sdram_s1,
                                     cpu_data_master_granted_DE0_SOPC_clock_0_in,
                                     cpu_data_master_granted_cfi_flash_s1,
                                     cpu_data_master_granted_clock_crossing_bridge_s1,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_granted_onchip_mem_s1,
                                     cpu_data_master_granted_sdram_s1,
                                     cpu_data_master_qualified_request_DE0_SOPC_clock_0_in,
                                     cpu_data_master_qualified_request_cfi_flash_s1,
                                     cpu_data_master_qualified_request_clock_crossing_bridge_s1,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_onchip_mem_s1,
                                     cpu_data_master_qualified_request_sdram_s1,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in,
                                     cpu_data_master_read_data_valid_cfi_flash_s1,
                                     cpu_data_master_read_data_valid_clock_crossing_bridge_s1,
                                     cpu_data_master_read_data_valid_clock_crossing_bridge_s1_shift_register,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_read_data_valid_onchip_mem_s1,
                                     cpu_data_master_read_data_valid_sdram_s1,
                                     cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                     cpu_data_master_requests_DE0_SOPC_clock_0_in,
                                     cpu_data_master_requests_cfi_flash_s1,
                                     cpu_data_master_requests_clock_crossing_bridge_s1,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_requests_onchip_mem_s1,
                                     cpu_data_master_requests_sdram_s1,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_DE0_SOPC_clock_0_in_end_xfer,
                                     d1_clock_crossing_bridge_s1_end_xfer,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                     d1_onchip_mem_s1_end_xfer,
                                     d1_sdram_s1_end_xfer,
                                     d1_tristate_bridge_avalon_slave_end_xfer,
                                     incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0,
                                     jtag_uart_avalon_jtag_slave_irq_from_sa,
                                     jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                     jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                     onchip_mem_s1_readdata_from_sa,
                                     pll_cpu,
                                     pll_cpu_reset_n,
                                     registered_cpu_data_master_read_data_valid_cfi_flash_s1,
                                     registered_cpu_data_master_read_data_valid_onchip_mem_s1,
                                     reset_n,
                                     sdram_s1_readdata_from_sa,
                                     sdram_s1_waitrequest_from_sa,
                                     switches_s1_irq_from_sa,
                                     timer_0_s1_irq_from_sa,
                                     timer_s1_irq_from_sa,
                                     uart_s1_irq_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_dbs_address,
                                     cpu_data_master_dbs_write_16,
                                     cpu_data_master_irq,
                                     cpu_data_master_no_byte_enables_and_last_term,
                                     cpu_data_master_readdata,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 25: 0] cpu_data_master_address_to_slave;
  output  [  1: 0] cpu_data_master_dbs_address;
  output  [ 15: 0] cpu_data_master_dbs_write_16;
  output  [ 31: 0] cpu_data_master_irq;
  output           cpu_data_master_no_byte_enables_and_last_term;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_waitrequest;
  input   [ 15: 0] DE0_SOPC_clock_0_in_readdata_from_sa;
  input            DE0_SOPC_clock_0_in_waitrequest_from_sa;
  input            buttons_s1_irq_from_sa;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            cfi_flash_s1_wait_counter_eq_1;
  input            clk;
  input   [ 31: 0] clock_crossing_bridge_s1_readdata_from_sa;
  input            clock_crossing_bridge_s1_waitrequest_from_sa;
  input   [ 25: 0] cpu_data_master_address;
  input   [  1: 0] cpu_data_master_byteenable_cfi_flash_s1;
  input   [  1: 0] cpu_data_master_byteenable_sdram_s1;
  input            cpu_data_master_granted_DE0_SOPC_clock_0_in;
  input            cpu_data_master_granted_cfi_flash_s1;
  input            cpu_data_master_granted_clock_crossing_bridge_s1;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_granted_onchip_mem_s1;
  input            cpu_data_master_granted_sdram_s1;
  input            cpu_data_master_qualified_request_DE0_SOPC_clock_0_in;
  input            cpu_data_master_qualified_request_cfi_flash_s1;
  input            cpu_data_master_qualified_request_clock_crossing_bridge_s1;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_onchip_mem_s1;
  input            cpu_data_master_qualified_request_sdram_s1;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in;
  input            cpu_data_master_read_data_valid_cfi_flash_s1;
  input            cpu_data_master_read_data_valid_clock_crossing_bridge_s1;
  input            cpu_data_master_read_data_valid_clock_crossing_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_read_data_valid_onchip_mem_s1;
  input            cpu_data_master_read_data_valid_sdram_s1;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_requests_DE0_SOPC_clock_0_in;
  input            cpu_data_master_requests_cfi_flash_s1;
  input            cpu_data_master_requests_clock_crossing_bridge_s1;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_requests_onchip_mem_s1;
  input            cpu_data_master_requests_sdram_s1;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_DE0_SOPC_clock_0_in_end_xfer;
  input            d1_clock_crossing_bridge_s1_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_onchip_mem_s1_end_xfer;
  input            d1_sdram_s1_end_xfer;
  input            d1_tristate_bridge_avalon_slave_end_xfer;
  input   [ 15: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input   [ 31: 0] onchip_mem_s1_readdata_from_sa;
  input            pll_cpu;
  input            pll_cpu_reset_n;
  input            registered_cpu_data_master_read_data_valid_cfi_flash_s1;
  input            registered_cpu_data_master_read_data_valid_onchip_mem_s1;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;
  input            switches_s1_irq_from_sa;
  input            timer_0_s1_irq_from_sa;
  input            timer_s1_irq_from_sa;
  input            uart_s1_irq_from_sa;

  wire    [ 25: 0] cpu_data_master_address_to_slave;
  reg     [  1: 0] cpu_data_master_dbs_address;
  wire    [  1: 0] cpu_data_master_dbs_increment;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [ 31: 0] cpu_data_master_irq;
  reg              cpu_data_master_no_byte_enables_and_last_term;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_run;
  reg              cpu_data_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire             last_dbs_term_and_run;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [ 31: 0] p1_registered_cpu_data_master_readdata;
  wire             pll_cpu_buttons_s1_irq_from_sa;
  wire             pll_cpu_switches_s1_irq_from_sa;
  wire             pll_cpu_timer_0_s1_irq_from_sa;
  wire             pll_cpu_timer_s1_irq_from_sa;
  wire             pll_cpu_uart_s1_irq_from_sa;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  reg     [ 31: 0] registered_cpu_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_DE0_SOPC_clock_0_in | ~cpu_data_master_requests_DE0_SOPC_clock_0_in) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_DE0_SOPC_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~DE0_SOPC_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_clock_crossing_bridge_s1 | cpu_data_master_read_data_valid_clock_crossing_bridge_s1 | ~cpu_data_master_requests_clock_crossing_bridge_s1) & ((~cpu_data_master_qualified_request_clock_crossing_bridge_s1 | ~cpu_data_master_read | (cpu_data_master_read_data_valid_clock_crossing_bridge_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_clock_crossing_bridge_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~clock_crossing_bridge_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~cpu_data_master_requests_jtag_uart_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_data_master_qualified_request_onchip_mem_s1 | registered_cpu_data_master_read_data_valid_onchip_mem_s1 | ~cpu_data_master_requests_onchip_mem_s1) & (cpu_data_master_granted_onchip_mem_s1 | ~cpu_data_master_qualified_request_onchip_mem_s1) & ((~cpu_data_master_qualified_request_onchip_mem_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_onchip_mem_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_onchip_mem_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_sdram_s1 | (cpu_data_master_read_data_valid_sdram_s1 & cpu_data_master_dbs_address[1]) | (cpu_data_master_write & !cpu_data_master_byteenable_sdram_s1 & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_sdram_s1) & (cpu_data_master_granted_sdram_s1 | ~cpu_data_master_qualified_request_sdram_s1) & ((~cpu_data_master_qualified_request_sdram_s1 | ~cpu_data_master_read | (cpu_data_master_read_data_valid_sdram_s1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sdram_s1 | ~cpu_data_master_write | (1 & ~sdram_s1_waitrequest_from_sa & (cpu_data_master_dbs_address[1]) & cpu_data_master_write)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_data_master_qualified_request_cfi_flash_s1 | (registered_cpu_data_master_read_data_valid_cfi_flash_s1 & cpu_data_master_dbs_address[1]) | (cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1 & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_cfi_flash_s1) & (cpu_data_master_granted_cfi_flash_s1 | ~cpu_data_master_qualified_request_cfi_flash_s1) & ((~cpu_data_master_qualified_request_cfi_flash_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_cfi_flash_s1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cfi_flash_s1 | ~cpu_data_master_write | (1 & cfi_flash_s1_wait_counter_eq_1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[25 : 0];

  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_data_master_readdata <= 0;
      else 
        registered_cpu_data_master_readdata <= p1_registered_cpu_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_data_master_readdata = ({32 {~cpu_data_master_requests_DE0_SOPC_clock_0_in}} | DE0_SOPC_clock_0_in_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_clock_crossing_bridge_s1}} | clock_crossing_bridge_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_jtag_uart_avalon_jtag_slave}} | jtag_uart_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sdram_s1}} | {sdram_s1_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0});

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~cpu_data_master_requests_DE0_SOPC_clock_0_in}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_clock_crossing_bridge_s1}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_jtag_uart_avalon_jtag_slave}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_onchip_mem_s1}} | onchip_mem_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sdram_s1}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_cfi_flash_s1}} | {incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[15 : 0],
    dbs_16_reg_segment_0});

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_waitrequest <= ~0;
      else 
        cpu_data_master_waitrequest <= ~((~(cpu_data_master_read | cpu_data_master_write))? 0: (cpu_data_master_run & cpu_data_master_waitrequest));
    end


  //buttons_s1_irq_from_sa from pll_io to pll_cpu
  buttons_s1_irq_from_sa_clock_crossing_cpu_data_master_module buttons_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (pll_cpu),
      .data_in  (buttons_s1_irq_from_sa),
      .data_out (pll_cpu_buttons_s1_irq_from_sa),
      .reset_n  (pll_cpu_reset_n)
    );

  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    pll_cpu_timer_0_s1_irq_from_sa,
    pll_cpu_uart_s1_irq_from_sa,
    pll_cpu_timer_s1_irq_from_sa,
    pll_cpu_buttons_s1_irq_from_sa,
    pll_cpu_switches_s1_irq_from_sa,
    jtag_uart_avalon_jtag_slave_irq_from_sa};

  //no_byte_enables_and_last_term, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_no_byte_enables_and_last_term <= 0;
      else 
        cpu_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end


  //compute the last dbs term, which is an e_mux
  assign last_dbs_term_and_run = (cpu_data_master_requests_sdram_s1)? (((cpu_data_master_dbs_address == 2'b10) & cpu_data_master_write & !cpu_data_master_byteenable_sdram_s1)) :
    (((cpu_data_master_dbs_address == 2'b10) & cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1));

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~cpu_data_master_no_byte_enables_and_last_term) & cpu_data_master_requests_sdram_s1 & cpu_data_master_write & !cpu_data_master_byteenable_sdram_s1)) |
    cpu_data_master_read_data_valid_sdram_s1 |
    (cpu_data_master_granted_sdram_s1 & cpu_data_master_write & 1 & 1 & ~sdram_s1_waitrequest_from_sa) |
    (((~cpu_data_master_no_byte_enables_and_last_term) & cpu_data_master_requests_cfi_flash_s1 & cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1)) |
    cpu_data_master_read_data_valid_cfi_flash_s1 |
    ((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tristate_bridge_avalon_slave_end_xfer})));

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = (cpu_data_master_requests_sdram_s1)? sdram_s1_readdata_from_sa :
    incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_data_master_dbs_write_16 = (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    (~(cpu_data_master_dbs_address[1]))? cpu_data_master_writedata[15 : 0] :
    (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    cpu_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_data_master_dbs_increment = (cpu_data_master_requests_sdram_s1)? 2 :
    (cpu_data_master_requests_cfi_flash_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_data_master_dbs_address + cpu_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable &
    (~(cpu_data_master_requests_sdram_s1 & ~cpu_data_master_waitrequest));

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_data_master_dbs_address <= next_dbs_address;
    end


  //switches_s1_irq_from_sa from pll_io to pll_cpu
  switches_s1_irq_from_sa_clock_crossing_cpu_data_master_module switches_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (pll_cpu),
      .data_in  (switches_s1_irq_from_sa),
      .data_out (pll_cpu_switches_s1_irq_from_sa),
      .reset_n  (pll_cpu_reset_n)
    );

  //timer_s1_irq_from_sa from pll_io to pll_cpu
  timer_s1_irq_from_sa_clock_crossing_cpu_data_master_module timer_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (pll_cpu),
      .data_in  (timer_s1_irq_from_sa),
      .data_out (pll_cpu_timer_s1_irq_from_sa),
      .reset_n  (pll_cpu_reset_n)
    );

  //timer_0_s1_irq_from_sa from clk to pll_cpu
  timer_0_s1_irq_from_sa_clock_crossing_cpu_data_master_module timer_0_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (pll_cpu),
      .data_in  (timer_0_s1_irq_from_sa),
      .data_out (pll_cpu_timer_0_s1_irq_from_sa),
      .reset_n  (pll_cpu_reset_n)
    );

  //uart_s1_irq_from_sa from pll_io to pll_cpu
  uart_s1_irq_from_sa_clock_crossing_cpu_data_master_module uart_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (pll_cpu),
      .data_in  (uart_s1_irq_from_sa),
      .data_out (pll_cpu_uart_s1_irq_from_sa),
      .reset_n  (pll_cpu_reset_n)
    );


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            cfi_flash_s1_wait_counter_eq_0,
                                            cfi_flash_s1_wait_counter_eq_1,
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cfi_flash_s1,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_onchip_mem_s1,
                                            cpu_instruction_master_granted_sdram_s1,
                                            cpu_instruction_master_qualified_request_cfi_flash_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_onchip_mem_s1,
                                            cpu_instruction_master_qualified_request_sdram_s1,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cfi_flash_s1,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_onchip_mem_s1,
                                            cpu_instruction_master_read_data_valid_sdram_s1,
                                            cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                                            cpu_instruction_master_requests_cfi_flash_s1,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_onchip_mem_s1,
                                            cpu_instruction_master_requests_sdram_s1,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_onchip_mem_s1_end_xfer,
                                            d1_sdram_s1_end_xfer,
                                            d1_tristate_bridge_avalon_slave_end_xfer,
                                            incoming_data_to_and_from_the_cfi_flash,
                                            onchip_mem_s1_readdata_from_sa,
                                            reset_n,
                                            sdram_s1_readdata_from_sa,
                                            sdram_s1_waitrequest_from_sa,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_dbs_address,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 25: 0] cpu_instruction_master_address_to_slave;
  output  [  1: 0] cpu_instruction_master_dbs_address;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_waitrequest;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            cfi_flash_s1_wait_counter_eq_1;
  input            clk;
  input   [ 25: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cfi_flash_s1;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_onchip_mem_s1;
  input            cpu_instruction_master_granted_sdram_s1;
  input            cpu_instruction_master_qualified_request_cfi_flash_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_onchip_mem_s1;
  input            cpu_instruction_master_qualified_request_sdram_s1;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cfi_flash_s1;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_onchip_mem_s1;
  input            cpu_instruction_master_read_data_valid_sdram_s1;
  input            cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_instruction_master_requests_cfi_flash_s1;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_onchip_mem_s1;
  input            cpu_instruction_master_requests_sdram_s1;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_onchip_mem_s1_end_xfer;
  input            d1_sdram_s1_end_xfer;
  input            d1_tristate_bridge_avalon_slave_end_xfer;
  input   [ 15: 0] incoming_data_to_and_from_the_cfi_flash;
  input   [ 31: 0] onchip_mem_s1_readdata_from_sa;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 25: 0] cpu_instruction_master_address_last_time;
  wire    [ 25: 0] cpu_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_instruction_master_dbs_address;
  wire    [  1: 0] cpu_instruction_master_dbs_increment;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_instruction_master_qualified_request_onchip_mem_s1 | cpu_instruction_master_read_data_valid_onchip_mem_s1 | ~cpu_instruction_master_requests_onchip_mem_s1) & (cpu_instruction_master_granted_onchip_mem_s1 | ~cpu_instruction_master_qualified_request_onchip_mem_s1) & ((~cpu_instruction_master_qualified_request_onchip_mem_s1 | ~cpu_instruction_master_read | (cpu_instruction_master_read_data_valid_onchip_mem_s1 & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_sdram_s1 | (cpu_instruction_master_read_data_valid_sdram_s1 & cpu_instruction_master_dbs_address[1]) | ~cpu_instruction_master_requests_sdram_s1) & (cpu_instruction_master_granted_sdram_s1 | ~cpu_instruction_master_qualified_request_sdram_s1) & ((~cpu_instruction_master_qualified_request_sdram_s1 | ~cpu_instruction_master_read | (cpu_instruction_master_read_data_valid_sdram_s1 & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_instruction_master_qualified_request_cfi_flash_s1 | (cpu_instruction_master_read_data_valid_cfi_flash_s1 & cpu_instruction_master_dbs_address[1]) | ~cpu_instruction_master_requests_cfi_flash_s1) & (cpu_instruction_master_granted_cfi_flash_s1 | ~cpu_instruction_master_qualified_request_cfi_flash_s1) & ((~cpu_instruction_master_qualified_request_cfi_flash_s1 | ~cpu_instruction_master_read | (cpu_instruction_master_read_data_valid_cfi_flash_s1 & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[25 : 0];

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~cpu_instruction_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_requests_onchip_mem_s1}} | onchip_mem_s1_readdata_from_sa) &
    ({32 {~cpu_instruction_master_requests_sdram_s1}} | {sdram_s1_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_instruction_master_requests_cfi_flash_s1}} | {incoming_data_to_and_from_the_cfi_flash[15 : 0],
    dbs_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = (cpu_instruction_master_requests_sdram_s1)? sdram_s1_readdata_from_sa :
    incoming_data_to_and_from_the_cfi_flash;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_instruction_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_instruction_master_dbs_increment = (cpu_instruction_master_requests_sdram_s1)? 2 :
    (cpu_instruction_master_requests_cfi_flash_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_instruction_master_dbs_address + cpu_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_instruction_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = cpu_instruction_master_read_data_valid_sdram_s1 |
    cpu_instruction_master_read_data_valid_cfi_flash_s1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 clk,
                                                 cpu_data_master_address_to_slave,
                                                 cpu_data_master_read,
                                                 cpu_data_master_waitrequest,
                                                 cpu_data_master_write,
                                                 cpu_data_master_writedata,
                                                 jtag_uart_avalon_jtag_slave_dataavailable,
                                                 jtag_uart_avalon_jtag_slave_irq,
                                                 jtag_uart_avalon_jtag_slave_readdata,
                                                 jtag_uart_avalon_jtag_slave_readyfordata,
                                                 jtag_uart_avalon_jtag_slave_waitrequest,
                                                 reset_n,

                                                // outputs:
                                                 cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                                 d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                                 jtag_uart_avalon_jtag_slave_address,
                                                 jtag_uart_avalon_jtag_slave_chipselect,
                                                 jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                 jtag_uart_avalon_jtag_slave_irq_from_sa,
                                                 jtag_uart_avalon_jtag_slave_read_n,
                                                 jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_reset_n,
                                                 jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                 jtag_uart_avalon_jtag_slave_write_n,
                                                 jtag_uart_avalon_jtag_slave_writedata
                                              )
;

  output           cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  output           d1_jtag_uart_avalon_jtag_slave_end_xfer;
  output           jtag_uart_avalon_jtag_slave_address;
  output           jtag_uart_avalon_jtag_slave_chipselect;
  output           jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_avalon_jtag_slave_reset_n;
  output           jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            jtag_uart_avalon_jtag_slave_dataavailable;
  input            jtag_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  input            jtag_uart_avalon_jtag_slave_readyfordata;
  input            jtag_uart_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave;
  reg              d1_jtag_uart_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_allgrants;
  wire             jtag_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_avalon_jtag_slave_arb_counter_enable;
  reg     [  1: 0] jtag_uart_avalon_jtag_slave_arb_share_counter;
  wire    [  1: 0] jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  1: 0] jtag_uart_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  reg              jtag_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [ 25: 0] shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master;
  wire             wait_for_jtag_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave));
  //assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata;

  assign cpu_data_master_requests_jtag_uart_avalon_jtag_slave = ({cpu_data_master_address_to_slave[25 : 3] , 3'b0} == 26'h2811020) & (cpu_data_master_read | cpu_data_master_write);
  //assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest;

  //jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_non_bursting_master_requests = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_avalon_jtag_slave_firsttransfer ? (jtag_uart_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_avalon_jtag_slave_arb_share_counter ? (jtag_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_allgrants = |jtag_uart_avalon_jtag_slave_grant_vector;

  //jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_end_xfer = ~(jtag_uart_avalon_jtag_slave_waits_for_read | jtag_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave = jtag_uart_avalon_jtag_slave_end_xfer & (~jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & jtag_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = jtag_uart_avalon_jtag_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_jtag_uart_avalon_jtag_slave = cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;

  //cpu/data_master saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  assign cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_avalon_jtag_slave_chipselect = cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  //jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_firsttransfer = jtag_uart_avalon_jtag_slave_begins_xfer ? jtag_uart_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_avalon_jtag_slave_begins_xfer)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_read_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read);

  //~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_write_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write);

  assign shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_address = shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master >> 2;

  //d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_read = jtag_uart_avalon_jtag_slave_in_a_read_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_read_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_write = jtag_uart_avalon_jtag_slave_in_a_write_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_write_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_control_slave_arbitrator (
                                      // inputs:
                                       clk,
                                       clock_crossing_bridge_m1_address_to_slave,
                                       clock_crossing_bridge_m1_byteenable,
                                       clock_crossing_bridge_m1_latency_counter,
                                       clock_crossing_bridge_m1_nativeaddress,
                                       clock_crossing_bridge_m1_read,
                                       clock_crossing_bridge_m1_write,
                                       clock_crossing_bridge_m1_writedata,
                                       lcd_control_slave_readdata,
                                       reset_n,

                                      // outputs:
                                       clock_crossing_bridge_m1_granted_lcd_control_slave,
                                       clock_crossing_bridge_m1_qualified_request_lcd_control_slave,
                                       clock_crossing_bridge_m1_read_data_valid_lcd_control_slave,
                                       clock_crossing_bridge_m1_requests_lcd_control_slave,
                                       d1_lcd_control_slave_end_xfer,
                                       lcd_control_slave_address,
                                       lcd_control_slave_begintransfer,
                                       lcd_control_slave_read,
                                       lcd_control_slave_readdata_from_sa,
                                       lcd_control_slave_reset_n,
                                       lcd_control_slave_wait_counter_eq_0,
                                       lcd_control_slave_write,
                                       lcd_control_slave_writedata
                                    )
;

  output           clock_crossing_bridge_m1_granted_lcd_control_slave;
  output           clock_crossing_bridge_m1_qualified_request_lcd_control_slave;
  output           clock_crossing_bridge_m1_read_data_valid_lcd_control_slave;
  output           clock_crossing_bridge_m1_requests_lcd_control_slave;
  output           d1_lcd_control_slave_end_xfer;
  output  [  1: 0] lcd_control_slave_address;
  output           lcd_control_slave_begintransfer;
  output           lcd_control_slave_read;
  output  [  7: 0] lcd_control_slave_readdata_from_sa;
  output           lcd_control_slave_reset_n;
  output           lcd_control_slave_wait_counter_eq_0;
  output           lcd_control_slave_write;
  output  [  7: 0] lcd_control_slave_writedata;
  input            clk;
  input   [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  input   [  3: 0] clock_crossing_bridge_m1_byteenable;
  input            clock_crossing_bridge_m1_latency_counter;
  input   [  8: 0] clock_crossing_bridge_m1_nativeaddress;
  input            clock_crossing_bridge_m1_read;
  input            clock_crossing_bridge_m1_write;
  input   [ 31: 0] clock_crossing_bridge_m1_writedata;
  input   [  7: 0] lcd_control_slave_readdata;
  input            reset_n;

  wire             clock_crossing_bridge_m1_arbiterlock;
  wire             clock_crossing_bridge_m1_arbiterlock2;
  wire             clock_crossing_bridge_m1_continuerequest;
  wire             clock_crossing_bridge_m1_granted_lcd_control_slave;
  wire             clock_crossing_bridge_m1_qualified_request_lcd_control_slave;
  wire             clock_crossing_bridge_m1_read_data_valid_lcd_control_slave;
  wire             clock_crossing_bridge_m1_requests_lcd_control_slave;
  wire             clock_crossing_bridge_m1_saved_grant_lcd_control_slave;
  reg              d1_lcd_control_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_control_slave_address;
  wire             lcd_control_slave_allgrants;
  wire             lcd_control_slave_allow_new_arb_cycle;
  wire             lcd_control_slave_any_bursting_master_saved_grant;
  wire             lcd_control_slave_any_continuerequest;
  wire             lcd_control_slave_arb_counter_enable;
  reg              lcd_control_slave_arb_share_counter;
  wire             lcd_control_slave_arb_share_counter_next_value;
  wire             lcd_control_slave_arb_share_set_values;
  wire             lcd_control_slave_beginbursttransfer_internal;
  wire             lcd_control_slave_begins_xfer;
  wire             lcd_control_slave_begintransfer;
  wire    [  2: 0] lcd_control_slave_counter_load_value;
  wire             lcd_control_slave_end_xfer;
  wire             lcd_control_slave_firsttransfer;
  wire             lcd_control_slave_grant_vector;
  wire             lcd_control_slave_in_a_read_cycle;
  wire             lcd_control_slave_in_a_write_cycle;
  wire             lcd_control_slave_master_qreq_vector;
  wire             lcd_control_slave_non_bursting_master_requests;
  wire             lcd_control_slave_pretend_byte_enable;
  wire             lcd_control_slave_read;
  wire    [  7: 0] lcd_control_slave_readdata_from_sa;
  reg              lcd_control_slave_reg_firsttransfer;
  wire             lcd_control_slave_reset_n;
  reg              lcd_control_slave_slavearbiterlockenable;
  wire             lcd_control_slave_slavearbiterlockenable2;
  wire             lcd_control_slave_unreg_firsttransfer;
  reg     [  2: 0] lcd_control_slave_wait_counter;
  wire             lcd_control_slave_wait_counter_eq_0;
  wire             lcd_control_slave_waits_for_read;
  wire             lcd_control_slave_waits_for_write;
  wire             lcd_control_slave_write;
  wire    [  7: 0] lcd_control_slave_writedata;
  wire             wait_for_lcd_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~lcd_control_slave_end_xfer;
    end


  assign lcd_control_slave_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_bridge_m1_qualified_request_lcd_control_slave));
  //assign lcd_control_slave_readdata_from_sa = lcd_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign lcd_control_slave_readdata_from_sa = lcd_control_slave_readdata;

  assign clock_crossing_bridge_m1_requests_lcd_control_slave = ({clock_crossing_bridge_m1_address_to_slave[10 : 4] , 4'b0} == 11'h490) & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write);
  //lcd_control_slave_arb_share_counter set values, which is an e_mux
  assign lcd_control_slave_arb_share_set_values = 1;

  //lcd_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign lcd_control_slave_non_bursting_master_requests = clock_crossing_bridge_m1_requests_lcd_control_slave;

  //lcd_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_control_slave_any_bursting_master_saved_grant = 0;

  //lcd_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_control_slave_arb_share_counter_next_value = lcd_control_slave_firsttransfer ? (lcd_control_slave_arb_share_set_values - 1) : |lcd_control_slave_arb_share_counter ? (lcd_control_slave_arb_share_counter - 1) : 0;

  //lcd_control_slave_allgrants all slave grants, which is an e_mux
  assign lcd_control_slave_allgrants = |lcd_control_slave_grant_vector;

  //lcd_control_slave_end_xfer assignment, which is an e_assign
  assign lcd_control_slave_end_xfer = ~(lcd_control_slave_waits_for_read | lcd_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_control_slave = lcd_control_slave_end_xfer & (~lcd_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_control_slave & lcd_control_slave_allgrants) | (end_xfer_arb_share_counter_term_lcd_control_slave & ~lcd_control_slave_non_bursting_master_requests);

  //lcd_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_arb_share_counter <= 0;
      else if (lcd_control_slave_arb_counter_enable)
          lcd_control_slave_arb_share_counter <= lcd_control_slave_arb_share_counter_next_value;
    end


  //lcd_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_slavearbiterlockenable <= 0;
      else if ((|lcd_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_control_slave) | (end_xfer_arb_share_counter_term_lcd_control_slave & ~lcd_control_slave_non_bursting_master_requests))
          lcd_control_slave_slavearbiterlockenable <= |lcd_control_slave_arb_share_counter_next_value;
    end


  //clock_crossing_bridge/m1 lcd/control_slave arbiterlock, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock = lcd_control_slave_slavearbiterlockenable & clock_crossing_bridge_m1_continuerequest;

  //lcd_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_control_slave_slavearbiterlockenable2 = |lcd_control_slave_arb_share_counter_next_value;

  //clock_crossing_bridge/m1 lcd/control_slave arbiterlock2, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock2 = lcd_control_slave_slavearbiterlockenable2 & clock_crossing_bridge_m1_continuerequest;

  //lcd_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_control_slave_any_continuerequest = 1;

  //clock_crossing_bridge_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_bridge_m1_continuerequest = 1;

  assign clock_crossing_bridge_m1_qualified_request_lcd_control_slave = clock_crossing_bridge_m1_requests_lcd_control_slave & ~((clock_crossing_bridge_m1_read & ((clock_crossing_bridge_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_bridge_m1_read_data_valid_lcd_control_slave, which is an e_mux
  assign clock_crossing_bridge_m1_read_data_valid_lcd_control_slave = clock_crossing_bridge_m1_granted_lcd_control_slave & clock_crossing_bridge_m1_read & ~lcd_control_slave_waits_for_read;

  //lcd_control_slave_writedata mux, which is an e_mux
  assign lcd_control_slave_writedata = clock_crossing_bridge_m1_writedata;

  //master is always granted when requested
  assign clock_crossing_bridge_m1_granted_lcd_control_slave = clock_crossing_bridge_m1_qualified_request_lcd_control_slave;

  //clock_crossing_bridge/m1 saved-grant lcd/control_slave, which is an e_assign
  assign clock_crossing_bridge_m1_saved_grant_lcd_control_slave = clock_crossing_bridge_m1_requests_lcd_control_slave;

  //allow new arb cycle for lcd/control_slave, which is an e_assign
  assign lcd_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_control_slave_master_qreq_vector = 1;

  assign lcd_control_slave_begintransfer = lcd_control_slave_begins_xfer;
  //lcd_control_slave_reset_n assignment, which is an e_assign
  assign lcd_control_slave_reset_n = reset_n;

  //lcd_control_slave_firsttransfer first transaction, which is an e_assign
  assign lcd_control_slave_firsttransfer = lcd_control_slave_begins_xfer ? lcd_control_slave_unreg_firsttransfer : lcd_control_slave_reg_firsttransfer;

  //lcd_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_control_slave_unreg_firsttransfer = ~(lcd_control_slave_slavearbiterlockenable & lcd_control_slave_any_continuerequest);

  //lcd_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_reg_firsttransfer <= 1'b1;
      else if (lcd_control_slave_begins_xfer)
          lcd_control_slave_reg_firsttransfer <= lcd_control_slave_unreg_firsttransfer;
    end


  //lcd_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_control_slave_beginbursttransfer_internal = lcd_control_slave_begins_xfer;

  //lcd_control_slave_read assignment, which is an e_mux
  assign lcd_control_slave_read = ((clock_crossing_bridge_m1_granted_lcd_control_slave & clock_crossing_bridge_m1_read))& ~lcd_control_slave_begins_xfer & (lcd_control_slave_wait_counter < 3);

  //lcd_control_slave_write assignment, which is an e_mux
  assign lcd_control_slave_write = ((clock_crossing_bridge_m1_granted_lcd_control_slave & clock_crossing_bridge_m1_write)) & ~lcd_control_slave_begins_xfer & (lcd_control_slave_wait_counter >= 3) & (lcd_control_slave_wait_counter < 6) & lcd_control_slave_pretend_byte_enable;

  //lcd_control_slave_address mux, which is an e_mux
  assign lcd_control_slave_address = clock_crossing_bridge_m1_nativeaddress;

  //d1_lcd_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_control_slave_end_xfer <= 1;
      else 
        d1_lcd_control_slave_end_xfer <= lcd_control_slave_end_xfer;
    end


  //lcd_control_slave_waits_for_read in a cycle, which is an e_mux
  assign lcd_control_slave_waits_for_read = lcd_control_slave_in_a_read_cycle & wait_for_lcd_control_slave_counter;

  //lcd_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign lcd_control_slave_in_a_read_cycle = clock_crossing_bridge_m1_granted_lcd_control_slave & clock_crossing_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_control_slave_in_a_read_cycle;

  //lcd_control_slave_waits_for_write in a cycle, which is an e_mux
  assign lcd_control_slave_waits_for_write = lcd_control_slave_in_a_write_cycle & wait_for_lcd_control_slave_counter;

  //lcd_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign lcd_control_slave_in_a_write_cycle = clock_crossing_bridge_m1_granted_lcd_control_slave & clock_crossing_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_control_slave_in_a_write_cycle;

  assign lcd_control_slave_wait_counter_eq_0 = lcd_control_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_wait_counter <= 0;
      else 
        lcd_control_slave_wait_counter <= lcd_control_slave_counter_load_value;
    end


  assign lcd_control_slave_counter_load_value = ((lcd_control_slave_in_a_read_cycle & lcd_control_slave_begins_xfer))? 4 :
    ((lcd_control_slave_in_a_write_cycle & lcd_control_slave_begins_xfer))? 7 :
    (~lcd_control_slave_wait_counter_eq_0)? lcd_control_slave_wait_counter - 1 :
    0;

  assign wait_for_lcd_control_slave_counter = lcd_control_slave_begins_xfer | ~lcd_control_slave_wait_counter_eq_0;
  //lcd_control_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  assign lcd_control_slave_pretend_byte_enable = (clock_crossing_bridge_m1_granted_lcd_control_slave)? clock_crossing_bridge_m1_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_light_s1_arbitrator (
                                 // inputs:
                                  clk,
                                  clock_crossing_bridge_m1_address_to_slave,
                                  clock_crossing_bridge_m1_latency_counter,
                                  clock_crossing_bridge_m1_nativeaddress,
                                  clock_crossing_bridge_m1_read,
                                  clock_crossing_bridge_m1_write,
                                  clock_crossing_bridge_m1_writedata,
                                  lcd_light_s1_readdata,
                                  reset_n,

                                 // outputs:
                                  clock_crossing_bridge_m1_granted_lcd_light_s1,
                                  clock_crossing_bridge_m1_qualified_request_lcd_light_s1,
                                  clock_crossing_bridge_m1_read_data_valid_lcd_light_s1,
                                  clock_crossing_bridge_m1_requests_lcd_light_s1,
                                  d1_lcd_light_s1_end_xfer,
                                  lcd_light_s1_address,
                                  lcd_light_s1_chipselect,
                                  lcd_light_s1_readdata_from_sa,
                                  lcd_light_s1_reset_n,
                                  lcd_light_s1_write_n,
                                  lcd_light_s1_writedata
                               )
;

  output           clock_crossing_bridge_m1_granted_lcd_light_s1;
  output           clock_crossing_bridge_m1_qualified_request_lcd_light_s1;
  output           clock_crossing_bridge_m1_read_data_valid_lcd_light_s1;
  output           clock_crossing_bridge_m1_requests_lcd_light_s1;
  output           d1_lcd_light_s1_end_xfer;
  output  [  1: 0] lcd_light_s1_address;
  output           lcd_light_s1_chipselect;
  output  [ 31: 0] lcd_light_s1_readdata_from_sa;
  output           lcd_light_s1_reset_n;
  output           lcd_light_s1_write_n;
  output  [ 31: 0] lcd_light_s1_writedata;
  input            clk;
  input   [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  input            clock_crossing_bridge_m1_latency_counter;
  input   [  8: 0] clock_crossing_bridge_m1_nativeaddress;
  input            clock_crossing_bridge_m1_read;
  input            clock_crossing_bridge_m1_write;
  input   [ 31: 0] clock_crossing_bridge_m1_writedata;
  input   [ 31: 0] lcd_light_s1_readdata;
  input            reset_n;

  wire             clock_crossing_bridge_m1_arbiterlock;
  wire             clock_crossing_bridge_m1_arbiterlock2;
  wire             clock_crossing_bridge_m1_continuerequest;
  wire             clock_crossing_bridge_m1_granted_lcd_light_s1;
  wire             clock_crossing_bridge_m1_qualified_request_lcd_light_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_lcd_light_s1;
  wire             clock_crossing_bridge_m1_requests_lcd_light_s1;
  wire             clock_crossing_bridge_m1_saved_grant_lcd_light_s1;
  reg              d1_lcd_light_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_light_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_light_s1_address;
  wire             lcd_light_s1_allgrants;
  wire             lcd_light_s1_allow_new_arb_cycle;
  wire             lcd_light_s1_any_bursting_master_saved_grant;
  wire             lcd_light_s1_any_continuerequest;
  wire             lcd_light_s1_arb_counter_enable;
  reg              lcd_light_s1_arb_share_counter;
  wire             lcd_light_s1_arb_share_counter_next_value;
  wire             lcd_light_s1_arb_share_set_values;
  wire             lcd_light_s1_beginbursttransfer_internal;
  wire             lcd_light_s1_begins_xfer;
  wire             lcd_light_s1_chipselect;
  wire             lcd_light_s1_end_xfer;
  wire             lcd_light_s1_firsttransfer;
  wire             lcd_light_s1_grant_vector;
  wire             lcd_light_s1_in_a_read_cycle;
  wire             lcd_light_s1_in_a_write_cycle;
  wire             lcd_light_s1_master_qreq_vector;
  wire             lcd_light_s1_non_bursting_master_requests;
  wire    [ 31: 0] lcd_light_s1_readdata_from_sa;
  reg              lcd_light_s1_reg_firsttransfer;
  wire             lcd_light_s1_reset_n;
  reg              lcd_light_s1_slavearbiterlockenable;
  wire             lcd_light_s1_slavearbiterlockenable2;
  wire             lcd_light_s1_unreg_firsttransfer;
  wire             lcd_light_s1_waits_for_read;
  wire             lcd_light_s1_waits_for_write;
  wire             lcd_light_s1_write_n;
  wire    [ 31: 0] lcd_light_s1_writedata;
  wire             wait_for_lcd_light_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~lcd_light_s1_end_xfer;
    end


  assign lcd_light_s1_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_bridge_m1_qualified_request_lcd_light_s1));
  //assign lcd_light_s1_readdata_from_sa = lcd_light_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign lcd_light_s1_readdata_from_sa = lcd_light_s1_readdata;

  assign clock_crossing_bridge_m1_requests_lcd_light_s1 = ({clock_crossing_bridge_m1_address_to_slave[10 : 4] , 4'b0} == 11'h4a0) & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write);
  //lcd_light_s1_arb_share_counter set values, which is an e_mux
  assign lcd_light_s1_arb_share_set_values = 1;

  //lcd_light_s1_non_bursting_master_requests mux, which is an e_mux
  assign lcd_light_s1_non_bursting_master_requests = clock_crossing_bridge_m1_requests_lcd_light_s1;

  //lcd_light_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_light_s1_any_bursting_master_saved_grant = 0;

  //lcd_light_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_light_s1_arb_share_counter_next_value = lcd_light_s1_firsttransfer ? (lcd_light_s1_arb_share_set_values - 1) : |lcd_light_s1_arb_share_counter ? (lcd_light_s1_arb_share_counter - 1) : 0;

  //lcd_light_s1_allgrants all slave grants, which is an e_mux
  assign lcd_light_s1_allgrants = |lcd_light_s1_grant_vector;

  //lcd_light_s1_end_xfer assignment, which is an e_assign
  assign lcd_light_s1_end_xfer = ~(lcd_light_s1_waits_for_read | lcd_light_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_light_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_light_s1 = lcd_light_s1_end_xfer & (~lcd_light_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_light_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_light_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_light_s1 & lcd_light_s1_allgrants) | (end_xfer_arb_share_counter_term_lcd_light_s1 & ~lcd_light_s1_non_bursting_master_requests);

  //lcd_light_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_light_s1_arb_share_counter <= 0;
      else if (lcd_light_s1_arb_counter_enable)
          lcd_light_s1_arb_share_counter <= lcd_light_s1_arb_share_counter_next_value;
    end


  //lcd_light_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_light_s1_slavearbiterlockenable <= 0;
      else if ((|lcd_light_s1_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_light_s1) | (end_xfer_arb_share_counter_term_lcd_light_s1 & ~lcd_light_s1_non_bursting_master_requests))
          lcd_light_s1_slavearbiterlockenable <= |lcd_light_s1_arb_share_counter_next_value;
    end


  //clock_crossing_bridge/m1 lcd_light/s1 arbiterlock, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock = lcd_light_s1_slavearbiterlockenable & clock_crossing_bridge_m1_continuerequest;

  //lcd_light_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_light_s1_slavearbiterlockenable2 = |lcd_light_s1_arb_share_counter_next_value;

  //clock_crossing_bridge/m1 lcd_light/s1 arbiterlock2, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock2 = lcd_light_s1_slavearbiterlockenable2 & clock_crossing_bridge_m1_continuerequest;

  //lcd_light_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_light_s1_any_continuerequest = 1;

  //clock_crossing_bridge_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_bridge_m1_continuerequest = 1;

  assign clock_crossing_bridge_m1_qualified_request_lcd_light_s1 = clock_crossing_bridge_m1_requests_lcd_light_s1 & ~((clock_crossing_bridge_m1_read & ((clock_crossing_bridge_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_bridge_m1_read_data_valid_lcd_light_s1, which is an e_mux
  assign clock_crossing_bridge_m1_read_data_valid_lcd_light_s1 = clock_crossing_bridge_m1_granted_lcd_light_s1 & clock_crossing_bridge_m1_read & ~lcd_light_s1_waits_for_read;

  //lcd_light_s1_writedata mux, which is an e_mux
  assign lcd_light_s1_writedata = clock_crossing_bridge_m1_writedata;

  //master is always granted when requested
  assign clock_crossing_bridge_m1_granted_lcd_light_s1 = clock_crossing_bridge_m1_qualified_request_lcd_light_s1;

  //clock_crossing_bridge/m1 saved-grant lcd_light/s1, which is an e_assign
  assign clock_crossing_bridge_m1_saved_grant_lcd_light_s1 = clock_crossing_bridge_m1_requests_lcd_light_s1;

  //allow new arb cycle for lcd_light/s1, which is an e_assign
  assign lcd_light_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_light_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_light_s1_master_qreq_vector = 1;

  //lcd_light_s1_reset_n assignment, which is an e_assign
  assign lcd_light_s1_reset_n = reset_n;

  assign lcd_light_s1_chipselect = clock_crossing_bridge_m1_granted_lcd_light_s1;
  //lcd_light_s1_firsttransfer first transaction, which is an e_assign
  assign lcd_light_s1_firsttransfer = lcd_light_s1_begins_xfer ? lcd_light_s1_unreg_firsttransfer : lcd_light_s1_reg_firsttransfer;

  //lcd_light_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_light_s1_unreg_firsttransfer = ~(lcd_light_s1_slavearbiterlockenable & lcd_light_s1_any_continuerequest);

  //lcd_light_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_light_s1_reg_firsttransfer <= 1'b1;
      else if (lcd_light_s1_begins_xfer)
          lcd_light_s1_reg_firsttransfer <= lcd_light_s1_unreg_firsttransfer;
    end


  //lcd_light_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_light_s1_beginbursttransfer_internal = lcd_light_s1_begins_xfer;

  //~lcd_light_s1_write_n assignment, which is an e_mux
  assign lcd_light_s1_write_n = ~(clock_crossing_bridge_m1_granted_lcd_light_s1 & clock_crossing_bridge_m1_write);

  //lcd_light_s1_address mux, which is an e_mux
  assign lcd_light_s1_address = clock_crossing_bridge_m1_nativeaddress;

  //d1_lcd_light_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_light_s1_end_xfer <= 1;
      else 
        d1_lcd_light_s1_end_xfer <= lcd_light_s1_end_xfer;
    end


  //lcd_light_s1_waits_for_read in a cycle, which is an e_mux
  assign lcd_light_s1_waits_for_read = lcd_light_s1_in_a_read_cycle & lcd_light_s1_begins_xfer;

  //lcd_light_s1_in_a_read_cycle assignment, which is an e_assign
  assign lcd_light_s1_in_a_read_cycle = clock_crossing_bridge_m1_granted_lcd_light_s1 & clock_crossing_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_light_s1_in_a_read_cycle;

  //lcd_light_s1_waits_for_write in a cycle, which is an e_mux
  assign lcd_light_s1_waits_for_write = lcd_light_s1_in_a_write_cycle & 0;

  //lcd_light_s1_in_a_write_cycle assignment, which is an e_assign
  assign lcd_light_s1_in_a_write_cycle = clock_crossing_bridge_m1_granted_lcd_light_s1 & clock_crossing_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_light_s1_in_a_write_cycle;

  assign wait_for_lcd_light_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_light/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module leds_s1_arbitrator (
                            // inputs:
                             clk,
                             clock_crossing_bridge_m1_address_to_slave,
                             clock_crossing_bridge_m1_latency_counter,
                             clock_crossing_bridge_m1_nativeaddress,
                             clock_crossing_bridge_m1_read,
                             clock_crossing_bridge_m1_write,
                             clock_crossing_bridge_m1_writedata,
                             leds_s1_readdata,
                             reset_n,

                            // outputs:
                             clock_crossing_bridge_m1_granted_leds_s1,
                             clock_crossing_bridge_m1_qualified_request_leds_s1,
                             clock_crossing_bridge_m1_read_data_valid_leds_s1,
                             clock_crossing_bridge_m1_requests_leds_s1,
                             d1_leds_s1_end_xfer,
                             leds_s1_address,
                             leds_s1_chipselect,
                             leds_s1_readdata_from_sa,
                             leds_s1_reset_n,
                             leds_s1_write_n,
                             leds_s1_writedata
                          )
;

  output           clock_crossing_bridge_m1_granted_leds_s1;
  output           clock_crossing_bridge_m1_qualified_request_leds_s1;
  output           clock_crossing_bridge_m1_read_data_valid_leds_s1;
  output           clock_crossing_bridge_m1_requests_leds_s1;
  output           d1_leds_s1_end_xfer;
  output  [  1: 0] leds_s1_address;
  output           leds_s1_chipselect;
  output  [ 31: 0] leds_s1_readdata_from_sa;
  output           leds_s1_reset_n;
  output           leds_s1_write_n;
  output  [ 31: 0] leds_s1_writedata;
  input            clk;
  input   [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  input            clock_crossing_bridge_m1_latency_counter;
  input   [  8: 0] clock_crossing_bridge_m1_nativeaddress;
  input            clock_crossing_bridge_m1_read;
  input            clock_crossing_bridge_m1_write;
  input   [ 31: 0] clock_crossing_bridge_m1_writedata;
  input   [ 31: 0] leds_s1_readdata;
  input            reset_n;

  wire             clock_crossing_bridge_m1_arbiterlock;
  wire             clock_crossing_bridge_m1_arbiterlock2;
  wire             clock_crossing_bridge_m1_continuerequest;
  wire             clock_crossing_bridge_m1_granted_leds_s1;
  wire             clock_crossing_bridge_m1_qualified_request_leds_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_leds_s1;
  wire             clock_crossing_bridge_m1_requests_leds_s1;
  wire             clock_crossing_bridge_m1_saved_grant_leds_s1;
  reg              d1_leds_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_leds_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] leds_s1_address;
  wire             leds_s1_allgrants;
  wire             leds_s1_allow_new_arb_cycle;
  wire             leds_s1_any_bursting_master_saved_grant;
  wire             leds_s1_any_continuerequest;
  wire             leds_s1_arb_counter_enable;
  reg              leds_s1_arb_share_counter;
  wire             leds_s1_arb_share_counter_next_value;
  wire             leds_s1_arb_share_set_values;
  wire             leds_s1_beginbursttransfer_internal;
  wire             leds_s1_begins_xfer;
  wire             leds_s1_chipselect;
  wire             leds_s1_end_xfer;
  wire             leds_s1_firsttransfer;
  wire             leds_s1_grant_vector;
  wire             leds_s1_in_a_read_cycle;
  wire             leds_s1_in_a_write_cycle;
  wire             leds_s1_master_qreq_vector;
  wire             leds_s1_non_bursting_master_requests;
  wire    [ 31: 0] leds_s1_readdata_from_sa;
  reg              leds_s1_reg_firsttransfer;
  wire             leds_s1_reset_n;
  reg              leds_s1_slavearbiterlockenable;
  wire             leds_s1_slavearbiterlockenable2;
  wire             leds_s1_unreg_firsttransfer;
  wire             leds_s1_waits_for_read;
  wire             leds_s1_waits_for_write;
  wire             leds_s1_write_n;
  wire    [ 31: 0] leds_s1_writedata;
  wire             wait_for_leds_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~leds_s1_end_xfer;
    end


  assign leds_s1_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_bridge_m1_qualified_request_leds_s1));
  //assign leds_s1_readdata_from_sa = leds_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign leds_s1_readdata_from_sa = leds_s1_readdata;

  assign clock_crossing_bridge_m1_requests_leds_s1 = ({clock_crossing_bridge_m1_address_to_slave[10 : 4] , 4'b0} == 11'h460) & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write);
  //leds_s1_arb_share_counter set values, which is an e_mux
  assign leds_s1_arb_share_set_values = 1;

  //leds_s1_non_bursting_master_requests mux, which is an e_mux
  assign leds_s1_non_bursting_master_requests = clock_crossing_bridge_m1_requests_leds_s1;

  //leds_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign leds_s1_any_bursting_master_saved_grant = 0;

  //leds_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign leds_s1_arb_share_counter_next_value = leds_s1_firsttransfer ? (leds_s1_arb_share_set_values - 1) : |leds_s1_arb_share_counter ? (leds_s1_arb_share_counter - 1) : 0;

  //leds_s1_allgrants all slave grants, which is an e_mux
  assign leds_s1_allgrants = |leds_s1_grant_vector;

  //leds_s1_end_xfer assignment, which is an e_assign
  assign leds_s1_end_xfer = ~(leds_s1_waits_for_read | leds_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_leds_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_leds_s1 = leds_s1_end_xfer & (~leds_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //leds_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign leds_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_leds_s1 & leds_s1_allgrants) | (end_xfer_arb_share_counter_term_leds_s1 & ~leds_s1_non_bursting_master_requests);

  //leds_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          leds_s1_arb_share_counter <= 0;
      else if (leds_s1_arb_counter_enable)
          leds_s1_arb_share_counter <= leds_s1_arb_share_counter_next_value;
    end


  //leds_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          leds_s1_slavearbiterlockenable <= 0;
      else if ((|leds_s1_master_qreq_vector & end_xfer_arb_share_counter_term_leds_s1) | (end_xfer_arb_share_counter_term_leds_s1 & ~leds_s1_non_bursting_master_requests))
          leds_s1_slavearbiterlockenable <= |leds_s1_arb_share_counter_next_value;
    end


  //clock_crossing_bridge/m1 leds/s1 arbiterlock, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock = leds_s1_slavearbiterlockenable & clock_crossing_bridge_m1_continuerequest;

  //leds_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign leds_s1_slavearbiterlockenable2 = |leds_s1_arb_share_counter_next_value;

  //clock_crossing_bridge/m1 leds/s1 arbiterlock2, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock2 = leds_s1_slavearbiterlockenable2 & clock_crossing_bridge_m1_continuerequest;

  //leds_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign leds_s1_any_continuerequest = 1;

  //clock_crossing_bridge_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_bridge_m1_continuerequest = 1;

  assign clock_crossing_bridge_m1_qualified_request_leds_s1 = clock_crossing_bridge_m1_requests_leds_s1 & ~((clock_crossing_bridge_m1_read & ((clock_crossing_bridge_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_bridge_m1_read_data_valid_leds_s1, which is an e_mux
  assign clock_crossing_bridge_m1_read_data_valid_leds_s1 = clock_crossing_bridge_m1_granted_leds_s1 & clock_crossing_bridge_m1_read & ~leds_s1_waits_for_read;

  //leds_s1_writedata mux, which is an e_mux
  assign leds_s1_writedata = clock_crossing_bridge_m1_writedata;

  //master is always granted when requested
  assign clock_crossing_bridge_m1_granted_leds_s1 = clock_crossing_bridge_m1_qualified_request_leds_s1;

  //clock_crossing_bridge/m1 saved-grant leds/s1, which is an e_assign
  assign clock_crossing_bridge_m1_saved_grant_leds_s1 = clock_crossing_bridge_m1_requests_leds_s1;

  //allow new arb cycle for leds/s1, which is an e_assign
  assign leds_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign leds_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign leds_s1_master_qreq_vector = 1;

  //leds_s1_reset_n assignment, which is an e_assign
  assign leds_s1_reset_n = reset_n;

  assign leds_s1_chipselect = clock_crossing_bridge_m1_granted_leds_s1;
  //leds_s1_firsttransfer first transaction, which is an e_assign
  assign leds_s1_firsttransfer = leds_s1_begins_xfer ? leds_s1_unreg_firsttransfer : leds_s1_reg_firsttransfer;

  //leds_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign leds_s1_unreg_firsttransfer = ~(leds_s1_slavearbiterlockenable & leds_s1_any_continuerequest);

  //leds_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          leds_s1_reg_firsttransfer <= 1'b1;
      else if (leds_s1_begins_xfer)
          leds_s1_reg_firsttransfer <= leds_s1_unreg_firsttransfer;
    end


  //leds_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign leds_s1_beginbursttransfer_internal = leds_s1_begins_xfer;

  //~leds_s1_write_n assignment, which is an e_mux
  assign leds_s1_write_n = ~(clock_crossing_bridge_m1_granted_leds_s1 & clock_crossing_bridge_m1_write);

  //leds_s1_address mux, which is an e_mux
  assign leds_s1_address = clock_crossing_bridge_m1_nativeaddress;

  //d1_leds_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_leds_s1_end_xfer <= 1;
      else 
        d1_leds_s1_end_xfer <= leds_s1_end_xfer;
    end


  //leds_s1_waits_for_read in a cycle, which is an e_mux
  assign leds_s1_waits_for_read = leds_s1_in_a_read_cycle & leds_s1_begins_xfer;

  //leds_s1_in_a_read_cycle assignment, which is an e_assign
  assign leds_s1_in_a_read_cycle = clock_crossing_bridge_m1_granted_leds_s1 & clock_crossing_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = leds_s1_in_a_read_cycle;

  //leds_s1_waits_for_write in a cycle, which is an e_mux
  assign leds_s1_waits_for_write = leds_s1_in_a_write_cycle & 0;

  //leds_s1_in_a_write_cycle assignment, which is an e_assign
  assign leds_s1_in_a_write_cycle = clock_crossing_bridge_m1_granted_leds_s1 & clock_crossing_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = leds_s1_in_a_write_cycle;

  assign wait_for_leds_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //leds/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_mem_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_byteenable,
                                   cpu_data_master_read,
                                   cpu_data_master_waitrequest,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   cpu_instruction_master_address_to_slave,
                                   cpu_instruction_master_read,
                                   onchip_mem_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_data_master_granted_onchip_mem_s1,
                                   cpu_data_master_qualified_request_onchip_mem_s1,
                                   cpu_data_master_read_data_valid_onchip_mem_s1,
                                   cpu_data_master_requests_onchip_mem_s1,
                                   cpu_instruction_master_granted_onchip_mem_s1,
                                   cpu_instruction_master_qualified_request_onchip_mem_s1,
                                   cpu_instruction_master_read_data_valid_onchip_mem_s1,
                                   cpu_instruction_master_requests_onchip_mem_s1,
                                   d1_onchip_mem_s1_end_xfer,
                                   onchip_mem_s1_address,
                                   onchip_mem_s1_byteenable,
                                   onchip_mem_s1_chipselect,
                                   onchip_mem_s1_clken,
                                   onchip_mem_s1_readdata_from_sa,
                                   onchip_mem_s1_reset,
                                   onchip_mem_s1_write,
                                   onchip_mem_s1_writedata,
                                   registered_cpu_data_master_read_data_valid_onchip_mem_s1
                                )
;

  output           cpu_data_master_granted_onchip_mem_s1;
  output           cpu_data_master_qualified_request_onchip_mem_s1;
  output           cpu_data_master_read_data_valid_onchip_mem_s1;
  output           cpu_data_master_requests_onchip_mem_s1;
  output           cpu_instruction_master_granted_onchip_mem_s1;
  output           cpu_instruction_master_qualified_request_onchip_mem_s1;
  output           cpu_instruction_master_read_data_valid_onchip_mem_s1;
  output           cpu_instruction_master_requests_onchip_mem_s1;
  output           d1_onchip_mem_s1_end_xfer;
  output  [ 12: 0] onchip_mem_s1_address;
  output  [  3: 0] onchip_mem_s1_byteenable;
  output           onchip_mem_s1_chipselect;
  output           onchip_mem_s1_clken;
  output  [ 31: 0] onchip_mem_s1_readdata_from_sa;
  output           onchip_mem_s1_reset;
  output           onchip_mem_s1_write;
  output  [ 31: 0] onchip_mem_s1_writedata;
  output           registered_cpu_data_master_read_data_valid_onchip_mem_s1;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 25: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_read;
  input   [ 31: 0] onchip_mem_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_onchip_mem_s1;
  wire             cpu_data_master_qualified_request_onchip_mem_s1;
  wire             cpu_data_master_read_data_valid_onchip_mem_s1;
  reg              cpu_data_master_read_data_valid_onchip_mem_s1_shift_register;
  wire             cpu_data_master_read_data_valid_onchip_mem_s1_shift_register_in;
  wire             cpu_data_master_requests_onchip_mem_s1;
  wire             cpu_data_master_saved_grant_onchip_mem_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_onchip_mem_s1;
  wire             cpu_instruction_master_qualified_request_onchip_mem_s1;
  wire             cpu_instruction_master_read_data_valid_onchip_mem_s1;
  reg              cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register_in;
  wire             cpu_instruction_master_requests_onchip_mem_s1;
  wire             cpu_instruction_master_saved_grant_onchip_mem_s1;
  reg              d1_onchip_mem_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_mem_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_onchip_mem_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_onchip_mem_s1;
  wire    [ 12: 0] onchip_mem_s1_address;
  wire             onchip_mem_s1_allgrants;
  wire             onchip_mem_s1_allow_new_arb_cycle;
  wire             onchip_mem_s1_any_bursting_master_saved_grant;
  wire             onchip_mem_s1_any_continuerequest;
  reg     [  1: 0] onchip_mem_s1_arb_addend;
  wire             onchip_mem_s1_arb_counter_enable;
  reg     [  1: 0] onchip_mem_s1_arb_share_counter;
  wire    [  1: 0] onchip_mem_s1_arb_share_counter_next_value;
  wire    [  1: 0] onchip_mem_s1_arb_share_set_values;
  wire    [  1: 0] onchip_mem_s1_arb_winner;
  wire             onchip_mem_s1_arbitration_holdoff_internal;
  wire             onchip_mem_s1_beginbursttransfer_internal;
  wire             onchip_mem_s1_begins_xfer;
  wire    [  3: 0] onchip_mem_s1_byteenable;
  wire             onchip_mem_s1_chipselect;
  wire    [  3: 0] onchip_mem_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_mem_s1_chosen_master_rot_left;
  wire             onchip_mem_s1_clken;
  wire             onchip_mem_s1_end_xfer;
  wire             onchip_mem_s1_firsttransfer;
  wire    [  1: 0] onchip_mem_s1_grant_vector;
  wire             onchip_mem_s1_in_a_read_cycle;
  wire             onchip_mem_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_mem_s1_master_qreq_vector;
  wire             onchip_mem_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_mem_s1_readdata_from_sa;
  reg              onchip_mem_s1_reg_firsttransfer;
  wire             onchip_mem_s1_reset;
  reg     [  1: 0] onchip_mem_s1_saved_chosen_master_vector;
  reg              onchip_mem_s1_slavearbiterlockenable;
  wire             onchip_mem_s1_slavearbiterlockenable2;
  wire             onchip_mem_s1_unreg_firsttransfer;
  wire             onchip_mem_s1_waits_for_read;
  wire             onchip_mem_s1_waits_for_write;
  wire             onchip_mem_s1_write;
  wire    [ 31: 0] onchip_mem_s1_writedata;
  wire             p1_cpu_data_master_read_data_valid_onchip_mem_s1_shift_register;
  wire             p1_cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register;
  wire             registered_cpu_data_master_read_data_valid_onchip_mem_s1;
  wire    [ 25: 0] shifted_address_to_onchip_mem_s1_from_cpu_data_master;
  wire    [ 25: 0] shifted_address_to_onchip_mem_s1_from_cpu_instruction_master;
  wire             wait_for_onchip_mem_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_mem_s1_end_xfer;
    end


  assign onchip_mem_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_onchip_mem_s1 | cpu_instruction_master_qualified_request_onchip_mem_s1));
  //assign onchip_mem_s1_readdata_from_sa = onchip_mem_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_mem_s1_readdata_from_sa = onchip_mem_s1_readdata;

  assign cpu_data_master_requests_onchip_mem_s1 = ({cpu_data_master_address_to_slave[25 : 15] , 15'b0} == 26'h2808000) & (cpu_data_master_read | cpu_data_master_write);
  //registered rdv signal_name registered_cpu_data_master_read_data_valid_onchip_mem_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_onchip_mem_s1 = cpu_data_master_read_data_valid_onchip_mem_s1_shift_register_in;

  //onchip_mem_s1_arb_share_counter set values, which is an e_mux
  assign onchip_mem_s1_arb_share_set_values = 1;

  //onchip_mem_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_mem_s1_non_bursting_master_requests = cpu_data_master_requests_onchip_mem_s1 |
    cpu_instruction_master_requests_onchip_mem_s1 |
    cpu_data_master_requests_onchip_mem_s1 |
    cpu_instruction_master_requests_onchip_mem_s1;

  //onchip_mem_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_mem_s1_any_bursting_master_saved_grant = 0;

  //onchip_mem_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_mem_s1_arb_share_counter_next_value = onchip_mem_s1_firsttransfer ? (onchip_mem_s1_arb_share_set_values - 1) : |onchip_mem_s1_arb_share_counter ? (onchip_mem_s1_arb_share_counter - 1) : 0;

  //onchip_mem_s1_allgrants all slave grants, which is an e_mux
  assign onchip_mem_s1_allgrants = (|onchip_mem_s1_grant_vector) |
    (|onchip_mem_s1_grant_vector) |
    (|onchip_mem_s1_grant_vector) |
    (|onchip_mem_s1_grant_vector);

  //onchip_mem_s1_end_xfer assignment, which is an e_assign
  assign onchip_mem_s1_end_xfer = ~(onchip_mem_s1_waits_for_read | onchip_mem_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_mem_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_mem_s1 = onchip_mem_s1_end_xfer & (~onchip_mem_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_mem_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_mem_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_mem_s1 & onchip_mem_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_mem_s1 & ~onchip_mem_s1_non_bursting_master_requests);

  //onchip_mem_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_arb_share_counter <= 0;
      else if (onchip_mem_s1_arb_counter_enable)
          onchip_mem_s1_arb_share_counter <= onchip_mem_s1_arb_share_counter_next_value;
    end


  //onchip_mem_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_mem_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_mem_s1) | (end_xfer_arb_share_counter_term_onchip_mem_s1 & ~onchip_mem_s1_non_bursting_master_requests))
          onchip_mem_s1_slavearbiterlockenable <= |onchip_mem_s1_arb_share_counter_next_value;
    end


  //cpu/data_master onchip_mem/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = onchip_mem_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //onchip_mem_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_mem_s1_slavearbiterlockenable2 = |onchip_mem_s1_arb_share_counter_next_value;

  //cpu/data_master onchip_mem/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = onchip_mem_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master onchip_mem/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = onchip_mem_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master onchip_mem/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = onchip_mem_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted onchip_mem/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_onchip_mem_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_onchip_mem_s1 <= cpu_instruction_master_saved_grant_onchip_mem_s1 ? 1 : (onchip_mem_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_onchip_mem_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_onchip_mem_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_onchip_mem_s1 & cpu_instruction_master_requests_onchip_mem_s1;

  //onchip_mem_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_mem_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_onchip_mem_s1 = cpu_data_master_requests_onchip_mem_s1 & ~((cpu_data_master_read & ((|cpu_data_master_read_data_valid_onchip_mem_s1_shift_register))) | ((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_onchip_mem_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_mem_s1_shift_register_in = cpu_data_master_granted_onchip_mem_s1 & cpu_data_master_read & ~onchip_mem_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_onchip_mem_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_onchip_mem_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_onchip_mem_s1_shift_register = {cpu_data_master_read_data_valid_onchip_mem_s1_shift_register, cpu_data_master_read_data_valid_onchip_mem_s1_shift_register_in};

  //cpu_data_master_read_data_valid_onchip_mem_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_onchip_mem_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_onchip_mem_s1_shift_register <= p1_cpu_data_master_read_data_valid_onchip_mem_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_onchip_mem_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_mem_s1 = cpu_data_master_read_data_valid_onchip_mem_s1_shift_register;

  //onchip_mem_s1_writedata mux, which is an e_mux
  assign onchip_mem_s1_writedata = cpu_data_master_writedata;

  //mux onchip_mem_s1_clken, which is an e_mux
  assign onchip_mem_s1_clken = 1'b1;

  assign cpu_instruction_master_requests_onchip_mem_s1 = (({cpu_instruction_master_address_to_slave[25 : 15] , 15'b0} == 26'h2808000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted onchip_mem/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_onchip_mem_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_onchip_mem_s1 <= cpu_data_master_saved_grant_onchip_mem_s1 ? 1 : (onchip_mem_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_onchip_mem_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_onchip_mem_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_onchip_mem_s1 & cpu_data_master_requests_onchip_mem_s1;

  assign cpu_instruction_master_qualified_request_onchip_mem_s1 = cpu_instruction_master_requests_onchip_mem_s1 & ~((cpu_instruction_master_read & ((|cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register_in = cpu_instruction_master_granted_onchip_mem_s1 & cpu_instruction_master_read & ~onchip_mem_s1_waits_for_read & ~(|cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register);

  //shift register p1 cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register = {cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register, cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_onchip_mem_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_mem_s1 = cpu_instruction_master_read_data_valid_onchip_mem_s1_shift_register;

  //allow new arb cycle for onchip_mem/s1, which is an e_assign
  assign onchip_mem_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for onchip_mem/s1, which is an e_assign
  assign onchip_mem_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_onchip_mem_s1;

  //cpu/instruction_master grant onchip_mem/s1, which is an e_assign
  assign cpu_instruction_master_granted_onchip_mem_s1 = onchip_mem_s1_grant_vector[0];

  //cpu/instruction_master saved-grant onchip_mem/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_onchip_mem_s1 = onchip_mem_s1_arb_winner[0] && cpu_instruction_master_requests_onchip_mem_s1;

  //cpu/data_master assignment into master qualified-requests vector for onchip_mem/s1, which is an e_assign
  assign onchip_mem_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_onchip_mem_s1;

  //cpu/data_master grant onchip_mem/s1, which is an e_assign
  assign cpu_data_master_granted_onchip_mem_s1 = onchip_mem_s1_grant_vector[1];

  //cpu/data_master saved-grant onchip_mem/s1, which is an e_assign
  assign cpu_data_master_saved_grant_onchip_mem_s1 = onchip_mem_s1_arb_winner[1] && cpu_data_master_requests_onchip_mem_s1;

  //onchip_mem/s1 chosen-master double-vector, which is an e_assign
  assign onchip_mem_s1_chosen_master_double_vector = {onchip_mem_s1_master_qreq_vector, onchip_mem_s1_master_qreq_vector} & ({~onchip_mem_s1_master_qreq_vector, ~onchip_mem_s1_master_qreq_vector} + onchip_mem_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_mem_s1_arb_winner = (onchip_mem_s1_allow_new_arb_cycle & | onchip_mem_s1_grant_vector) ? onchip_mem_s1_grant_vector : onchip_mem_s1_saved_chosen_master_vector;

  //saved onchip_mem_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_saved_chosen_master_vector <= 0;
      else if (onchip_mem_s1_allow_new_arb_cycle)
          onchip_mem_s1_saved_chosen_master_vector <= |onchip_mem_s1_grant_vector ? onchip_mem_s1_grant_vector : onchip_mem_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_mem_s1_grant_vector = {(onchip_mem_s1_chosen_master_double_vector[1] | onchip_mem_s1_chosen_master_double_vector[3]),
    (onchip_mem_s1_chosen_master_double_vector[0] | onchip_mem_s1_chosen_master_double_vector[2])};

  //onchip_mem/s1 chosen master rotated left, which is an e_assign
  assign onchip_mem_s1_chosen_master_rot_left = (onchip_mem_s1_arb_winner << 1) ? (onchip_mem_s1_arb_winner << 1) : 1;

  //onchip_mem/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_arb_addend <= 1;
      else if (|onchip_mem_s1_grant_vector)
          onchip_mem_s1_arb_addend <= onchip_mem_s1_end_xfer? onchip_mem_s1_chosen_master_rot_left : onchip_mem_s1_grant_vector;
    end


  //~onchip_mem_s1_reset assignment, which is an e_assign
  assign onchip_mem_s1_reset = ~reset_n;

  assign onchip_mem_s1_chipselect = cpu_data_master_granted_onchip_mem_s1 | cpu_instruction_master_granted_onchip_mem_s1;
  //onchip_mem_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_mem_s1_firsttransfer = onchip_mem_s1_begins_xfer ? onchip_mem_s1_unreg_firsttransfer : onchip_mem_s1_reg_firsttransfer;

  //onchip_mem_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_mem_s1_unreg_firsttransfer = ~(onchip_mem_s1_slavearbiterlockenable & onchip_mem_s1_any_continuerequest);

  //onchip_mem_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_mem_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_mem_s1_begins_xfer)
          onchip_mem_s1_reg_firsttransfer <= onchip_mem_s1_unreg_firsttransfer;
    end


  //onchip_mem_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_mem_s1_beginbursttransfer_internal = onchip_mem_s1_begins_xfer;

  //onchip_mem_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_mem_s1_arbitration_holdoff_internal = onchip_mem_s1_begins_xfer & onchip_mem_s1_firsttransfer;

  //onchip_mem_s1_write assignment, which is an e_mux
  assign onchip_mem_s1_write = cpu_data_master_granted_onchip_mem_s1 & cpu_data_master_write;

  assign shifted_address_to_onchip_mem_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //onchip_mem_s1_address mux, which is an e_mux
  assign onchip_mem_s1_address = (cpu_data_master_granted_onchip_mem_s1)? (shifted_address_to_onchip_mem_s1_from_cpu_data_master >> 2) :
    (shifted_address_to_onchip_mem_s1_from_cpu_instruction_master >> 2);

  assign shifted_address_to_onchip_mem_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_onchip_mem_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_mem_s1_end_xfer <= 1;
      else 
        d1_onchip_mem_s1_end_xfer <= onchip_mem_s1_end_xfer;
    end


  //onchip_mem_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_mem_s1_waits_for_read = onchip_mem_s1_in_a_read_cycle & 0;

  //onchip_mem_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_mem_s1_in_a_read_cycle = (cpu_data_master_granted_onchip_mem_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_onchip_mem_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_mem_s1_in_a_read_cycle;

  //onchip_mem_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_mem_s1_waits_for_write = onchip_mem_s1_in_a_write_cycle & 0;

  //onchip_mem_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_mem_s1_in_a_write_cycle = cpu_data_master_granted_onchip_mem_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_mem_s1_in_a_write_cycle;

  assign wait_for_onchip_mem_s1_counter = 0;
  //onchip_mem_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_mem_s1_byteenable = (cpu_data_master_granted_onchip_mem_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_mem/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_onchip_mem_s1 + cpu_instruction_master_granted_onchip_mem_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_onchip_mem_s1 + cpu_instruction_master_saved_grant_onchip_mem_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pll_s1_arbitrator (
                           // inputs:
                            DE0_SOPC_clock_0_out_address_to_slave,
                            DE0_SOPC_clock_0_out_nativeaddress,
                            DE0_SOPC_clock_0_out_read,
                            DE0_SOPC_clock_0_out_write,
                            DE0_SOPC_clock_0_out_writedata,
                            clk,
                            pll_s1_readdata,
                            pll_s1_resetrequest,
                            reset_n,

                           // outputs:
                            DE0_SOPC_clock_0_out_granted_pll_s1,
                            DE0_SOPC_clock_0_out_qualified_request_pll_s1,
                            DE0_SOPC_clock_0_out_read_data_valid_pll_s1,
                            DE0_SOPC_clock_0_out_requests_pll_s1,
                            d1_pll_s1_end_xfer,
                            pll_s1_address,
                            pll_s1_chipselect,
                            pll_s1_read,
                            pll_s1_readdata_from_sa,
                            pll_s1_reset_n,
                            pll_s1_resetrequest_from_sa,
                            pll_s1_write,
                            pll_s1_writedata
                         )
;

  output           DE0_SOPC_clock_0_out_granted_pll_s1;
  output           DE0_SOPC_clock_0_out_qualified_request_pll_s1;
  output           DE0_SOPC_clock_0_out_read_data_valid_pll_s1;
  output           DE0_SOPC_clock_0_out_requests_pll_s1;
  output           d1_pll_s1_end_xfer;
  output  [  2: 0] pll_s1_address;
  output           pll_s1_chipselect;
  output           pll_s1_read;
  output  [ 15: 0] pll_s1_readdata_from_sa;
  output           pll_s1_reset_n;
  output           pll_s1_resetrequest_from_sa;
  output           pll_s1_write;
  output  [ 15: 0] pll_s1_writedata;
  input   [  3: 0] DE0_SOPC_clock_0_out_address_to_slave;
  input   [  2: 0] DE0_SOPC_clock_0_out_nativeaddress;
  input            DE0_SOPC_clock_0_out_read;
  input            DE0_SOPC_clock_0_out_write;
  input   [ 15: 0] DE0_SOPC_clock_0_out_writedata;
  input            clk;
  input   [ 15: 0] pll_s1_readdata;
  input            pll_s1_resetrequest;
  input            reset_n;

  wire             DE0_SOPC_clock_0_out_arbiterlock;
  wire             DE0_SOPC_clock_0_out_arbiterlock2;
  wire             DE0_SOPC_clock_0_out_continuerequest;
  wire             DE0_SOPC_clock_0_out_granted_pll_s1;
  wire             DE0_SOPC_clock_0_out_qualified_request_pll_s1;
  wire             DE0_SOPC_clock_0_out_read_data_valid_pll_s1;
  wire             DE0_SOPC_clock_0_out_requests_pll_s1;
  wire             DE0_SOPC_clock_0_out_saved_grant_pll_s1;
  reg              d1_pll_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pll_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] pll_s1_address;
  wire             pll_s1_allgrants;
  wire             pll_s1_allow_new_arb_cycle;
  wire             pll_s1_any_bursting_master_saved_grant;
  wire             pll_s1_any_continuerequest;
  wire             pll_s1_arb_counter_enable;
  reg              pll_s1_arb_share_counter;
  wire             pll_s1_arb_share_counter_next_value;
  wire             pll_s1_arb_share_set_values;
  wire             pll_s1_beginbursttransfer_internal;
  wire             pll_s1_begins_xfer;
  wire             pll_s1_chipselect;
  wire             pll_s1_end_xfer;
  wire             pll_s1_firsttransfer;
  wire             pll_s1_grant_vector;
  wire             pll_s1_in_a_read_cycle;
  wire             pll_s1_in_a_write_cycle;
  wire             pll_s1_master_qreq_vector;
  wire             pll_s1_non_bursting_master_requests;
  wire             pll_s1_read;
  wire    [ 15: 0] pll_s1_readdata_from_sa;
  reg              pll_s1_reg_firsttransfer;
  wire             pll_s1_reset_n;
  wire             pll_s1_resetrequest_from_sa;
  reg              pll_s1_slavearbiterlockenable;
  wire             pll_s1_slavearbiterlockenable2;
  wire             pll_s1_unreg_firsttransfer;
  wire             pll_s1_waits_for_read;
  wire             pll_s1_waits_for_write;
  wire             pll_s1_write;
  wire    [ 15: 0] pll_s1_writedata;
  wire             wait_for_pll_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pll_s1_end_xfer;
    end


  assign pll_s1_begins_xfer = ~d1_reasons_to_wait & ((DE0_SOPC_clock_0_out_qualified_request_pll_s1));
  //assign pll_s1_readdata_from_sa = pll_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pll_s1_readdata_from_sa = pll_s1_readdata;

  assign DE0_SOPC_clock_0_out_requests_pll_s1 = (1) & (DE0_SOPC_clock_0_out_read | DE0_SOPC_clock_0_out_write);
  //pll_s1_arb_share_counter set values, which is an e_mux
  assign pll_s1_arb_share_set_values = 1;

  //pll_s1_non_bursting_master_requests mux, which is an e_mux
  assign pll_s1_non_bursting_master_requests = DE0_SOPC_clock_0_out_requests_pll_s1;

  //pll_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pll_s1_any_bursting_master_saved_grant = 0;

  //pll_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pll_s1_arb_share_counter_next_value = pll_s1_firsttransfer ? (pll_s1_arb_share_set_values - 1) : |pll_s1_arb_share_counter ? (pll_s1_arb_share_counter - 1) : 0;

  //pll_s1_allgrants all slave grants, which is an e_mux
  assign pll_s1_allgrants = |pll_s1_grant_vector;

  //pll_s1_end_xfer assignment, which is an e_assign
  assign pll_s1_end_xfer = ~(pll_s1_waits_for_read | pll_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pll_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pll_s1 = pll_s1_end_xfer & (~pll_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pll_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pll_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pll_s1 & pll_s1_allgrants) | (end_xfer_arb_share_counter_term_pll_s1 & ~pll_s1_non_bursting_master_requests);

  //pll_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_s1_arb_share_counter <= 0;
      else if (pll_s1_arb_counter_enable)
          pll_s1_arb_share_counter <= pll_s1_arb_share_counter_next_value;
    end


  //pll_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_s1_slavearbiterlockenable <= 0;
      else if ((|pll_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pll_s1) | (end_xfer_arb_share_counter_term_pll_s1 & ~pll_s1_non_bursting_master_requests))
          pll_s1_slavearbiterlockenable <= |pll_s1_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_0/out pll/s1 arbiterlock, which is an e_assign
  assign DE0_SOPC_clock_0_out_arbiterlock = pll_s1_slavearbiterlockenable & DE0_SOPC_clock_0_out_continuerequest;

  //pll_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pll_s1_slavearbiterlockenable2 = |pll_s1_arb_share_counter_next_value;

  //DE0_SOPC_clock_0/out pll/s1 arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_0_out_arbiterlock2 = pll_s1_slavearbiterlockenable2 & DE0_SOPC_clock_0_out_continuerequest;

  //pll_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pll_s1_any_continuerequest = 1;

  //DE0_SOPC_clock_0_out_continuerequest continued request, which is an e_assign
  assign DE0_SOPC_clock_0_out_continuerequest = 1;

  assign DE0_SOPC_clock_0_out_qualified_request_pll_s1 = DE0_SOPC_clock_0_out_requests_pll_s1;
  //pll_s1_writedata mux, which is an e_mux
  assign pll_s1_writedata = DE0_SOPC_clock_0_out_writedata;

  //master is always granted when requested
  assign DE0_SOPC_clock_0_out_granted_pll_s1 = DE0_SOPC_clock_0_out_qualified_request_pll_s1;

  //DE0_SOPC_clock_0/out saved-grant pll/s1, which is an e_assign
  assign DE0_SOPC_clock_0_out_saved_grant_pll_s1 = DE0_SOPC_clock_0_out_requests_pll_s1;

  //allow new arb cycle for pll/s1, which is an e_assign
  assign pll_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pll_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pll_s1_master_qreq_vector = 1;

  //pll_s1_reset_n assignment, which is an e_assign
  assign pll_s1_reset_n = reset_n;

  //assign pll_s1_resetrequest_from_sa = pll_s1_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pll_s1_resetrequest_from_sa = pll_s1_resetrequest;

  assign pll_s1_chipselect = DE0_SOPC_clock_0_out_granted_pll_s1;
  //pll_s1_firsttransfer first transaction, which is an e_assign
  assign pll_s1_firsttransfer = pll_s1_begins_xfer ? pll_s1_unreg_firsttransfer : pll_s1_reg_firsttransfer;

  //pll_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pll_s1_unreg_firsttransfer = ~(pll_s1_slavearbiterlockenable & pll_s1_any_continuerequest);

  //pll_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_s1_reg_firsttransfer <= 1'b1;
      else if (pll_s1_begins_xfer)
          pll_s1_reg_firsttransfer <= pll_s1_unreg_firsttransfer;
    end


  //pll_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pll_s1_beginbursttransfer_internal = pll_s1_begins_xfer;

  //pll_s1_read assignment, which is an e_mux
  assign pll_s1_read = DE0_SOPC_clock_0_out_granted_pll_s1 & DE0_SOPC_clock_0_out_read;

  //pll_s1_write assignment, which is an e_mux
  assign pll_s1_write = DE0_SOPC_clock_0_out_granted_pll_s1 & DE0_SOPC_clock_0_out_write;

  //pll_s1_address mux, which is an e_mux
  assign pll_s1_address = DE0_SOPC_clock_0_out_nativeaddress;

  //d1_pll_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pll_s1_end_xfer <= 1;
      else 
        d1_pll_s1_end_xfer <= pll_s1_end_xfer;
    end


  //pll_s1_waits_for_read in a cycle, which is an e_mux
  assign pll_s1_waits_for_read = pll_s1_in_a_read_cycle & pll_s1_begins_xfer;

  //pll_s1_in_a_read_cycle assignment, which is an e_assign
  assign pll_s1_in_a_read_cycle = DE0_SOPC_clock_0_out_granted_pll_s1 & DE0_SOPC_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pll_s1_in_a_read_cycle;

  //pll_s1_waits_for_write in a cycle, which is an e_mux
  assign pll_s1_waits_for_write = pll_s1_in_a_write_cycle & 0;

  //pll_s1_in_a_write_cycle assignment, which is an e_assign
  assign pll_s1_in_a_write_cycle = DE0_SOPC_clock_0_out_granted_pll_s1 & DE0_SOPC_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pll_s1_in_a_write_cycle;

  assign wait_for_pll_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pll/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_sdram_s1_module (
                                                         // inputs:
                                                          clear_fifo,
                                                          clk,
                                                          data_in,
                                                          read,
                                                          reset_n,
                                                          sync_reset,
                                                          write,

                                                         // outputs:
                                                          data_out,
                                                          empty,
                                                          fifo_contains_ones_n,
                                                          full
                                                       )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module (
                                                                // inputs:
                                                                 clear_fifo,
                                                                 clk,
                                                                 data_in,
                                                                 read,
                                                                 reset_n,
                                                                 sync_reset,
                                                                 write,

                                                                // outputs:
                                                                 data_out,
                                                                 empty,
                                                                 fifo_contains_ones_n,
                                                                 full
                                                              )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_data_master_address_to_slave,
                              cpu_data_master_byteenable,
                              cpu_data_master_dbs_address,
                              cpu_data_master_dbs_write_16,
                              cpu_data_master_no_byte_enables_and_last_term,
                              cpu_data_master_read,
                              cpu_data_master_waitrequest,
                              cpu_data_master_write,
                              cpu_instruction_master_address_to_slave,
                              cpu_instruction_master_dbs_address,
                              cpu_instruction_master_read,
                              reset_n,
                              sdram_s1_readdata,
                              sdram_s1_readdatavalid,
                              sdram_s1_waitrequest,

                             // outputs:
                              cpu_data_master_byteenable_sdram_s1,
                              cpu_data_master_granted_sdram_s1,
                              cpu_data_master_qualified_request_sdram_s1,
                              cpu_data_master_read_data_valid_sdram_s1,
                              cpu_data_master_read_data_valid_sdram_s1_shift_register,
                              cpu_data_master_requests_sdram_s1,
                              cpu_instruction_master_granted_sdram_s1,
                              cpu_instruction_master_qualified_request_sdram_s1,
                              cpu_instruction_master_read_data_valid_sdram_s1,
                              cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                              cpu_instruction_master_requests_sdram_s1,
                              d1_sdram_s1_end_xfer,
                              sdram_s1_address,
                              sdram_s1_byteenable_n,
                              sdram_s1_chipselect,
                              sdram_s1_read_n,
                              sdram_s1_readdata_from_sa,
                              sdram_s1_reset_n,
                              sdram_s1_waitrequest_from_sa,
                              sdram_s1_write_n,
                              sdram_s1_writedata
                           )
;

  output  [  1: 0] cpu_data_master_byteenable_sdram_s1;
  output           cpu_data_master_granted_sdram_s1;
  output           cpu_data_master_qualified_request_sdram_s1;
  output           cpu_data_master_read_data_valid_sdram_s1;
  output           cpu_data_master_read_data_valid_sdram_s1_shift_register;
  output           cpu_data_master_requests_sdram_s1;
  output           cpu_instruction_master_granted_sdram_s1;
  output           cpu_instruction_master_qualified_request_sdram_s1;
  output           cpu_instruction_master_read_data_valid_sdram_s1;
  output           cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  output           cpu_instruction_master_requests_sdram_s1;
  output           d1_sdram_s1_end_xfer;
  output  [ 21: 0] sdram_s1_address;
  output  [  1: 0] sdram_s1_byteenable_n;
  output           sdram_s1_chipselect;
  output           sdram_s1_read_n;
  output  [ 15: 0] sdram_s1_readdata_from_sa;
  output           sdram_s1_reset_n;
  output           sdram_s1_waitrequest_from_sa;
  output           sdram_s1_write_n;
  output  [ 15: 0] sdram_s1_writedata;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input            cpu_data_master_no_byte_enables_and_last_term;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 25: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input            cpu_instruction_master_read;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata;
  input            sdram_s1_readdatavalid;
  input            sdram_s1_waitrequest;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_sdram_s1;
  wire    [  1: 0] cpu_data_master_byteenable_sdram_s1_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_sdram_s1_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sdram_s1;
  wire             cpu_data_master_qualified_request_sdram_s1;
  wire             cpu_data_master_rdv_fifo_empty_sdram_s1;
  wire             cpu_data_master_rdv_fifo_output_from_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_data_master_requests_sdram_s1;
  wire             cpu_data_master_saved_grant_sdram_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_sdram_s1;
  wire             cpu_instruction_master_qualified_request_sdram_s1;
  wire             cpu_instruction_master_rdv_fifo_empty_sdram_s1;
  wire             cpu_instruction_master_rdv_fifo_output_from_sdram_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_instruction_master_requests_sdram_s1;
  wire             cpu_instruction_master_saved_grant_sdram_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sdram_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_sdram_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_sdram_s1;
  wire    [ 21: 0] sdram_s1_address;
  wire             sdram_s1_allgrants;
  wire             sdram_s1_allow_new_arb_cycle;
  wire             sdram_s1_any_bursting_master_saved_grant;
  wire             sdram_s1_any_continuerequest;
  reg     [  1: 0] sdram_s1_arb_addend;
  wire             sdram_s1_arb_counter_enable;
  reg     [  1: 0] sdram_s1_arb_share_counter;
  wire    [  1: 0] sdram_s1_arb_share_counter_next_value;
  wire    [  1: 0] sdram_s1_arb_share_set_values;
  wire    [  1: 0] sdram_s1_arb_winner;
  wire             sdram_s1_arbitration_holdoff_internal;
  wire             sdram_s1_beginbursttransfer_internal;
  wire             sdram_s1_begins_xfer;
  wire    [  1: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire    [  3: 0] sdram_s1_chosen_master_double_vector;
  wire    [  1: 0] sdram_s1_chosen_master_rot_left;
  wire             sdram_s1_end_xfer;
  wire             sdram_s1_firsttransfer;
  wire    [  1: 0] sdram_s1_grant_vector;
  wire             sdram_s1_in_a_read_cycle;
  wire             sdram_s1_in_a_write_cycle;
  wire    [  1: 0] sdram_s1_master_qreq_vector;
  wire             sdram_s1_move_on_to_next_transaction;
  wire             sdram_s1_non_bursting_master_requests;
  wire             sdram_s1_read_n;
  wire    [ 15: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid_from_sa;
  reg              sdram_s1_reg_firsttransfer;
  wire             sdram_s1_reset_n;
  reg     [  1: 0] sdram_s1_saved_chosen_master_vector;
  reg              sdram_s1_slavearbiterlockenable;
  wire             sdram_s1_slavearbiterlockenable2;
  wire             sdram_s1_unreg_firsttransfer;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_waits_for_read;
  wire             sdram_s1_waits_for_write;
  wire             sdram_s1_write_n;
  wire    [ 15: 0] sdram_s1_writedata;
  wire    [ 25: 0] shifted_address_to_sdram_s1_from_cpu_data_master;
  wire    [ 25: 0] shifted_address_to_sdram_s1_from_cpu_instruction_master;
  wire             wait_for_sdram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_s1_end_xfer;
    end


  assign sdram_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sdram_s1 | cpu_instruction_master_qualified_request_sdram_s1));
  //assign sdram_s1_readdata_from_sa = sdram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdata_from_sa = sdram_s1_readdata;

  assign cpu_data_master_requests_sdram_s1 = ({cpu_data_master_address_to_slave[25 : 23] , 23'b0} == 26'h1800000) & (cpu_data_master_read | cpu_data_master_write);
  //assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest;

  //assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid;

  //sdram_s1_arb_share_counter set values, which is an e_mux
  assign sdram_s1_arb_share_set_values = (cpu_data_master_granted_sdram_s1)? 2 :
    (cpu_instruction_master_granted_sdram_s1)? 2 :
    (cpu_data_master_granted_sdram_s1)? 2 :
    (cpu_instruction_master_granted_sdram_s1)? 2 :
    1;

  //sdram_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_s1_non_bursting_master_requests = cpu_data_master_requests_sdram_s1 |
    cpu_instruction_master_requests_sdram_s1 |
    cpu_data_master_requests_sdram_s1 |
    cpu_instruction_master_requests_sdram_s1;

  //sdram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_s1_any_bursting_master_saved_grant = 0;

  //sdram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_s1_arb_share_counter_next_value = sdram_s1_firsttransfer ? (sdram_s1_arb_share_set_values - 1) : |sdram_s1_arb_share_counter ? (sdram_s1_arb_share_counter - 1) : 0;

  //sdram_s1_allgrants all slave grants, which is an e_mux
  assign sdram_s1_allgrants = (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector);

  //sdram_s1_end_xfer assignment, which is an e_assign
  assign sdram_s1_end_xfer = ~(sdram_s1_waits_for_read | sdram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_s1 = sdram_s1_end_xfer & (~sdram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_s1 & sdram_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests);

  //sdram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_share_counter <= 0;
      else if (sdram_s1_arb_counter_enable)
          sdram_s1_arb_share_counter <= sdram_s1_arb_share_counter_next_value;
    end


  //sdram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_s1) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests))
          sdram_s1_slavearbiterlockenable <= |sdram_s1_arb_share_counter_next_value;
    end


  //cpu/data_master sdram/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sdram_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sdram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_s1_slavearbiterlockenable2 = |sdram_s1_arb_share_counter_next_value;

  //cpu/data_master sdram/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master sdram/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = sdram_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master sdram/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_sdram_s1 <= cpu_instruction_master_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_sdram_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_sdram_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_sdram_s1 & cpu_instruction_master_requests_sdram_s1;

  //sdram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_sdram_s1 = cpu_data_master_requests_sdram_s1 & ~((cpu_data_master_read & (~cpu_data_master_waitrequest | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | ((~cpu_data_master_waitrequest | cpu_data_master_no_byte_enables_and_last_term | !cpu_data_master_byteenable_sdram_s1) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //unique name for sdram_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_s1_move_on_to_next_transaction = sdram_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_sdram_s1_module rdv_fifo_for_cpu_data_master_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_sdram_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_sdram_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_sdram_s1;
  //local readdatavalid cpu_data_master_read_data_valid_sdram_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & cpu_data_master_rdv_fifo_output_from_sdram_s1) & ~ cpu_data_master_rdv_fifo_empty_sdram_s1;

  //sdram_s1_writedata mux, which is an e_mux
  assign sdram_s1_writedata = cpu_data_master_dbs_write_16;

  assign cpu_instruction_master_requests_sdram_s1 = (({cpu_instruction_master_address_to_slave[25 : 23] , 23'b0} == 26'h1800000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_sdram_s1 <= cpu_data_master_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_sdram_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_sdram_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_sdram_s1 & cpu_data_master_requests_sdram_s1;

  assign cpu_instruction_master_qualified_request_sdram_s1 = cpu_instruction_master_requests_sdram_s1 & ~((cpu_instruction_master_read & ((|cpu_instruction_master_read_data_valid_sdram_s1_shift_register))) | cpu_data_master_arbiterlock);
  //rdv_fifo_for_cpu_instruction_master_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module rdv_fifo_for_cpu_instruction_master_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_instruction_master_granted_sdram_s1),
      .data_out             (cpu_instruction_master_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_instruction_master_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign cpu_instruction_master_read_data_valid_sdram_s1_shift_register = ~cpu_instruction_master_rdv_fifo_empty_sdram_s1;
  //local readdatavalid cpu_instruction_master_read_data_valid_sdram_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & cpu_instruction_master_rdv_fifo_output_from_sdram_s1) & ~ cpu_instruction_master_rdv_fifo_empty_sdram_s1;

  //allow new arb cycle for sdram/s1, which is an e_assign
  assign sdram_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_sdram_s1;

  //cpu/instruction_master grant sdram/s1, which is an e_assign
  assign cpu_instruction_master_granted_sdram_s1 = sdram_s1_grant_vector[0];

  //cpu/instruction_master saved-grant sdram/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_sdram_s1 = sdram_s1_arb_winner[0] && cpu_instruction_master_requests_sdram_s1;

  //cpu/data_master assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_sdram_s1;

  //cpu/data_master grant sdram/s1, which is an e_assign
  assign cpu_data_master_granted_sdram_s1 = sdram_s1_grant_vector[1];

  //cpu/data_master saved-grant sdram/s1, which is an e_assign
  assign cpu_data_master_saved_grant_sdram_s1 = sdram_s1_arb_winner[1] && cpu_data_master_requests_sdram_s1;

  //sdram/s1 chosen-master double-vector, which is an e_assign
  assign sdram_s1_chosen_master_double_vector = {sdram_s1_master_qreq_vector, sdram_s1_master_qreq_vector} & ({~sdram_s1_master_qreq_vector, ~sdram_s1_master_qreq_vector} + sdram_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_s1_arb_winner = (sdram_s1_allow_new_arb_cycle & | sdram_s1_grant_vector) ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;

  //saved sdram_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_saved_chosen_master_vector <= 0;
      else if (sdram_s1_allow_new_arb_cycle)
          sdram_s1_saved_chosen_master_vector <= |sdram_s1_grant_vector ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_s1_grant_vector = {(sdram_s1_chosen_master_double_vector[1] | sdram_s1_chosen_master_double_vector[3]),
    (sdram_s1_chosen_master_double_vector[0] | sdram_s1_chosen_master_double_vector[2])};

  //sdram/s1 chosen master rotated left, which is an e_assign
  assign sdram_s1_chosen_master_rot_left = (sdram_s1_arb_winner << 1) ? (sdram_s1_arb_winner << 1) : 1;

  //sdram/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_addend <= 1;
      else if (|sdram_s1_grant_vector)
          sdram_s1_arb_addend <= sdram_s1_end_xfer? sdram_s1_chosen_master_rot_left : sdram_s1_grant_vector;
    end


  //sdram_s1_reset_n assignment, which is an e_assign
  assign sdram_s1_reset_n = reset_n;

  assign sdram_s1_chipselect = cpu_data_master_granted_sdram_s1 | cpu_instruction_master_granted_sdram_s1;
  //sdram_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_firsttransfer = sdram_s1_begins_xfer ? sdram_s1_unreg_firsttransfer : sdram_s1_reg_firsttransfer;

  //sdram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_unreg_firsttransfer = ~(sdram_s1_slavearbiterlockenable & sdram_s1_any_continuerequest);

  //sdram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_s1_begins_xfer)
          sdram_s1_reg_firsttransfer <= sdram_s1_unreg_firsttransfer;
    end


  //sdram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_s1_beginbursttransfer_internal = sdram_s1_begins_xfer;

  //sdram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_s1_arbitration_holdoff_internal = sdram_s1_begins_xfer & sdram_s1_firsttransfer;

  //~sdram_s1_read_n assignment, which is an e_mux
  assign sdram_s1_read_n = ~((cpu_data_master_granted_sdram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_sdram_s1 & cpu_instruction_master_read));

  //~sdram_s1_write_n assignment, which is an e_mux
  assign sdram_s1_write_n = ~(cpu_data_master_granted_sdram_s1 & cpu_data_master_write);

  assign shifted_address_to_sdram_s1_from_cpu_data_master = {cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sdram_s1_address mux, which is an e_mux
  assign sdram_s1_address = (cpu_data_master_granted_sdram_s1)? (shifted_address_to_sdram_s1_from_cpu_data_master >> 1) :
    (shifted_address_to_sdram_s1_from_cpu_instruction_master >> 1);

  assign shifted_address_to_sdram_s1_from_cpu_instruction_master = {cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_sdram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_s1_end_xfer <= 1;
      else 
        d1_sdram_s1_end_xfer <= sdram_s1_end_xfer;
    end


  //sdram_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_s1_waits_for_read = sdram_s1_in_a_read_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_read_cycle = (cpu_data_master_granted_sdram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_sdram_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_s1_in_a_read_cycle;

  //sdram_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_s1_waits_for_write = sdram_s1_in_a_write_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_write_cycle = cpu_data_master_granted_sdram_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_s1_in_a_write_cycle;

  assign wait_for_sdram_s1_counter = 0;
  //~sdram_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_s1_byteenable_n = ~((cpu_data_master_granted_sdram_s1)? cpu_data_master_byteenable_sdram_s1 :
    -1);

  assign {cpu_data_master_byteenable_sdram_s1_segment_1,
cpu_data_master_byteenable_sdram_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_sdram_s1 = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_sdram_s1_segment_0 :
    cpu_data_master_byteenable_sdram_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_sdram_s1 + cpu_instruction_master_granted_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_sdram_s1 + cpu_instruction_master_saved_grant_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module seg7_s1_arbitrator (
                            // inputs:
                             clk,
                             clock_crossing_bridge_m1_address_to_slave,
                             clock_crossing_bridge_m1_latency_counter,
                             clock_crossing_bridge_m1_nativeaddress,
                             clock_crossing_bridge_m1_read,
                             clock_crossing_bridge_m1_write,
                             clock_crossing_bridge_m1_writedata,
                             reset_n,
                             seg7_s1_readdata,

                            // outputs:
                             clock_crossing_bridge_m1_granted_seg7_s1,
                             clock_crossing_bridge_m1_qualified_request_seg7_s1,
                             clock_crossing_bridge_m1_read_data_valid_seg7_s1,
                             clock_crossing_bridge_m1_requests_seg7_s1,
                             d1_seg7_s1_end_xfer,
                             seg7_s1_address,
                             seg7_s1_chipselect,
                             seg7_s1_readdata_from_sa,
                             seg7_s1_reset_n,
                             seg7_s1_write_n,
                             seg7_s1_writedata
                          )
;

  output           clock_crossing_bridge_m1_granted_seg7_s1;
  output           clock_crossing_bridge_m1_qualified_request_seg7_s1;
  output           clock_crossing_bridge_m1_read_data_valid_seg7_s1;
  output           clock_crossing_bridge_m1_requests_seg7_s1;
  output           d1_seg7_s1_end_xfer;
  output  [  1: 0] seg7_s1_address;
  output           seg7_s1_chipselect;
  output  [ 31: 0] seg7_s1_readdata_from_sa;
  output           seg7_s1_reset_n;
  output           seg7_s1_write_n;
  output  [ 31: 0] seg7_s1_writedata;
  input            clk;
  input   [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  input            clock_crossing_bridge_m1_latency_counter;
  input   [  8: 0] clock_crossing_bridge_m1_nativeaddress;
  input            clock_crossing_bridge_m1_read;
  input            clock_crossing_bridge_m1_write;
  input   [ 31: 0] clock_crossing_bridge_m1_writedata;
  input            reset_n;
  input   [ 31: 0] seg7_s1_readdata;

  wire             clock_crossing_bridge_m1_arbiterlock;
  wire             clock_crossing_bridge_m1_arbiterlock2;
  wire             clock_crossing_bridge_m1_continuerequest;
  wire             clock_crossing_bridge_m1_granted_seg7_s1;
  wire             clock_crossing_bridge_m1_qualified_request_seg7_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_seg7_s1;
  wire             clock_crossing_bridge_m1_requests_seg7_s1;
  wire             clock_crossing_bridge_m1_saved_grant_seg7_s1;
  reg              d1_reasons_to_wait;
  reg              d1_seg7_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_seg7_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] seg7_s1_address;
  wire             seg7_s1_allgrants;
  wire             seg7_s1_allow_new_arb_cycle;
  wire             seg7_s1_any_bursting_master_saved_grant;
  wire             seg7_s1_any_continuerequest;
  wire             seg7_s1_arb_counter_enable;
  reg              seg7_s1_arb_share_counter;
  wire             seg7_s1_arb_share_counter_next_value;
  wire             seg7_s1_arb_share_set_values;
  wire             seg7_s1_beginbursttransfer_internal;
  wire             seg7_s1_begins_xfer;
  wire             seg7_s1_chipselect;
  wire             seg7_s1_end_xfer;
  wire             seg7_s1_firsttransfer;
  wire             seg7_s1_grant_vector;
  wire             seg7_s1_in_a_read_cycle;
  wire             seg7_s1_in_a_write_cycle;
  wire             seg7_s1_master_qreq_vector;
  wire             seg7_s1_non_bursting_master_requests;
  wire    [ 31: 0] seg7_s1_readdata_from_sa;
  reg              seg7_s1_reg_firsttransfer;
  wire             seg7_s1_reset_n;
  reg              seg7_s1_slavearbiterlockenable;
  wire             seg7_s1_slavearbiterlockenable2;
  wire             seg7_s1_unreg_firsttransfer;
  wire             seg7_s1_waits_for_read;
  wire             seg7_s1_waits_for_write;
  wire             seg7_s1_write_n;
  wire    [ 31: 0] seg7_s1_writedata;
  wire             wait_for_seg7_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~seg7_s1_end_xfer;
    end


  assign seg7_s1_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_bridge_m1_qualified_request_seg7_s1));
  //assign seg7_s1_readdata_from_sa = seg7_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign seg7_s1_readdata_from_sa = seg7_s1_readdata;

  assign clock_crossing_bridge_m1_requests_seg7_s1 = ({clock_crossing_bridge_m1_address_to_slave[10 : 4] , 4'b0} == 11'h4b0) & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write);
  //seg7_s1_arb_share_counter set values, which is an e_mux
  assign seg7_s1_arb_share_set_values = 1;

  //seg7_s1_non_bursting_master_requests mux, which is an e_mux
  assign seg7_s1_non_bursting_master_requests = clock_crossing_bridge_m1_requests_seg7_s1;

  //seg7_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign seg7_s1_any_bursting_master_saved_grant = 0;

  //seg7_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign seg7_s1_arb_share_counter_next_value = seg7_s1_firsttransfer ? (seg7_s1_arb_share_set_values - 1) : |seg7_s1_arb_share_counter ? (seg7_s1_arb_share_counter - 1) : 0;

  //seg7_s1_allgrants all slave grants, which is an e_mux
  assign seg7_s1_allgrants = |seg7_s1_grant_vector;

  //seg7_s1_end_xfer assignment, which is an e_assign
  assign seg7_s1_end_xfer = ~(seg7_s1_waits_for_read | seg7_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_seg7_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_seg7_s1 = seg7_s1_end_xfer & (~seg7_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //seg7_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign seg7_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_seg7_s1 & seg7_s1_allgrants) | (end_xfer_arb_share_counter_term_seg7_s1 & ~seg7_s1_non_bursting_master_requests);

  //seg7_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          seg7_s1_arb_share_counter <= 0;
      else if (seg7_s1_arb_counter_enable)
          seg7_s1_arb_share_counter <= seg7_s1_arb_share_counter_next_value;
    end


  //seg7_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          seg7_s1_slavearbiterlockenable <= 0;
      else if ((|seg7_s1_master_qreq_vector & end_xfer_arb_share_counter_term_seg7_s1) | (end_xfer_arb_share_counter_term_seg7_s1 & ~seg7_s1_non_bursting_master_requests))
          seg7_s1_slavearbiterlockenable <= |seg7_s1_arb_share_counter_next_value;
    end


  //clock_crossing_bridge/m1 seg7/s1 arbiterlock, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock = seg7_s1_slavearbiterlockenable & clock_crossing_bridge_m1_continuerequest;

  //seg7_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign seg7_s1_slavearbiterlockenable2 = |seg7_s1_arb_share_counter_next_value;

  //clock_crossing_bridge/m1 seg7/s1 arbiterlock2, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock2 = seg7_s1_slavearbiterlockenable2 & clock_crossing_bridge_m1_continuerequest;

  //seg7_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign seg7_s1_any_continuerequest = 1;

  //clock_crossing_bridge_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_bridge_m1_continuerequest = 1;

  assign clock_crossing_bridge_m1_qualified_request_seg7_s1 = clock_crossing_bridge_m1_requests_seg7_s1 & ~((clock_crossing_bridge_m1_read & ((clock_crossing_bridge_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_bridge_m1_read_data_valid_seg7_s1, which is an e_mux
  assign clock_crossing_bridge_m1_read_data_valid_seg7_s1 = clock_crossing_bridge_m1_granted_seg7_s1 & clock_crossing_bridge_m1_read & ~seg7_s1_waits_for_read;

  //seg7_s1_writedata mux, which is an e_mux
  assign seg7_s1_writedata = clock_crossing_bridge_m1_writedata;

  //master is always granted when requested
  assign clock_crossing_bridge_m1_granted_seg7_s1 = clock_crossing_bridge_m1_qualified_request_seg7_s1;

  //clock_crossing_bridge/m1 saved-grant seg7/s1, which is an e_assign
  assign clock_crossing_bridge_m1_saved_grant_seg7_s1 = clock_crossing_bridge_m1_requests_seg7_s1;

  //allow new arb cycle for seg7/s1, which is an e_assign
  assign seg7_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign seg7_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign seg7_s1_master_qreq_vector = 1;

  //seg7_s1_reset_n assignment, which is an e_assign
  assign seg7_s1_reset_n = reset_n;

  assign seg7_s1_chipselect = clock_crossing_bridge_m1_granted_seg7_s1;
  //seg7_s1_firsttransfer first transaction, which is an e_assign
  assign seg7_s1_firsttransfer = seg7_s1_begins_xfer ? seg7_s1_unreg_firsttransfer : seg7_s1_reg_firsttransfer;

  //seg7_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign seg7_s1_unreg_firsttransfer = ~(seg7_s1_slavearbiterlockenable & seg7_s1_any_continuerequest);

  //seg7_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          seg7_s1_reg_firsttransfer <= 1'b1;
      else if (seg7_s1_begins_xfer)
          seg7_s1_reg_firsttransfer <= seg7_s1_unreg_firsttransfer;
    end


  //seg7_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign seg7_s1_beginbursttransfer_internal = seg7_s1_begins_xfer;

  //~seg7_s1_write_n assignment, which is an e_mux
  assign seg7_s1_write_n = ~(clock_crossing_bridge_m1_granted_seg7_s1 & clock_crossing_bridge_m1_write);

  //seg7_s1_address mux, which is an e_mux
  assign seg7_s1_address = clock_crossing_bridge_m1_nativeaddress;

  //d1_seg7_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_seg7_s1_end_xfer <= 1;
      else 
        d1_seg7_s1_end_xfer <= seg7_s1_end_xfer;
    end


  //seg7_s1_waits_for_read in a cycle, which is an e_mux
  assign seg7_s1_waits_for_read = seg7_s1_in_a_read_cycle & seg7_s1_begins_xfer;

  //seg7_s1_in_a_read_cycle assignment, which is an e_assign
  assign seg7_s1_in_a_read_cycle = clock_crossing_bridge_m1_granted_seg7_s1 & clock_crossing_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = seg7_s1_in_a_read_cycle;

  //seg7_s1_waits_for_write in a cycle, which is an e_mux
  assign seg7_s1_waits_for_write = seg7_s1_in_a_write_cycle & 0;

  //seg7_s1_in_a_write_cycle assignment, which is an e_assign
  assign seg7_s1_in_a_write_cycle = clock_crossing_bridge_m1_granted_seg7_s1 & clock_crossing_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = seg7_s1_in_a_write_cycle;

  assign wait_for_seg7_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //seg7/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module switches_s1_arbitrator (
                                // inputs:
                                 clk,
                                 clock_crossing_bridge_m1_address_to_slave,
                                 clock_crossing_bridge_m1_latency_counter,
                                 clock_crossing_bridge_m1_nativeaddress,
                                 clock_crossing_bridge_m1_read,
                                 clock_crossing_bridge_m1_write,
                                 clock_crossing_bridge_m1_writedata,
                                 reset_n,
                                 switches_s1_irq,
                                 switches_s1_readdata,

                                // outputs:
                                 clock_crossing_bridge_m1_granted_switches_s1,
                                 clock_crossing_bridge_m1_qualified_request_switches_s1,
                                 clock_crossing_bridge_m1_read_data_valid_switches_s1,
                                 clock_crossing_bridge_m1_requests_switches_s1,
                                 d1_switches_s1_end_xfer,
                                 switches_s1_address,
                                 switches_s1_chipselect,
                                 switches_s1_irq_from_sa,
                                 switches_s1_readdata_from_sa,
                                 switches_s1_reset_n,
                                 switches_s1_write_n,
                                 switches_s1_writedata
                              )
;

  output           clock_crossing_bridge_m1_granted_switches_s1;
  output           clock_crossing_bridge_m1_qualified_request_switches_s1;
  output           clock_crossing_bridge_m1_read_data_valid_switches_s1;
  output           clock_crossing_bridge_m1_requests_switches_s1;
  output           d1_switches_s1_end_xfer;
  output  [  1: 0] switches_s1_address;
  output           switches_s1_chipselect;
  output           switches_s1_irq_from_sa;
  output  [ 31: 0] switches_s1_readdata_from_sa;
  output           switches_s1_reset_n;
  output           switches_s1_write_n;
  output  [ 31: 0] switches_s1_writedata;
  input            clk;
  input   [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  input            clock_crossing_bridge_m1_latency_counter;
  input   [  8: 0] clock_crossing_bridge_m1_nativeaddress;
  input            clock_crossing_bridge_m1_read;
  input            clock_crossing_bridge_m1_write;
  input   [ 31: 0] clock_crossing_bridge_m1_writedata;
  input            reset_n;
  input            switches_s1_irq;
  input   [ 31: 0] switches_s1_readdata;

  wire             clock_crossing_bridge_m1_arbiterlock;
  wire             clock_crossing_bridge_m1_arbiterlock2;
  wire             clock_crossing_bridge_m1_continuerequest;
  wire             clock_crossing_bridge_m1_granted_switches_s1;
  wire             clock_crossing_bridge_m1_qualified_request_switches_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_switches_s1;
  wire             clock_crossing_bridge_m1_requests_switches_s1;
  wire             clock_crossing_bridge_m1_saved_grant_switches_s1;
  reg              d1_reasons_to_wait;
  reg              d1_switches_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_switches_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] switches_s1_address;
  wire             switches_s1_allgrants;
  wire             switches_s1_allow_new_arb_cycle;
  wire             switches_s1_any_bursting_master_saved_grant;
  wire             switches_s1_any_continuerequest;
  wire             switches_s1_arb_counter_enable;
  reg              switches_s1_arb_share_counter;
  wire             switches_s1_arb_share_counter_next_value;
  wire             switches_s1_arb_share_set_values;
  wire             switches_s1_beginbursttransfer_internal;
  wire             switches_s1_begins_xfer;
  wire             switches_s1_chipselect;
  wire             switches_s1_end_xfer;
  wire             switches_s1_firsttransfer;
  wire             switches_s1_grant_vector;
  wire             switches_s1_in_a_read_cycle;
  wire             switches_s1_in_a_write_cycle;
  wire             switches_s1_irq_from_sa;
  wire             switches_s1_master_qreq_vector;
  wire             switches_s1_non_bursting_master_requests;
  wire    [ 31: 0] switches_s1_readdata_from_sa;
  reg              switches_s1_reg_firsttransfer;
  wire             switches_s1_reset_n;
  reg              switches_s1_slavearbiterlockenable;
  wire             switches_s1_slavearbiterlockenable2;
  wire             switches_s1_unreg_firsttransfer;
  wire             switches_s1_waits_for_read;
  wire             switches_s1_waits_for_write;
  wire             switches_s1_write_n;
  wire    [ 31: 0] switches_s1_writedata;
  wire             wait_for_switches_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~switches_s1_end_xfer;
    end


  assign switches_s1_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_bridge_m1_qualified_request_switches_s1));
  //assign switches_s1_readdata_from_sa = switches_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign switches_s1_readdata_from_sa = switches_s1_readdata;

  assign clock_crossing_bridge_m1_requests_switches_s1 = ({clock_crossing_bridge_m1_address_to_slave[10 : 4] , 4'b0} == 11'h470) & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write);
  //switches_s1_arb_share_counter set values, which is an e_mux
  assign switches_s1_arb_share_set_values = 1;

  //switches_s1_non_bursting_master_requests mux, which is an e_mux
  assign switches_s1_non_bursting_master_requests = clock_crossing_bridge_m1_requests_switches_s1;

  //switches_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign switches_s1_any_bursting_master_saved_grant = 0;

  //switches_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign switches_s1_arb_share_counter_next_value = switches_s1_firsttransfer ? (switches_s1_arb_share_set_values - 1) : |switches_s1_arb_share_counter ? (switches_s1_arb_share_counter - 1) : 0;

  //switches_s1_allgrants all slave grants, which is an e_mux
  assign switches_s1_allgrants = |switches_s1_grant_vector;

  //switches_s1_end_xfer assignment, which is an e_assign
  assign switches_s1_end_xfer = ~(switches_s1_waits_for_read | switches_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_switches_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_switches_s1 = switches_s1_end_xfer & (~switches_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //switches_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign switches_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_switches_s1 & switches_s1_allgrants) | (end_xfer_arb_share_counter_term_switches_s1 & ~switches_s1_non_bursting_master_requests);

  //switches_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          switches_s1_arb_share_counter <= 0;
      else if (switches_s1_arb_counter_enable)
          switches_s1_arb_share_counter <= switches_s1_arb_share_counter_next_value;
    end


  //switches_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          switches_s1_slavearbiterlockenable <= 0;
      else if ((|switches_s1_master_qreq_vector & end_xfer_arb_share_counter_term_switches_s1) | (end_xfer_arb_share_counter_term_switches_s1 & ~switches_s1_non_bursting_master_requests))
          switches_s1_slavearbiterlockenable <= |switches_s1_arb_share_counter_next_value;
    end


  //clock_crossing_bridge/m1 switches/s1 arbiterlock, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock = switches_s1_slavearbiterlockenable & clock_crossing_bridge_m1_continuerequest;

  //switches_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign switches_s1_slavearbiterlockenable2 = |switches_s1_arb_share_counter_next_value;

  //clock_crossing_bridge/m1 switches/s1 arbiterlock2, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock2 = switches_s1_slavearbiterlockenable2 & clock_crossing_bridge_m1_continuerequest;

  //switches_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign switches_s1_any_continuerequest = 1;

  //clock_crossing_bridge_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_bridge_m1_continuerequest = 1;

  assign clock_crossing_bridge_m1_qualified_request_switches_s1 = clock_crossing_bridge_m1_requests_switches_s1 & ~((clock_crossing_bridge_m1_read & ((clock_crossing_bridge_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_bridge_m1_read_data_valid_switches_s1, which is an e_mux
  assign clock_crossing_bridge_m1_read_data_valid_switches_s1 = clock_crossing_bridge_m1_granted_switches_s1 & clock_crossing_bridge_m1_read & ~switches_s1_waits_for_read;

  //switches_s1_writedata mux, which is an e_mux
  assign switches_s1_writedata = clock_crossing_bridge_m1_writedata;

  //master is always granted when requested
  assign clock_crossing_bridge_m1_granted_switches_s1 = clock_crossing_bridge_m1_qualified_request_switches_s1;

  //clock_crossing_bridge/m1 saved-grant switches/s1, which is an e_assign
  assign clock_crossing_bridge_m1_saved_grant_switches_s1 = clock_crossing_bridge_m1_requests_switches_s1;

  //allow new arb cycle for switches/s1, which is an e_assign
  assign switches_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign switches_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign switches_s1_master_qreq_vector = 1;

  //switches_s1_reset_n assignment, which is an e_assign
  assign switches_s1_reset_n = reset_n;

  assign switches_s1_chipselect = clock_crossing_bridge_m1_granted_switches_s1;
  //switches_s1_firsttransfer first transaction, which is an e_assign
  assign switches_s1_firsttransfer = switches_s1_begins_xfer ? switches_s1_unreg_firsttransfer : switches_s1_reg_firsttransfer;

  //switches_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign switches_s1_unreg_firsttransfer = ~(switches_s1_slavearbiterlockenable & switches_s1_any_continuerequest);

  //switches_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          switches_s1_reg_firsttransfer <= 1'b1;
      else if (switches_s1_begins_xfer)
          switches_s1_reg_firsttransfer <= switches_s1_unreg_firsttransfer;
    end


  //switches_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign switches_s1_beginbursttransfer_internal = switches_s1_begins_xfer;

  //~switches_s1_write_n assignment, which is an e_mux
  assign switches_s1_write_n = ~(clock_crossing_bridge_m1_granted_switches_s1 & clock_crossing_bridge_m1_write);

  //switches_s1_address mux, which is an e_mux
  assign switches_s1_address = clock_crossing_bridge_m1_nativeaddress;

  //d1_switches_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_switches_s1_end_xfer <= 1;
      else 
        d1_switches_s1_end_xfer <= switches_s1_end_xfer;
    end


  //switches_s1_waits_for_read in a cycle, which is an e_mux
  assign switches_s1_waits_for_read = switches_s1_in_a_read_cycle & switches_s1_begins_xfer;

  //switches_s1_in_a_read_cycle assignment, which is an e_assign
  assign switches_s1_in_a_read_cycle = clock_crossing_bridge_m1_granted_switches_s1 & clock_crossing_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = switches_s1_in_a_read_cycle;

  //switches_s1_waits_for_write in a cycle, which is an e_mux
  assign switches_s1_waits_for_write = switches_s1_in_a_write_cycle & 0;

  //switches_s1_in_a_write_cycle assignment, which is an e_assign
  assign switches_s1_in_a_write_cycle = clock_crossing_bridge_m1_granted_switches_s1 & clock_crossing_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = switches_s1_in_a_write_cycle;

  assign wait_for_switches_s1_counter = 0;
  //assign switches_s1_irq_from_sa = switches_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign switches_s1_irq_from_sa = switches_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //switches/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         clock_crossing_bridge_m1_address_to_slave,
                                         clock_crossing_bridge_m1_latency_counter,
                                         clock_crossing_bridge_m1_nativeaddress,
                                         clock_crossing_bridge_m1_read,
                                         clock_crossing_bridge_m1_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         clock_crossing_bridge_m1_granted_sysid_control_slave,
                                         clock_crossing_bridge_m1_qualified_request_sysid_control_slave,
                                         clock_crossing_bridge_m1_read_data_valid_sysid_control_slave,
                                         clock_crossing_bridge_m1_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           clock_crossing_bridge_m1_granted_sysid_control_slave;
  output           clock_crossing_bridge_m1_qualified_request_sysid_control_slave;
  output           clock_crossing_bridge_m1_read_data_valid_sysid_control_slave;
  output           clock_crossing_bridge_m1_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input            clk;
  input   [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  input            clock_crossing_bridge_m1_latency_counter;
  input   [  8: 0] clock_crossing_bridge_m1_nativeaddress;
  input            clock_crossing_bridge_m1_read;
  input            clock_crossing_bridge_m1_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             clock_crossing_bridge_m1_arbiterlock;
  wire             clock_crossing_bridge_m1_arbiterlock2;
  wire             clock_crossing_bridge_m1_continuerequest;
  wire             clock_crossing_bridge_m1_granted_sysid_control_slave;
  wire             clock_crossing_bridge_m1_qualified_request_sysid_control_slave;
  wire             clock_crossing_bridge_m1_read_data_valid_sysid_control_slave;
  wire             clock_crossing_bridge_m1_requests_sysid_control_slave;
  wire             clock_crossing_bridge_m1_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg              sysid_control_slave_arb_share_counter;
  wire             sysid_control_slave_arb_share_counter_next_value;
  wire             sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_bridge_m1_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign clock_crossing_bridge_m1_requests_sysid_control_slave = (({clock_crossing_bridge_m1_address_to_slave[10 : 3] , 3'b0} == 11'h4c0) & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write)) & clock_crossing_bridge_m1_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = clock_crossing_bridge_m1_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //clock_crossing_bridge/m1 sysid/control_slave arbiterlock, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock = sysid_control_slave_slavearbiterlockenable & clock_crossing_bridge_m1_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //clock_crossing_bridge/m1 sysid/control_slave arbiterlock2, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & clock_crossing_bridge_m1_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //clock_crossing_bridge_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_bridge_m1_continuerequest = 1;

  assign clock_crossing_bridge_m1_qualified_request_sysid_control_slave = clock_crossing_bridge_m1_requests_sysid_control_slave & ~((clock_crossing_bridge_m1_read & ((clock_crossing_bridge_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_bridge_m1_read_data_valid_sysid_control_slave, which is an e_mux
  assign clock_crossing_bridge_m1_read_data_valid_sysid_control_slave = clock_crossing_bridge_m1_granted_sysid_control_slave & clock_crossing_bridge_m1_read & ~sysid_control_slave_waits_for_read;

  //master is always granted when requested
  assign clock_crossing_bridge_m1_granted_sysid_control_slave = clock_crossing_bridge_m1_qualified_request_sysid_control_slave;

  //clock_crossing_bridge/m1 saved-grant sysid/control_slave, which is an e_assign
  assign clock_crossing_bridge_m1_saved_grant_sysid_control_slave = clock_crossing_bridge_m1_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = clock_crossing_bridge_m1_nativeaddress;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = clock_crossing_bridge_m1_granted_sysid_control_slave & clock_crossing_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = clock_crossing_bridge_m1_granted_sysid_control_slave & clock_crossing_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_s1_arbitrator (
                             // inputs:
                              clk,
                              clock_crossing_bridge_m1_address_to_slave,
                              clock_crossing_bridge_m1_latency_counter,
                              clock_crossing_bridge_m1_nativeaddress,
                              clock_crossing_bridge_m1_read,
                              clock_crossing_bridge_m1_write,
                              clock_crossing_bridge_m1_writedata,
                              reset_n,
                              timer_s1_irq,
                              timer_s1_readdata,

                             // outputs:
                              clock_crossing_bridge_m1_granted_timer_s1,
                              clock_crossing_bridge_m1_qualified_request_timer_s1,
                              clock_crossing_bridge_m1_read_data_valid_timer_s1,
                              clock_crossing_bridge_m1_requests_timer_s1,
                              d1_timer_s1_end_xfer,
                              timer_s1_address,
                              timer_s1_chipselect,
                              timer_s1_irq_from_sa,
                              timer_s1_readdata_from_sa,
                              timer_s1_reset_n,
                              timer_s1_write_n,
                              timer_s1_writedata
                           )
;

  output           clock_crossing_bridge_m1_granted_timer_s1;
  output           clock_crossing_bridge_m1_qualified_request_timer_s1;
  output           clock_crossing_bridge_m1_read_data_valid_timer_s1;
  output           clock_crossing_bridge_m1_requests_timer_s1;
  output           d1_timer_s1_end_xfer;
  output  [  2: 0] timer_s1_address;
  output           timer_s1_chipselect;
  output           timer_s1_irq_from_sa;
  output  [ 15: 0] timer_s1_readdata_from_sa;
  output           timer_s1_reset_n;
  output           timer_s1_write_n;
  output  [ 15: 0] timer_s1_writedata;
  input            clk;
  input   [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  input            clock_crossing_bridge_m1_latency_counter;
  input   [  8: 0] clock_crossing_bridge_m1_nativeaddress;
  input            clock_crossing_bridge_m1_read;
  input            clock_crossing_bridge_m1_write;
  input   [ 31: 0] clock_crossing_bridge_m1_writedata;
  input            reset_n;
  input            timer_s1_irq;
  input   [ 15: 0] timer_s1_readdata;

  wire             clock_crossing_bridge_m1_arbiterlock;
  wire             clock_crossing_bridge_m1_arbiterlock2;
  wire             clock_crossing_bridge_m1_continuerequest;
  wire             clock_crossing_bridge_m1_granted_timer_s1;
  wire             clock_crossing_bridge_m1_qualified_request_timer_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_timer_s1;
  wire             clock_crossing_bridge_m1_requests_timer_s1;
  wire             clock_crossing_bridge_m1_saved_grant_timer_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] timer_s1_address;
  wire             timer_s1_allgrants;
  wire             timer_s1_allow_new_arb_cycle;
  wire             timer_s1_any_bursting_master_saved_grant;
  wire             timer_s1_any_continuerequest;
  wire             timer_s1_arb_counter_enable;
  reg              timer_s1_arb_share_counter;
  wire             timer_s1_arb_share_counter_next_value;
  wire             timer_s1_arb_share_set_values;
  wire             timer_s1_beginbursttransfer_internal;
  wire             timer_s1_begins_xfer;
  wire             timer_s1_chipselect;
  wire             timer_s1_end_xfer;
  wire             timer_s1_firsttransfer;
  wire             timer_s1_grant_vector;
  wire             timer_s1_in_a_read_cycle;
  wire             timer_s1_in_a_write_cycle;
  wire             timer_s1_irq_from_sa;
  wire             timer_s1_master_qreq_vector;
  wire             timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_s1_readdata_from_sa;
  reg              timer_s1_reg_firsttransfer;
  wire             timer_s1_reset_n;
  reg              timer_s1_slavearbiterlockenable;
  wire             timer_s1_slavearbiterlockenable2;
  wire             timer_s1_unreg_firsttransfer;
  wire             timer_s1_waits_for_read;
  wire             timer_s1_waits_for_write;
  wire             timer_s1_write_n;
  wire    [ 15: 0] timer_s1_writedata;
  wire             wait_for_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_s1_end_xfer;
    end


  assign timer_s1_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_bridge_m1_qualified_request_timer_s1));
  //assign timer_s1_readdata_from_sa = timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_s1_readdata_from_sa = timer_s1_readdata;

  assign clock_crossing_bridge_m1_requests_timer_s1 = ({clock_crossing_bridge_m1_address_to_slave[10 : 5] , 5'b0} == 11'h400) & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write);
  //timer_s1_arb_share_counter set values, which is an e_mux
  assign timer_s1_arb_share_set_values = 1;

  //timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_s1_non_bursting_master_requests = clock_crossing_bridge_m1_requests_timer_s1;

  //timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_s1_any_bursting_master_saved_grant = 0;

  //timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_s1_arb_share_counter_next_value = timer_s1_firsttransfer ? (timer_s1_arb_share_set_values - 1) : |timer_s1_arb_share_counter ? (timer_s1_arb_share_counter - 1) : 0;

  //timer_s1_allgrants all slave grants, which is an e_mux
  assign timer_s1_allgrants = |timer_s1_grant_vector;

  //timer_s1_end_xfer assignment, which is an e_assign
  assign timer_s1_end_xfer = ~(timer_s1_waits_for_read | timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_s1 = timer_s1_end_xfer & (~timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_s1 & timer_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_s1 & ~timer_s1_non_bursting_master_requests);

  //timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_arb_share_counter <= 0;
      else if (timer_s1_arb_counter_enable)
          timer_s1_arb_share_counter <= timer_s1_arb_share_counter_next_value;
    end


  //timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_slavearbiterlockenable <= 0;
      else if ((|timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_s1) | (end_xfer_arb_share_counter_term_timer_s1 & ~timer_s1_non_bursting_master_requests))
          timer_s1_slavearbiterlockenable <= |timer_s1_arb_share_counter_next_value;
    end


  //clock_crossing_bridge/m1 timer/s1 arbiterlock, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock = timer_s1_slavearbiterlockenable & clock_crossing_bridge_m1_continuerequest;

  //timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_s1_slavearbiterlockenable2 = |timer_s1_arb_share_counter_next_value;

  //clock_crossing_bridge/m1 timer/s1 arbiterlock2, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock2 = timer_s1_slavearbiterlockenable2 & clock_crossing_bridge_m1_continuerequest;

  //timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_s1_any_continuerequest = 1;

  //clock_crossing_bridge_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_bridge_m1_continuerequest = 1;

  assign clock_crossing_bridge_m1_qualified_request_timer_s1 = clock_crossing_bridge_m1_requests_timer_s1 & ~((clock_crossing_bridge_m1_read & ((clock_crossing_bridge_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_bridge_m1_read_data_valid_timer_s1, which is an e_mux
  assign clock_crossing_bridge_m1_read_data_valid_timer_s1 = clock_crossing_bridge_m1_granted_timer_s1 & clock_crossing_bridge_m1_read & ~timer_s1_waits_for_read;

  //timer_s1_writedata mux, which is an e_mux
  assign timer_s1_writedata = clock_crossing_bridge_m1_writedata;

  //master is always granted when requested
  assign clock_crossing_bridge_m1_granted_timer_s1 = clock_crossing_bridge_m1_qualified_request_timer_s1;

  //clock_crossing_bridge/m1 saved-grant timer/s1, which is an e_assign
  assign clock_crossing_bridge_m1_saved_grant_timer_s1 = clock_crossing_bridge_m1_requests_timer_s1;

  //allow new arb cycle for timer/s1, which is an e_assign
  assign timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_s1_master_qreq_vector = 1;

  //timer_s1_reset_n assignment, which is an e_assign
  assign timer_s1_reset_n = reset_n;

  assign timer_s1_chipselect = clock_crossing_bridge_m1_granted_timer_s1;
  //timer_s1_firsttransfer first transaction, which is an e_assign
  assign timer_s1_firsttransfer = timer_s1_begins_xfer ? timer_s1_unreg_firsttransfer : timer_s1_reg_firsttransfer;

  //timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_s1_unreg_firsttransfer = ~(timer_s1_slavearbiterlockenable & timer_s1_any_continuerequest);

  //timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_reg_firsttransfer <= 1'b1;
      else if (timer_s1_begins_xfer)
          timer_s1_reg_firsttransfer <= timer_s1_unreg_firsttransfer;
    end


  //timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_s1_beginbursttransfer_internal = timer_s1_begins_xfer;

  //~timer_s1_write_n assignment, which is an e_mux
  assign timer_s1_write_n = ~(clock_crossing_bridge_m1_granted_timer_s1 & clock_crossing_bridge_m1_write);

  //timer_s1_address mux, which is an e_mux
  assign timer_s1_address = clock_crossing_bridge_m1_nativeaddress;

  //d1_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_s1_end_xfer <= 1;
      else 
        d1_timer_s1_end_xfer <= timer_s1_end_xfer;
    end


  //timer_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_s1_waits_for_read = timer_s1_in_a_read_cycle & timer_s1_begins_xfer;

  //timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_s1_in_a_read_cycle = clock_crossing_bridge_m1_granted_timer_s1 & clock_crossing_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_s1_in_a_read_cycle;

  //timer_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_s1_waits_for_write = timer_s1_in_a_write_cycle & 0;

  //timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_s1_in_a_write_cycle = clock_crossing_bridge_m1_granted_timer_s1 & clock_crossing_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_s1_in_a_write_cycle;

  assign wait_for_timer_s1_counter = 0;
  //assign timer_s1_irq_from_sa = timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_s1_irq_from_sa = timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_0_s1_arbitrator (
                               // inputs:
                                DE0_SOPC_clock_1_out_address_to_slave,
                                DE0_SOPC_clock_1_out_nativeaddress,
                                DE0_SOPC_clock_1_out_read,
                                DE0_SOPC_clock_1_out_write,
                                DE0_SOPC_clock_1_out_writedata,
                                clk,
                                reset_n,
                                timer_0_s1_irq,
                                timer_0_s1_readdata,

                               // outputs:
                                DE0_SOPC_clock_1_out_granted_timer_0_s1,
                                DE0_SOPC_clock_1_out_qualified_request_timer_0_s1,
                                DE0_SOPC_clock_1_out_read_data_valid_timer_0_s1,
                                DE0_SOPC_clock_1_out_requests_timer_0_s1,
                                d1_timer_0_s1_end_xfer,
                                timer_0_s1_address,
                                timer_0_s1_chipselect,
                                timer_0_s1_irq_from_sa,
                                timer_0_s1_readdata_from_sa,
                                timer_0_s1_reset_n,
                                timer_0_s1_write_n,
                                timer_0_s1_writedata
                             )
;

  output           DE0_SOPC_clock_1_out_granted_timer_0_s1;
  output           DE0_SOPC_clock_1_out_qualified_request_timer_0_s1;
  output           DE0_SOPC_clock_1_out_read_data_valid_timer_0_s1;
  output           DE0_SOPC_clock_1_out_requests_timer_0_s1;
  output           d1_timer_0_s1_end_xfer;
  output  [  2: 0] timer_0_s1_address;
  output           timer_0_s1_chipselect;
  output           timer_0_s1_irq_from_sa;
  output  [ 15: 0] timer_0_s1_readdata_from_sa;
  output           timer_0_s1_reset_n;
  output           timer_0_s1_write_n;
  output  [ 15: 0] timer_0_s1_writedata;
  input   [  3: 0] DE0_SOPC_clock_1_out_address_to_slave;
  input   [  2: 0] DE0_SOPC_clock_1_out_nativeaddress;
  input            DE0_SOPC_clock_1_out_read;
  input            DE0_SOPC_clock_1_out_write;
  input   [ 15: 0] DE0_SOPC_clock_1_out_writedata;
  input            clk;
  input            reset_n;
  input            timer_0_s1_irq;
  input   [ 15: 0] timer_0_s1_readdata;

  wire             DE0_SOPC_clock_1_out_arbiterlock;
  wire             DE0_SOPC_clock_1_out_arbiterlock2;
  wire             DE0_SOPC_clock_1_out_continuerequest;
  wire             DE0_SOPC_clock_1_out_granted_timer_0_s1;
  wire             DE0_SOPC_clock_1_out_qualified_request_timer_0_s1;
  wire             DE0_SOPC_clock_1_out_read_data_valid_timer_0_s1;
  wire             DE0_SOPC_clock_1_out_requests_timer_0_s1;
  wire             DE0_SOPC_clock_1_out_saved_grant_timer_0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] timer_0_s1_address;
  wire             timer_0_s1_allgrants;
  wire             timer_0_s1_allow_new_arb_cycle;
  wire             timer_0_s1_any_bursting_master_saved_grant;
  wire             timer_0_s1_any_continuerequest;
  wire             timer_0_s1_arb_counter_enable;
  reg              timer_0_s1_arb_share_counter;
  wire             timer_0_s1_arb_share_counter_next_value;
  wire             timer_0_s1_arb_share_set_values;
  wire             timer_0_s1_beginbursttransfer_internal;
  wire             timer_0_s1_begins_xfer;
  wire             timer_0_s1_chipselect;
  wire             timer_0_s1_end_xfer;
  wire             timer_0_s1_firsttransfer;
  wire             timer_0_s1_grant_vector;
  wire             timer_0_s1_in_a_read_cycle;
  wire             timer_0_s1_in_a_write_cycle;
  wire             timer_0_s1_irq_from_sa;
  wire             timer_0_s1_master_qreq_vector;
  wire             timer_0_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_0_s1_readdata_from_sa;
  reg              timer_0_s1_reg_firsttransfer;
  wire             timer_0_s1_reset_n;
  reg              timer_0_s1_slavearbiterlockenable;
  wire             timer_0_s1_slavearbiterlockenable2;
  wire             timer_0_s1_unreg_firsttransfer;
  wire             timer_0_s1_waits_for_read;
  wire             timer_0_s1_waits_for_write;
  wire             timer_0_s1_write_n;
  wire    [ 15: 0] timer_0_s1_writedata;
  wire             wait_for_timer_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_0_s1_end_xfer;
    end


  assign timer_0_s1_begins_xfer = ~d1_reasons_to_wait & ((DE0_SOPC_clock_1_out_qualified_request_timer_0_s1));
  //assign timer_0_s1_readdata_from_sa = timer_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_0_s1_readdata_from_sa = timer_0_s1_readdata;

  assign DE0_SOPC_clock_1_out_requests_timer_0_s1 = (1) & (DE0_SOPC_clock_1_out_read | DE0_SOPC_clock_1_out_write);
  //timer_0_s1_arb_share_counter set values, which is an e_mux
  assign timer_0_s1_arb_share_set_values = 1;

  //timer_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_0_s1_non_bursting_master_requests = DE0_SOPC_clock_1_out_requests_timer_0_s1;

  //timer_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_0_s1_any_bursting_master_saved_grant = 0;

  //timer_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_0_s1_arb_share_counter_next_value = timer_0_s1_firsttransfer ? (timer_0_s1_arb_share_set_values - 1) : |timer_0_s1_arb_share_counter ? (timer_0_s1_arb_share_counter - 1) : 0;

  //timer_0_s1_allgrants all slave grants, which is an e_mux
  assign timer_0_s1_allgrants = |timer_0_s1_grant_vector;

  //timer_0_s1_end_xfer assignment, which is an e_assign
  assign timer_0_s1_end_xfer = ~(timer_0_s1_waits_for_read | timer_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_0_s1 = timer_0_s1_end_xfer & (~timer_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_0_s1 & timer_0_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_0_s1 & ~timer_0_s1_non_bursting_master_requests);

  //timer_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_arb_share_counter <= 0;
      else if (timer_0_s1_arb_counter_enable)
          timer_0_s1_arb_share_counter <= timer_0_s1_arb_share_counter_next_value;
    end


  //timer_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_slavearbiterlockenable <= 0;
      else if ((|timer_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_0_s1) | (end_xfer_arb_share_counter_term_timer_0_s1 & ~timer_0_s1_non_bursting_master_requests))
          timer_0_s1_slavearbiterlockenable <= |timer_0_s1_arb_share_counter_next_value;
    end


  //DE0_SOPC_clock_1/out timer_0/s1 arbiterlock, which is an e_assign
  assign DE0_SOPC_clock_1_out_arbiterlock = timer_0_s1_slavearbiterlockenable & DE0_SOPC_clock_1_out_continuerequest;

  //timer_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_0_s1_slavearbiterlockenable2 = |timer_0_s1_arb_share_counter_next_value;

  //DE0_SOPC_clock_1/out timer_0/s1 arbiterlock2, which is an e_assign
  assign DE0_SOPC_clock_1_out_arbiterlock2 = timer_0_s1_slavearbiterlockenable2 & DE0_SOPC_clock_1_out_continuerequest;

  //timer_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_0_s1_any_continuerequest = 1;

  //DE0_SOPC_clock_1_out_continuerequest continued request, which is an e_assign
  assign DE0_SOPC_clock_1_out_continuerequest = 1;

  assign DE0_SOPC_clock_1_out_qualified_request_timer_0_s1 = DE0_SOPC_clock_1_out_requests_timer_0_s1;
  //timer_0_s1_writedata mux, which is an e_mux
  assign timer_0_s1_writedata = DE0_SOPC_clock_1_out_writedata;

  //master is always granted when requested
  assign DE0_SOPC_clock_1_out_granted_timer_0_s1 = DE0_SOPC_clock_1_out_qualified_request_timer_0_s1;

  //DE0_SOPC_clock_1/out saved-grant timer_0/s1, which is an e_assign
  assign DE0_SOPC_clock_1_out_saved_grant_timer_0_s1 = DE0_SOPC_clock_1_out_requests_timer_0_s1;

  //allow new arb cycle for timer_0/s1, which is an e_assign
  assign timer_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_0_s1_master_qreq_vector = 1;

  //timer_0_s1_reset_n assignment, which is an e_assign
  assign timer_0_s1_reset_n = reset_n;

  assign timer_0_s1_chipselect = DE0_SOPC_clock_1_out_granted_timer_0_s1;
  //timer_0_s1_firsttransfer first transaction, which is an e_assign
  assign timer_0_s1_firsttransfer = timer_0_s1_begins_xfer ? timer_0_s1_unreg_firsttransfer : timer_0_s1_reg_firsttransfer;

  //timer_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_0_s1_unreg_firsttransfer = ~(timer_0_s1_slavearbiterlockenable & timer_0_s1_any_continuerequest);

  //timer_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_reg_firsttransfer <= 1'b1;
      else if (timer_0_s1_begins_xfer)
          timer_0_s1_reg_firsttransfer <= timer_0_s1_unreg_firsttransfer;
    end


  //timer_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_0_s1_beginbursttransfer_internal = timer_0_s1_begins_xfer;

  //~timer_0_s1_write_n assignment, which is an e_mux
  assign timer_0_s1_write_n = ~(DE0_SOPC_clock_1_out_granted_timer_0_s1 & DE0_SOPC_clock_1_out_write);

  //timer_0_s1_address mux, which is an e_mux
  assign timer_0_s1_address = DE0_SOPC_clock_1_out_nativeaddress;

  //d1_timer_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_0_s1_end_xfer <= 1;
      else 
        d1_timer_0_s1_end_xfer <= timer_0_s1_end_xfer;
    end


  //timer_0_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_0_s1_waits_for_read = timer_0_s1_in_a_read_cycle & timer_0_s1_begins_xfer;

  //timer_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_0_s1_in_a_read_cycle = DE0_SOPC_clock_1_out_granted_timer_0_s1 & DE0_SOPC_clock_1_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_0_s1_in_a_read_cycle;

  //timer_0_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_0_s1_waits_for_write = timer_0_s1_in_a_write_cycle & 0;

  //timer_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_0_s1_in_a_write_cycle = DE0_SOPC_clock_1_out_granted_timer_0_s1 & DE0_SOPC_clock_1_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_0_s1_in_a_write_cycle;

  assign wait_for_timer_0_s1_counter = 0;
  //assign timer_0_s1_irq_from_sa = timer_0_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_0_s1_irq_from_sa = timer_0_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tristate_bridge_avalon_slave_arbitrator (
                                                 // inputs:
                                                  clk,
                                                  cpu_data_master_address_to_slave,
                                                  cpu_data_master_byteenable,
                                                  cpu_data_master_dbs_address,
                                                  cpu_data_master_dbs_write_16,
                                                  cpu_data_master_no_byte_enables_and_last_term,
                                                  cpu_data_master_read,
                                                  cpu_data_master_write,
                                                  cpu_instruction_master_address_to_slave,
                                                  cpu_instruction_master_dbs_address,
                                                  cpu_instruction_master_read,
                                                  reset_n,

                                                 // outputs:
                                                  address_to_the_cfi_flash,
                                                  cfi_flash_s1_wait_counter_eq_0,
                                                  cfi_flash_s1_wait_counter_eq_1,
                                                  cpu_data_master_byteenable_cfi_flash_s1,
                                                  cpu_data_master_granted_cfi_flash_s1,
                                                  cpu_data_master_qualified_request_cfi_flash_s1,
                                                  cpu_data_master_read_data_valid_cfi_flash_s1,
                                                  cpu_data_master_requests_cfi_flash_s1,
                                                  cpu_instruction_master_granted_cfi_flash_s1,
                                                  cpu_instruction_master_qualified_request_cfi_flash_s1,
                                                  cpu_instruction_master_read_data_valid_cfi_flash_s1,
                                                  cpu_instruction_master_requests_cfi_flash_s1,
                                                  d1_tristate_bridge_avalon_slave_end_xfer,
                                                  data_to_and_from_the_cfi_flash,
                                                  incoming_data_to_and_from_the_cfi_flash,
                                                  incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0,
                                                  read_n_to_the_cfi_flash,
                                                  registered_cpu_data_master_read_data_valid_cfi_flash_s1,
                                                  select_n_to_the_cfi_flash,
                                                  write_n_to_the_cfi_flash
                                               )
;

  output  [ 21: 0] address_to_the_cfi_flash;
  output           cfi_flash_s1_wait_counter_eq_0;
  output           cfi_flash_s1_wait_counter_eq_1;
  output  [  1: 0] cpu_data_master_byteenable_cfi_flash_s1;
  output           cpu_data_master_granted_cfi_flash_s1;
  output           cpu_data_master_qualified_request_cfi_flash_s1;
  output           cpu_data_master_read_data_valid_cfi_flash_s1;
  output           cpu_data_master_requests_cfi_flash_s1;
  output           cpu_instruction_master_granted_cfi_flash_s1;
  output           cpu_instruction_master_qualified_request_cfi_flash_s1;
  output           cpu_instruction_master_read_data_valid_cfi_flash_s1;
  output           cpu_instruction_master_requests_cfi_flash_s1;
  output           d1_tristate_bridge_avalon_slave_end_xfer;
  inout   [ 15: 0] data_to_and_from_the_cfi_flash;
  output  [ 15: 0] incoming_data_to_and_from_the_cfi_flash;
  output  [ 15: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  output           read_n_to_the_cfi_flash;
  output           registered_cpu_data_master_read_data_valid_cfi_flash_s1;
  output           select_n_to_the_cfi_flash;
  output           write_n_to_the_cfi_flash;
  input            clk;
  input   [ 25: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input            cpu_data_master_no_byte_enables_and_last_term;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 25: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input            cpu_instruction_master_read;
  input            reset_n;

  reg     [ 21: 0] address_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire    [  3: 0] cfi_flash_s1_counter_load_value;
  wire             cfi_flash_s1_in_a_read_cycle;
  wire             cfi_flash_s1_in_a_write_cycle;
  reg     [  3: 0] cfi_flash_s1_wait_counter;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             cfi_flash_s1_wait_counter_eq_1;
  wire             cfi_flash_s1_waits_for_read;
  wire             cfi_flash_s1_waits_for_write;
  wire             cfi_flash_s1_with_write_latency;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_cfi_flash_s1;
  wire    [  1: 0] cpu_data_master_byteenable_cfi_flash_s1_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_cfi_flash_s1_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cfi_flash_s1;
  wire             cpu_data_master_qualified_request_cfi_flash_s1;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1;
  reg     [  1: 0] cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             cpu_data_master_requests_cfi_flash_s1;
  wire             cpu_data_master_saved_grant_cfi_flash_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cfi_flash_s1;
  wire             cpu_instruction_master_qualified_request_cfi_flash_s1;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1;
  reg     [  1: 0] cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             cpu_instruction_master_requests_cfi_flash_s1;
  wire             cpu_instruction_master_saved_grant_cfi_flash_s1;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [ 15: 0] d1_outgoing_data_to_and_from_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  reg              d1_tristate_bridge_avalon_slave_end_xfer;
  wire    [ 15: 0] data_to_and_from_the_cfi_flash;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [ 15: 0] incoming_data_to_and_from_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_0_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_10_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_11_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_12_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_13_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_14_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_15_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_1_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_2_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_3_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_4_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_5_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_6_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_7_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_8_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_9_is_x;
  wire    [ 15: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  reg              last_cycle_cpu_data_master_granted_slave_cfi_flash_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1;
  wire    [ 15: 0] outgoing_data_to_and_from_the_cfi_flash;
  wire    [ 21: 0] p1_address_to_the_cfi_flash;
  wire    [  1: 0] p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire    [  1: 0] p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             p1_read_n_to_the_cfi_flash;
  wire             p1_select_n_to_the_cfi_flash;
  wire             p1_write_n_to_the_cfi_flash;
  reg              read_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             registered_cpu_data_master_read_data_valid_cfi_flash_s1;
  reg              select_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  wire             tristate_bridge_avalon_slave_allgrants;
  wire             tristate_bridge_avalon_slave_allow_new_arb_cycle;
  wire             tristate_bridge_avalon_slave_any_bursting_master_saved_grant;
  wire             tristate_bridge_avalon_slave_any_continuerequest;
  reg     [  1: 0] tristate_bridge_avalon_slave_arb_addend;
  wire             tristate_bridge_avalon_slave_arb_counter_enable;
  reg     [  1: 0] tristate_bridge_avalon_slave_arb_share_counter;
  wire    [  1: 0] tristate_bridge_avalon_slave_arb_share_counter_next_value;
  wire    [  1: 0] tristate_bridge_avalon_slave_arb_share_set_values;
  wire    [  1: 0] tristate_bridge_avalon_slave_arb_winner;
  wire             tristate_bridge_avalon_slave_arbitration_holdoff_internal;
  wire             tristate_bridge_avalon_slave_beginbursttransfer_internal;
  wire             tristate_bridge_avalon_slave_begins_xfer;
  wire    [  3: 0] tristate_bridge_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] tristate_bridge_avalon_slave_chosen_master_rot_left;
  wire             tristate_bridge_avalon_slave_end_xfer;
  wire             tristate_bridge_avalon_slave_firsttransfer;
  wire    [  1: 0] tristate_bridge_avalon_slave_grant_vector;
  wire    [  1: 0] tristate_bridge_avalon_slave_master_qreq_vector;
  wire             tristate_bridge_avalon_slave_non_bursting_master_requests;
  wire             tristate_bridge_avalon_slave_read_pending;
  reg              tristate_bridge_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] tristate_bridge_avalon_slave_saved_chosen_master_vector;
  reg              tristate_bridge_avalon_slave_slavearbiterlockenable;
  wire             tristate_bridge_avalon_slave_slavearbiterlockenable2;
  wire             tristate_bridge_avalon_slave_unreg_firsttransfer;
  wire             tristate_bridge_avalon_slave_write_pending;
  wire             wait_for_cfi_flash_s1_counter;
  reg              write_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~tristate_bridge_avalon_slave_end_xfer;
    end


  assign tristate_bridge_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cfi_flash_s1 | cpu_instruction_master_qualified_request_cfi_flash_s1));
  assign cpu_data_master_requests_cfi_flash_s1 = ({cpu_data_master_address_to_slave[25 : 22] , 22'b0} == 26'h2400000) & (cpu_data_master_read | cpu_data_master_write);
  //~select_n_to_the_cfi_flash of type chipselect to ~p1_select_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_cfi_flash <= ~0;
      else 
        select_n_to_the_cfi_flash <= p1_select_n_to_the_cfi_flash;
    end


  assign tristate_bridge_avalon_slave_write_pending = 0;
  //tristate_bridge/avalon_slave read pending calc, which is an e_assign
  assign tristate_bridge_avalon_slave_read_pending = 0;

  //registered rdv signal_name registered_cpu_data_master_read_data_valid_cfi_flash_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_cfi_flash_s1 = cpu_data_master_read_data_valid_cfi_flash_s1_shift_register[0];

  //tristate_bridge_avalon_slave_arb_share_counter set values, which is an e_mux
  assign tristate_bridge_avalon_slave_arb_share_set_values = (cpu_data_master_granted_cfi_flash_s1)? 2 :
    (cpu_instruction_master_granted_cfi_flash_s1)? 2 :
    (cpu_data_master_granted_cfi_flash_s1)? 2 :
    (cpu_instruction_master_granted_cfi_flash_s1)? 2 :
    1;

  //tristate_bridge_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign tristate_bridge_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_cfi_flash_s1 |
    cpu_instruction_master_requests_cfi_flash_s1 |
    cpu_data_master_requests_cfi_flash_s1 |
    cpu_instruction_master_requests_cfi_flash_s1;

  //tristate_bridge_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign tristate_bridge_avalon_slave_any_bursting_master_saved_grant = 0;

  //tristate_bridge_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign tristate_bridge_avalon_slave_arb_share_counter_next_value = tristate_bridge_avalon_slave_firsttransfer ? (tristate_bridge_avalon_slave_arb_share_set_values - 1) : |tristate_bridge_avalon_slave_arb_share_counter ? (tristate_bridge_avalon_slave_arb_share_counter - 1) : 0;

  //tristate_bridge_avalon_slave_allgrants all slave grants, which is an e_mux
  assign tristate_bridge_avalon_slave_allgrants = (|tristate_bridge_avalon_slave_grant_vector) |
    (|tristate_bridge_avalon_slave_grant_vector) |
    (|tristate_bridge_avalon_slave_grant_vector) |
    (|tristate_bridge_avalon_slave_grant_vector);

  //tristate_bridge_avalon_slave_end_xfer assignment, which is an e_assign
  assign tristate_bridge_avalon_slave_end_xfer = ~(cfi_flash_s1_waits_for_read | cfi_flash_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave = tristate_bridge_avalon_slave_end_xfer & (~tristate_bridge_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tristate_bridge_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tristate_bridge_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave & tristate_bridge_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave & ~tristate_bridge_avalon_slave_non_bursting_master_requests);

  //tristate_bridge_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_arb_share_counter <= 0;
      else if (tristate_bridge_avalon_slave_arb_counter_enable)
          tristate_bridge_avalon_slave_arb_share_counter <= tristate_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //tristate_bridge_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|tristate_bridge_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave) | (end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave & ~tristate_bridge_avalon_slave_non_bursting_master_requests))
          tristate_bridge_avalon_slave_slavearbiterlockenable <= |tristate_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //cpu/data_master tristate_bridge/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = tristate_bridge_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //tristate_bridge_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tristate_bridge_avalon_slave_slavearbiterlockenable2 = |tristate_bridge_avalon_slave_arb_share_counter_next_value;

  //cpu/data_master tristate_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = tristate_bridge_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master tristate_bridge/avalon_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = tristate_bridge_avalon_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master tristate_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = tristate_bridge_avalon_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 <= cpu_instruction_master_saved_grant_cfi_flash_s1 ? 1 : (tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cfi_flash_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 & cpu_instruction_master_requests_cfi_flash_s1;

  //tristate_bridge_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign tristate_bridge_avalon_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cfi_flash_s1 = cpu_data_master_requests_cfi_flash_s1 & ~((cpu_data_master_read & (tristate_bridge_avalon_slave_write_pending | (tristate_bridge_avalon_slave_read_pending) | (|cpu_data_master_read_data_valid_cfi_flash_s1_shift_register))) | ((tristate_bridge_avalon_slave_read_pending | cpu_data_master_no_byte_enables_and_last_term | !cpu_data_master_byteenable_cfi_flash_s1) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in = cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read & ~cfi_flash_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_cfi_flash_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register = {cpu_data_master_read_data_valid_cfi_flash_s1_shift_register, cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //cpu_data_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_cfi_flash_s1_shift_register <= p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_cfi_flash_s1 = cpu_data_master_read_data_valid_cfi_flash_s1_shift_register[1];

  //data_to_and_from_the_cfi_flash register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_data_to_and_from_the_cfi_flash <= 0;
      else 
        incoming_data_to_and_from_the_cfi_flash <= data_to_and_from_the_cfi_flash;
    end


  //cfi_flash_s1_with_write_latency assignment, which is an e_assign
  assign cfi_flash_s1_with_write_latency = in_a_write_cycle & (cpu_data_master_qualified_request_cfi_flash_s1 | cpu_instruction_master_qualified_request_cfi_flash_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (cfi_flash_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_data_to_and_from_the_cfi_flash register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_data_to_and_from_the_cfi_flash <= 0;
      else 
        d1_outgoing_data_to_and_from_the_cfi_flash <= outgoing_data_to_and_from_the_cfi_flash;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_data_to_and_from_the_cfi_flash tristate driver, which is an e_assign
  assign data_to_and_from_the_cfi_flash = (d1_in_a_write_cycle)? d1_outgoing_data_to_and_from_the_cfi_flash:{16{1'bz}};

  //outgoing_data_to_and_from_the_cfi_flash mux, which is an e_mux
  assign outgoing_data_to_and_from_the_cfi_flash = cpu_data_master_dbs_write_16;

  assign cpu_instruction_master_requests_cfi_flash_s1 = (({cpu_instruction_master_address_to_slave[25 : 22] , 22'b0} == 26'h2400000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 <= cpu_data_master_saved_grant_cfi_flash_s1 ? 1 : (tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_cfi_flash_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_cfi_flash_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 & cpu_data_master_requests_cfi_flash_s1;

  assign cpu_instruction_master_qualified_request_cfi_flash_s1 = cpu_instruction_master_requests_cfi_flash_s1 & ~((cpu_instruction_master_read & (tristate_bridge_avalon_slave_write_pending | (tristate_bridge_avalon_slave_read_pending) | (|cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in = cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read & ~cfi_flash_s1_waits_for_read & ~(|cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register);

  //shift register p1 cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register = {cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register, cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cfi_flash_s1 = cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register[1];

  //allow new arb cycle for tristate_bridge/avalon_slave, which is an e_assign
  assign tristate_bridge_avalon_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tristate_bridge_avalon_slave_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cfi_flash_s1;

  //cpu/instruction_master grant cfi_flash/s1, which is an e_assign
  assign cpu_instruction_master_granted_cfi_flash_s1 = tristate_bridge_avalon_slave_grant_vector[0];

  //cpu/instruction_master saved-grant cfi_flash/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_cfi_flash_s1 = tristate_bridge_avalon_slave_arb_winner[0] && cpu_instruction_master_requests_cfi_flash_s1;

  //cpu/data_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tristate_bridge_avalon_slave_master_qreq_vector[1] = cpu_data_master_qualified_request_cfi_flash_s1;

  //cpu/data_master grant cfi_flash/s1, which is an e_assign
  assign cpu_data_master_granted_cfi_flash_s1 = tristate_bridge_avalon_slave_grant_vector[1];

  //cpu/data_master saved-grant cfi_flash/s1, which is an e_assign
  assign cpu_data_master_saved_grant_cfi_flash_s1 = tristate_bridge_avalon_slave_arb_winner[1] && cpu_data_master_requests_cfi_flash_s1;

  //tristate_bridge/avalon_slave chosen-master double-vector, which is an e_assign
  assign tristate_bridge_avalon_slave_chosen_master_double_vector = {tristate_bridge_avalon_slave_master_qreq_vector, tristate_bridge_avalon_slave_master_qreq_vector} & ({~tristate_bridge_avalon_slave_master_qreq_vector, ~tristate_bridge_avalon_slave_master_qreq_vector} + tristate_bridge_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign tristate_bridge_avalon_slave_arb_winner = (tristate_bridge_avalon_slave_allow_new_arb_cycle & | tristate_bridge_avalon_slave_grant_vector) ? tristate_bridge_avalon_slave_grant_vector : tristate_bridge_avalon_slave_saved_chosen_master_vector;

  //saved tristate_bridge_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_saved_chosen_master_vector <= 0;
      else if (tristate_bridge_avalon_slave_allow_new_arb_cycle)
          tristate_bridge_avalon_slave_saved_chosen_master_vector <= |tristate_bridge_avalon_slave_grant_vector ? tristate_bridge_avalon_slave_grant_vector : tristate_bridge_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign tristate_bridge_avalon_slave_grant_vector = {(tristate_bridge_avalon_slave_chosen_master_double_vector[1] | tristate_bridge_avalon_slave_chosen_master_double_vector[3]),
    (tristate_bridge_avalon_slave_chosen_master_double_vector[0] | tristate_bridge_avalon_slave_chosen_master_double_vector[2])};

  //tristate_bridge/avalon_slave chosen master rotated left, which is an e_assign
  assign tristate_bridge_avalon_slave_chosen_master_rot_left = (tristate_bridge_avalon_slave_arb_winner << 1) ? (tristate_bridge_avalon_slave_arb_winner << 1) : 1;

  //tristate_bridge/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_arb_addend <= 1;
      else if (|tristate_bridge_avalon_slave_grant_vector)
          tristate_bridge_avalon_slave_arb_addend <= tristate_bridge_avalon_slave_end_xfer? tristate_bridge_avalon_slave_chosen_master_rot_left : tristate_bridge_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_cfi_flash = ~(cpu_data_master_granted_cfi_flash_s1 | cpu_instruction_master_granted_cfi_flash_s1);
  //tristate_bridge_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign tristate_bridge_avalon_slave_firsttransfer = tristate_bridge_avalon_slave_begins_xfer ? tristate_bridge_avalon_slave_unreg_firsttransfer : tristate_bridge_avalon_slave_reg_firsttransfer;

  //tristate_bridge_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign tristate_bridge_avalon_slave_unreg_firsttransfer = ~(tristate_bridge_avalon_slave_slavearbiterlockenable & tristate_bridge_avalon_slave_any_continuerequest);

  //tristate_bridge_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (tristate_bridge_avalon_slave_begins_xfer)
          tristate_bridge_avalon_slave_reg_firsttransfer <= tristate_bridge_avalon_slave_unreg_firsttransfer;
    end


  //tristate_bridge_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tristate_bridge_avalon_slave_beginbursttransfer_internal = tristate_bridge_avalon_slave_begins_xfer;

  //tristate_bridge_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign tristate_bridge_avalon_slave_arbitration_holdoff_internal = tristate_bridge_avalon_slave_begins_xfer & tristate_bridge_avalon_slave_firsttransfer;

  //~read_n_to_the_cfi_flash of type read to ~p1_read_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          read_n_to_the_cfi_flash <= ~0;
      else 
        read_n_to_the_cfi_flash <= p1_read_n_to_the_cfi_flash;
    end


  //~p1_read_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_read_n_to_the_cfi_flash = ~(((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read))& ~tristate_bridge_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter < 5));

  //~write_n_to_the_cfi_flash of type write to ~p1_write_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_cfi_flash <= ~0;
      else 
        write_n_to_the_cfi_flash <= p1_write_n_to_the_cfi_flash;
    end


  //~p1_write_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_write_n_to_the_cfi_flash = ~(((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write)) & ~tristate_bridge_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter >= 3) & (cfi_flash_s1_wait_counter < 8));

  //address_to_the_cfi_flash of type address to p1_address_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          address_to_the_cfi_flash <= 0;
      else 
        address_to_the_cfi_flash <= p1_address_to_the_cfi_flash;
    end


  //p1_address_to_the_cfi_flash mux, which is an e_mux
  assign p1_address_to_the_cfi_flash = (cpu_data_master_granted_cfi_flash_s1)? ({cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}}) :
    ({cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}});

  //d1_tristate_bridge_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tristate_bridge_avalon_slave_end_xfer <= 1;
      else 
        d1_tristate_bridge_avalon_slave_end_xfer <= tristate_bridge_avalon_slave_end_xfer;
    end


  //cfi_flash_s1_wait_counter_eq_1 assignment, which is an e_assign
  assign cfi_flash_s1_wait_counter_eq_1 = cfi_flash_s1_wait_counter == 1;

  //cfi_flash_s1_waits_for_read in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_read = cfi_flash_s1_in_a_read_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_read_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_read_cycle = (cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cfi_flash_s1_in_a_read_cycle;

  //cfi_flash_s1_waits_for_write in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_write = cfi_flash_s1_in_a_write_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_write_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_write_cycle = cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cfi_flash_s1_in_a_write_cycle;

  assign cfi_flash_s1_wait_counter_eq_0 = cfi_flash_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cfi_flash_s1_wait_counter <= 0;
      else 
        cfi_flash_s1_wait_counter <= cfi_flash_s1_counter_load_value;
    end


  assign cfi_flash_s1_counter_load_value = ((cfi_flash_s1_in_a_read_cycle & tristate_bridge_avalon_slave_begins_xfer))? 6 :
    ((cfi_flash_s1_in_a_write_cycle & tristate_bridge_avalon_slave_begins_xfer))? 9 :
    (~cfi_flash_s1_wait_counter_eq_0)? cfi_flash_s1_wait_counter - 1 :
    0;

  assign wait_for_cfi_flash_s1_counter = tristate_bridge_avalon_slave_begins_xfer | ~cfi_flash_s1_wait_counter_eq_0;
  assign {cpu_data_master_byteenable_cfi_flash_s1_segment_1,
cpu_data_master_byteenable_cfi_flash_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_cfi_flash_s1 = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_cfi_flash_s1_segment_0 :
    cpu_data_master_byteenable_cfi_flash_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_data_to_and_from_the_cfi_flash_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_0_is_x = ^(incoming_data_to_and_from_the_cfi_flash[0]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[0] = incoming_data_to_and_from_the_cfi_flash_bit_0_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[0];

  //incoming_data_to_and_from_the_cfi_flash_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_1_is_x = ^(incoming_data_to_and_from_the_cfi_flash[1]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[1] = incoming_data_to_and_from_the_cfi_flash_bit_1_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[1];

  //incoming_data_to_and_from_the_cfi_flash_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_2_is_x = ^(incoming_data_to_and_from_the_cfi_flash[2]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[2] = incoming_data_to_and_from_the_cfi_flash_bit_2_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[2];

  //incoming_data_to_and_from_the_cfi_flash_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_3_is_x = ^(incoming_data_to_and_from_the_cfi_flash[3]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[3] = incoming_data_to_and_from_the_cfi_flash_bit_3_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[3];

  //incoming_data_to_and_from_the_cfi_flash_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_4_is_x = ^(incoming_data_to_and_from_the_cfi_flash[4]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[4] = incoming_data_to_and_from_the_cfi_flash_bit_4_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[4];

  //incoming_data_to_and_from_the_cfi_flash_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_5_is_x = ^(incoming_data_to_and_from_the_cfi_flash[5]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[5] = incoming_data_to_and_from_the_cfi_flash_bit_5_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[5];

  //incoming_data_to_and_from_the_cfi_flash_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_6_is_x = ^(incoming_data_to_and_from_the_cfi_flash[6]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[6] = incoming_data_to_and_from_the_cfi_flash_bit_6_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[6];

  //incoming_data_to_and_from_the_cfi_flash_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_7_is_x = ^(incoming_data_to_and_from_the_cfi_flash[7]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[7] = incoming_data_to_and_from_the_cfi_flash_bit_7_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[7];

  //incoming_data_to_and_from_the_cfi_flash_bit_8_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_8_is_x = ^(incoming_data_to_and_from_the_cfi_flash[8]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[8] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[8] = incoming_data_to_and_from_the_cfi_flash_bit_8_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[8];

  //incoming_data_to_and_from_the_cfi_flash_bit_9_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_9_is_x = ^(incoming_data_to_and_from_the_cfi_flash[9]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[9] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[9] = incoming_data_to_and_from_the_cfi_flash_bit_9_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[9];

  //incoming_data_to_and_from_the_cfi_flash_bit_10_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_10_is_x = ^(incoming_data_to_and_from_the_cfi_flash[10]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[10] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[10] = incoming_data_to_and_from_the_cfi_flash_bit_10_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[10];

  //incoming_data_to_and_from_the_cfi_flash_bit_11_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_11_is_x = ^(incoming_data_to_and_from_the_cfi_flash[11]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[11] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[11] = incoming_data_to_and_from_the_cfi_flash_bit_11_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[11];

  //incoming_data_to_and_from_the_cfi_flash_bit_12_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_12_is_x = ^(incoming_data_to_and_from_the_cfi_flash[12]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[12] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[12] = incoming_data_to_and_from_the_cfi_flash_bit_12_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[12];

  //incoming_data_to_and_from_the_cfi_flash_bit_13_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_13_is_x = ^(incoming_data_to_and_from_the_cfi_flash[13]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[13] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[13] = incoming_data_to_and_from_the_cfi_flash_bit_13_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[13];

  //incoming_data_to_and_from_the_cfi_flash_bit_14_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_14_is_x = ^(incoming_data_to_and_from_the_cfi_flash[14]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[14] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[14] = incoming_data_to_and_from_the_cfi_flash_bit_14_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[14];

  //incoming_data_to_and_from_the_cfi_flash_bit_15_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_15_is_x = ^(incoming_data_to_and_from_the_cfi_flash[15]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[15] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[15] = incoming_data_to_and_from_the_cfi_flash_bit_15_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[15];

  //cfi_flash/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cfi_flash_s1 + cpu_instruction_master_granted_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cfi_flash_s1 + cpu_instruction_master_saved_grant_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0 = incoming_data_to_and_from_the_cfi_flash;
//
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tristate_bridge_bridge_arbitrator 
;



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uart_s1_arbitrator (
                            // inputs:
                             clk,
                             clock_crossing_bridge_m1_address_to_slave,
                             clock_crossing_bridge_m1_latency_counter,
                             clock_crossing_bridge_m1_nativeaddress,
                             clock_crossing_bridge_m1_read,
                             clock_crossing_bridge_m1_write,
                             clock_crossing_bridge_m1_writedata,
                             reset_n,
                             uart_s1_dataavailable,
                             uart_s1_irq,
                             uart_s1_readdata,
                             uart_s1_readyfordata,

                            // outputs:
                             clock_crossing_bridge_m1_granted_uart_s1,
                             clock_crossing_bridge_m1_qualified_request_uart_s1,
                             clock_crossing_bridge_m1_read_data_valid_uart_s1,
                             clock_crossing_bridge_m1_requests_uart_s1,
                             d1_uart_s1_end_xfer,
                             uart_s1_address,
                             uart_s1_begintransfer,
                             uart_s1_chipselect,
                             uart_s1_dataavailable_from_sa,
                             uart_s1_irq_from_sa,
                             uart_s1_read_n,
                             uart_s1_readdata_from_sa,
                             uart_s1_readyfordata_from_sa,
                             uart_s1_reset_n,
                             uart_s1_write_n,
                             uart_s1_writedata
                          )
;

  output           clock_crossing_bridge_m1_granted_uart_s1;
  output           clock_crossing_bridge_m1_qualified_request_uart_s1;
  output           clock_crossing_bridge_m1_read_data_valid_uart_s1;
  output           clock_crossing_bridge_m1_requests_uart_s1;
  output           d1_uart_s1_end_xfer;
  output  [  2: 0] uart_s1_address;
  output           uart_s1_begintransfer;
  output           uart_s1_chipselect;
  output           uart_s1_dataavailable_from_sa;
  output           uart_s1_irq_from_sa;
  output           uart_s1_read_n;
  output  [ 15: 0] uart_s1_readdata_from_sa;
  output           uart_s1_readyfordata_from_sa;
  output           uart_s1_reset_n;
  output           uart_s1_write_n;
  output  [ 15: 0] uart_s1_writedata;
  input            clk;
  input   [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  input            clock_crossing_bridge_m1_latency_counter;
  input   [  8: 0] clock_crossing_bridge_m1_nativeaddress;
  input            clock_crossing_bridge_m1_read;
  input            clock_crossing_bridge_m1_write;
  input   [ 31: 0] clock_crossing_bridge_m1_writedata;
  input            reset_n;
  input            uart_s1_dataavailable;
  input            uart_s1_irq;
  input   [ 15: 0] uart_s1_readdata;
  input            uart_s1_readyfordata;

  wire             clock_crossing_bridge_m1_arbiterlock;
  wire             clock_crossing_bridge_m1_arbiterlock2;
  wire             clock_crossing_bridge_m1_continuerequest;
  wire             clock_crossing_bridge_m1_granted_uart_s1;
  wire             clock_crossing_bridge_m1_qualified_request_uart_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_uart_s1;
  wire             clock_crossing_bridge_m1_requests_uart_s1;
  wire             clock_crossing_bridge_m1_saved_grant_uart_s1;
  reg              d1_reasons_to_wait;
  reg              d1_uart_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_uart_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] uart_s1_address;
  wire             uart_s1_allgrants;
  wire             uart_s1_allow_new_arb_cycle;
  wire             uart_s1_any_bursting_master_saved_grant;
  wire             uart_s1_any_continuerequest;
  wire             uart_s1_arb_counter_enable;
  reg              uart_s1_arb_share_counter;
  wire             uart_s1_arb_share_counter_next_value;
  wire             uart_s1_arb_share_set_values;
  wire             uart_s1_beginbursttransfer_internal;
  wire             uart_s1_begins_xfer;
  wire             uart_s1_begintransfer;
  wire             uart_s1_chipselect;
  wire             uart_s1_dataavailable_from_sa;
  wire             uart_s1_end_xfer;
  wire             uart_s1_firsttransfer;
  wire             uart_s1_grant_vector;
  wire             uart_s1_in_a_read_cycle;
  wire             uart_s1_in_a_write_cycle;
  wire             uart_s1_irq_from_sa;
  wire             uart_s1_master_qreq_vector;
  wire             uart_s1_non_bursting_master_requests;
  wire             uart_s1_read_n;
  wire    [ 15: 0] uart_s1_readdata_from_sa;
  wire             uart_s1_readyfordata_from_sa;
  reg              uart_s1_reg_firsttransfer;
  wire             uart_s1_reset_n;
  reg              uart_s1_slavearbiterlockenable;
  wire             uart_s1_slavearbiterlockenable2;
  wire             uart_s1_unreg_firsttransfer;
  wire             uart_s1_waits_for_read;
  wire             uart_s1_waits_for_write;
  wire             uart_s1_write_n;
  wire    [ 15: 0] uart_s1_writedata;
  wire             wait_for_uart_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~uart_s1_end_xfer;
    end


  assign uart_s1_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_bridge_m1_qualified_request_uart_s1));
  //assign uart_s1_readdata_from_sa = uart_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_s1_readdata_from_sa = uart_s1_readdata;

  assign clock_crossing_bridge_m1_requests_uart_s1 = ({clock_crossing_bridge_m1_address_to_slave[10 : 5] , 5'b0} == 11'h420) & (clock_crossing_bridge_m1_read | clock_crossing_bridge_m1_write);
  //assign uart_s1_dataavailable_from_sa = uart_s1_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_s1_dataavailable_from_sa = uart_s1_dataavailable;

  //assign uart_s1_readyfordata_from_sa = uart_s1_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_s1_readyfordata_from_sa = uart_s1_readyfordata;

  //uart_s1_arb_share_counter set values, which is an e_mux
  assign uart_s1_arb_share_set_values = 1;

  //uart_s1_non_bursting_master_requests mux, which is an e_mux
  assign uart_s1_non_bursting_master_requests = clock_crossing_bridge_m1_requests_uart_s1;

  //uart_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign uart_s1_any_bursting_master_saved_grant = 0;

  //uart_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign uart_s1_arb_share_counter_next_value = uart_s1_firsttransfer ? (uart_s1_arb_share_set_values - 1) : |uart_s1_arb_share_counter ? (uart_s1_arb_share_counter - 1) : 0;

  //uart_s1_allgrants all slave grants, which is an e_mux
  assign uart_s1_allgrants = |uart_s1_grant_vector;

  //uart_s1_end_xfer assignment, which is an e_assign
  assign uart_s1_end_xfer = ~(uart_s1_waits_for_read | uart_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_uart_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_uart_s1 = uart_s1_end_xfer & (~uart_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //uart_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign uart_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_uart_s1 & uart_s1_allgrants) | (end_xfer_arb_share_counter_term_uart_s1 & ~uart_s1_non_bursting_master_requests);

  //uart_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart_s1_arb_share_counter <= 0;
      else if (uart_s1_arb_counter_enable)
          uart_s1_arb_share_counter <= uart_s1_arb_share_counter_next_value;
    end


  //uart_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart_s1_slavearbiterlockenable <= 0;
      else if ((|uart_s1_master_qreq_vector & end_xfer_arb_share_counter_term_uart_s1) | (end_xfer_arb_share_counter_term_uart_s1 & ~uart_s1_non_bursting_master_requests))
          uart_s1_slavearbiterlockenable <= |uart_s1_arb_share_counter_next_value;
    end


  //clock_crossing_bridge/m1 uart/s1 arbiterlock, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock = uart_s1_slavearbiterlockenable & clock_crossing_bridge_m1_continuerequest;

  //uart_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign uart_s1_slavearbiterlockenable2 = |uart_s1_arb_share_counter_next_value;

  //clock_crossing_bridge/m1 uart/s1 arbiterlock2, which is an e_assign
  assign clock_crossing_bridge_m1_arbiterlock2 = uart_s1_slavearbiterlockenable2 & clock_crossing_bridge_m1_continuerequest;

  //uart_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign uart_s1_any_continuerequest = 1;

  //clock_crossing_bridge_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_bridge_m1_continuerequest = 1;

  assign clock_crossing_bridge_m1_qualified_request_uart_s1 = clock_crossing_bridge_m1_requests_uart_s1 & ~((clock_crossing_bridge_m1_read & ((clock_crossing_bridge_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_bridge_m1_read_data_valid_uart_s1, which is an e_mux
  assign clock_crossing_bridge_m1_read_data_valid_uart_s1 = clock_crossing_bridge_m1_granted_uart_s1 & clock_crossing_bridge_m1_read & ~uart_s1_waits_for_read;

  //uart_s1_writedata mux, which is an e_mux
  assign uart_s1_writedata = clock_crossing_bridge_m1_writedata;

  //master is always granted when requested
  assign clock_crossing_bridge_m1_granted_uart_s1 = clock_crossing_bridge_m1_qualified_request_uart_s1;

  //clock_crossing_bridge/m1 saved-grant uart/s1, which is an e_assign
  assign clock_crossing_bridge_m1_saved_grant_uart_s1 = clock_crossing_bridge_m1_requests_uart_s1;

  //allow new arb cycle for uart/s1, which is an e_assign
  assign uart_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign uart_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign uart_s1_master_qreq_vector = 1;

  assign uart_s1_begintransfer = uart_s1_begins_xfer;
  //uart_s1_reset_n assignment, which is an e_assign
  assign uart_s1_reset_n = reset_n;

  assign uart_s1_chipselect = clock_crossing_bridge_m1_granted_uart_s1;
  //uart_s1_firsttransfer first transaction, which is an e_assign
  assign uart_s1_firsttransfer = uart_s1_begins_xfer ? uart_s1_unreg_firsttransfer : uart_s1_reg_firsttransfer;

  //uart_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign uart_s1_unreg_firsttransfer = ~(uart_s1_slavearbiterlockenable & uart_s1_any_continuerequest);

  //uart_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart_s1_reg_firsttransfer <= 1'b1;
      else if (uart_s1_begins_xfer)
          uart_s1_reg_firsttransfer <= uart_s1_unreg_firsttransfer;
    end


  //uart_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign uart_s1_beginbursttransfer_internal = uart_s1_begins_xfer;

  //~uart_s1_read_n assignment, which is an e_mux
  assign uart_s1_read_n = ~(clock_crossing_bridge_m1_granted_uart_s1 & clock_crossing_bridge_m1_read);

  //~uart_s1_write_n assignment, which is an e_mux
  assign uart_s1_write_n = ~(clock_crossing_bridge_m1_granted_uart_s1 & clock_crossing_bridge_m1_write);

  //uart_s1_address mux, which is an e_mux
  assign uart_s1_address = clock_crossing_bridge_m1_nativeaddress;

  //d1_uart_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_uart_s1_end_xfer <= 1;
      else 
        d1_uart_s1_end_xfer <= uart_s1_end_xfer;
    end


  //uart_s1_waits_for_read in a cycle, which is an e_mux
  assign uart_s1_waits_for_read = uart_s1_in_a_read_cycle & uart_s1_begins_xfer;

  //uart_s1_in_a_read_cycle assignment, which is an e_assign
  assign uart_s1_in_a_read_cycle = clock_crossing_bridge_m1_granted_uart_s1 & clock_crossing_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = uart_s1_in_a_read_cycle;

  //uart_s1_waits_for_write in a cycle, which is an e_mux
  assign uart_s1_waits_for_write = uart_s1_in_a_write_cycle & uart_s1_begins_xfer;

  //uart_s1_in_a_write_cycle assignment, which is an e_assign
  assign uart_s1_in_a_write_cycle = clock_crossing_bridge_m1_granted_uart_s1 & clock_crossing_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = uart_s1_in_a_write_cycle;

  assign wait_for_uart_s1_counter = 0;
  //assign uart_s1_irq_from_sa = uart_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_s1_irq_from_sa = uart_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //uart/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_reset_pll_cpu_domain_synch_module (
                                                    // inputs:
                                                     clk,
                                                     data_in,
                                                     reset_n,

                                                    // outputs:
                                                     data_out
                                                  )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_reset_pll_io_domain_synch_module (
                                                   // inputs:
                                                    clk,
                                                    data_in,
                                                    reset_n,

                                                   // outputs:
                                                    data_out
                                                 )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC_reset_clk_domain_synch_module (
                                                // inputs:
                                                 clk,
                                                 data_in,
                                                 reset_n,

                                                // outputs:
                                                 data_out
                                              )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module DE0_SOPC (
                  // 1) global signals:
                   clk,
                   pll_cpu,
                   pll_io,
                   pll_sdram,
                   pll_vga,
                   reset_n,

                  // the_SD_CARD_Interface
                   b_SD_cmd_to_and_from_the_SD_CARD_Interface,
                   b_SD_dat3_to_and_from_the_SD_CARD_Interface,
                   b_SD_dat_to_and_from_the_SD_CARD_Interface,
                   o_SD_clock_from_the_SD_CARD_Interface,

                  // the_buttons
                   in_port_to_the_buttons,

                  // the_lcd
                   LCD_E_from_the_lcd,
                   LCD_RS_from_the_lcd,
                   LCD_RW_from_the_lcd,
                   LCD_data_to_and_from_the_lcd,

                  // the_lcd_light
                   out_port_from_the_lcd_light,

                  // the_leds
                   out_port_from_the_leds,

                  // the_sdram
                   zs_addr_from_the_sdram,
                   zs_ba_from_the_sdram,
                   zs_cas_n_from_the_sdram,
                   zs_cke_from_the_sdram,
                   zs_cs_n_from_the_sdram,
                   zs_dq_to_and_from_the_sdram,
                   zs_dqm_from_the_sdram,
                   zs_ras_n_from_the_sdram,
                   zs_we_n_from_the_sdram,

                  // the_seg7
                   out_port_from_the_seg7,

                  // the_switches
                   in_port_to_the_switches,

                  // the_tristate_bridge_avalon_slave
                   address_to_the_cfi_flash,
                   data_to_and_from_the_cfi_flash,
                   read_n_to_the_cfi_flash,
                   select_n_to_the_cfi_flash,
                   write_n_to_the_cfi_flash,

                  // the_uart
                   rxd_to_the_uart,
                   txd_from_the_uart
                )
;

  output           LCD_E_from_the_lcd;
  output           LCD_RS_from_the_lcd;
  output           LCD_RW_from_the_lcd;
  inout   [  7: 0] LCD_data_to_and_from_the_lcd;
  output  [ 21: 0] address_to_the_cfi_flash;
  inout            b_SD_cmd_to_and_from_the_SD_CARD_Interface;
  inout            b_SD_dat3_to_and_from_the_SD_CARD_Interface;
  inout            b_SD_dat_to_and_from_the_SD_CARD_Interface;
  inout   [ 15: 0] data_to_and_from_the_cfi_flash;
  output           o_SD_clock_from_the_SD_CARD_Interface;
  output           out_port_from_the_lcd_light;
  output  [  9: 0] out_port_from_the_leds;
  output  [ 31: 0] out_port_from_the_seg7;
  output           pll_cpu;
  output           pll_io;
  output           pll_sdram;
  output           pll_vga;
  output           read_n_to_the_cfi_flash;
  output           select_n_to_the_cfi_flash;
  output           txd_from_the_uart;
  output           write_n_to_the_cfi_flash;
  output  [ 11: 0] zs_addr_from_the_sdram;
  output  [  1: 0] zs_ba_from_the_sdram;
  output           zs_cas_n_from_the_sdram;
  output           zs_cke_from_the_sdram;
  output           zs_cs_n_from_the_sdram;
  inout   [ 15: 0] zs_dq_to_and_from_the_sdram;
  output  [  1: 0] zs_dqm_from_the_sdram;
  output           zs_ras_n_from_the_sdram;
  output           zs_we_n_from_the_sdram;
  input            clk;
  input   [  2: 0] in_port_to_the_buttons;
  input   [  9: 0] in_port_to_the_switches;
  input            reset_n;
  input            rxd_to_the_uart;

  wire    [  3: 0] DE0_SOPC_clock_0_in_address;
  wire    [  1: 0] DE0_SOPC_clock_0_in_byteenable;
  wire             DE0_SOPC_clock_0_in_endofpacket;
  wire             DE0_SOPC_clock_0_in_endofpacket_from_sa;
  wire    [  2: 0] DE0_SOPC_clock_0_in_nativeaddress;
  wire             DE0_SOPC_clock_0_in_read;
  wire    [ 15: 0] DE0_SOPC_clock_0_in_readdata;
  wire    [ 15: 0] DE0_SOPC_clock_0_in_readdata_from_sa;
  wire             DE0_SOPC_clock_0_in_reset_n;
  wire             DE0_SOPC_clock_0_in_waitrequest;
  wire             DE0_SOPC_clock_0_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_0_in_write;
  wire    [ 15: 0] DE0_SOPC_clock_0_in_writedata;
  wire    [  3: 0] DE0_SOPC_clock_0_out_address;
  wire    [  3: 0] DE0_SOPC_clock_0_out_address_to_slave;
  wire    [  1: 0] DE0_SOPC_clock_0_out_byteenable;
  wire             DE0_SOPC_clock_0_out_endofpacket;
  wire             DE0_SOPC_clock_0_out_granted_pll_s1;
  wire    [  2: 0] DE0_SOPC_clock_0_out_nativeaddress;
  wire             DE0_SOPC_clock_0_out_qualified_request_pll_s1;
  wire             DE0_SOPC_clock_0_out_read;
  wire             DE0_SOPC_clock_0_out_read_data_valid_pll_s1;
  wire    [ 15: 0] DE0_SOPC_clock_0_out_readdata;
  wire             DE0_SOPC_clock_0_out_requests_pll_s1;
  wire             DE0_SOPC_clock_0_out_reset_n;
  wire             DE0_SOPC_clock_0_out_waitrequest;
  wire             DE0_SOPC_clock_0_out_write;
  wire    [ 15: 0] DE0_SOPC_clock_0_out_writedata;
  wire    [  3: 0] DE0_SOPC_clock_1_in_address;
  wire    [  1: 0] DE0_SOPC_clock_1_in_byteenable;
  wire             DE0_SOPC_clock_1_in_endofpacket;
  wire             DE0_SOPC_clock_1_in_endofpacket_from_sa;
  wire    [  2: 0] DE0_SOPC_clock_1_in_nativeaddress;
  wire             DE0_SOPC_clock_1_in_read;
  wire    [ 15: 0] DE0_SOPC_clock_1_in_readdata;
  wire    [ 15: 0] DE0_SOPC_clock_1_in_readdata_from_sa;
  wire             DE0_SOPC_clock_1_in_reset_n;
  wire             DE0_SOPC_clock_1_in_waitrequest;
  wire             DE0_SOPC_clock_1_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_1_in_write;
  wire    [ 15: 0] DE0_SOPC_clock_1_in_writedata;
  wire    [  3: 0] DE0_SOPC_clock_1_out_address;
  wire    [  3: 0] DE0_SOPC_clock_1_out_address_to_slave;
  wire    [  1: 0] DE0_SOPC_clock_1_out_byteenable;
  wire             DE0_SOPC_clock_1_out_endofpacket;
  wire             DE0_SOPC_clock_1_out_granted_timer_0_s1;
  wire    [  2: 0] DE0_SOPC_clock_1_out_nativeaddress;
  wire             DE0_SOPC_clock_1_out_qualified_request_timer_0_s1;
  wire             DE0_SOPC_clock_1_out_read;
  wire             DE0_SOPC_clock_1_out_read_data_valid_timer_0_s1;
  wire    [ 15: 0] DE0_SOPC_clock_1_out_readdata;
  wire             DE0_SOPC_clock_1_out_requests_timer_0_s1;
  wire             DE0_SOPC_clock_1_out_reset_n;
  wire             DE0_SOPC_clock_1_out_waitrequest;
  wire             DE0_SOPC_clock_1_out_write;
  wire    [ 15: 0] DE0_SOPC_clock_1_out_writedata;
  wire    [  9: 0] DE0_SOPC_clock_2_in_address;
  wire    [  3: 0] DE0_SOPC_clock_2_in_byteenable;
  wire             DE0_SOPC_clock_2_in_endofpacket;
  wire             DE0_SOPC_clock_2_in_endofpacket_from_sa;
  wire    [  7: 0] DE0_SOPC_clock_2_in_nativeaddress;
  wire             DE0_SOPC_clock_2_in_read;
  wire    [ 31: 0] DE0_SOPC_clock_2_in_readdata;
  wire    [ 31: 0] DE0_SOPC_clock_2_in_readdata_from_sa;
  wire             DE0_SOPC_clock_2_in_reset_n;
  wire             DE0_SOPC_clock_2_in_waitrequest;
  wire             DE0_SOPC_clock_2_in_waitrequest_from_sa;
  wire             DE0_SOPC_clock_2_in_write;
  wire    [ 31: 0] DE0_SOPC_clock_2_in_writedata;
  wire    [  9: 0] DE0_SOPC_clock_2_out_address;
  wire    [  9: 0] DE0_SOPC_clock_2_out_address_to_slave;
  wire    [  3: 0] DE0_SOPC_clock_2_out_byteenable;
  wire             DE0_SOPC_clock_2_out_endofpacket;
  wire             DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave;
  wire    [  7: 0] DE0_SOPC_clock_2_out_nativeaddress;
  wire             DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave;
  wire             DE0_SOPC_clock_2_out_read;
  wire             DE0_SOPC_clock_2_out_read_data_valid_SD_CARD_Interface_avalon_slave;
  wire    [ 31: 0] DE0_SOPC_clock_2_out_readdata;
  wire             DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave;
  wire             DE0_SOPC_clock_2_out_reset_n;
  wire             DE0_SOPC_clock_2_out_waitrequest;
  wire             DE0_SOPC_clock_2_out_write;
  wire    [ 31: 0] DE0_SOPC_clock_2_out_writedata;
  wire             LCD_E_from_the_lcd;
  wire             LCD_RS_from_the_lcd;
  wire             LCD_RW_from_the_lcd;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd;
  wire    [  7: 0] SD_CARD_Interface_avalon_slave_address;
  wire    [  3: 0] SD_CARD_Interface_avalon_slave_byteenable;
  wire             SD_CARD_Interface_avalon_slave_chipselect;
  wire             SD_CARD_Interface_avalon_slave_read;
  wire    [ 31: 0] SD_CARD_Interface_avalon_slave_readdata;
  wire    [ 31: 0] SD_CARD_Interface_avalon_slave_readdata_from_sa;
  wire             SD_CARD_Interface_avalon_slave_reset_n;
  wire             SD_CARD_Interface_avalon_slave_waitrequest;
  wire             SD_CARD_Interface_avalon_slave_waitrequest_from_sa;
  wire             SD_CARD_Interface_avalon_slave_write;
  wire    [ 31: 0] SD_CARD_Interface_avalon_slave_writedata;
  wire    [ 21: 0] address_to_the_cfi_flash;
  wire             b_SD_cmd_to_and_from_the_SD_CARD_Interface;
  wire             b_SD_dat3_to_and_from_the_SD_CARD_Interface;
  wire             b_SD_dat_to_and_from_the_SD_CARD_Interface;
  wire    [  1: 0] buttons_s1_address;
  wire             buttons_s1_chipselect;
  wire             buttons_s1_irq;
  wire             buttons_s1_irq_from_sa;
  wire    [ 31: 0] buttons_s1_readdata;
  wire    [ 31: 0] buttons_s1_readdata_from_sa;
  wire             buttons_s1_reset_n;
  wire             buttons_s1_write_n;
  wire    [ 31: 0] buttons_s1_writedata;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             cfi_flash_s1_wait_counter_eq_1;
  wire             clk_reset_n;
  wire    [ 10: 0] clock_crossing_bridge_m1_address;
  wire    [ 10: 0] clock_crossing_bridge_m1_address_to_slave;
  wire    [  3: 0] clock_crossing_bridge_m1_byteenable;
  wire             clock_crossing_bridge_m1_endofpacket;
  wire             clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in;
  wire             clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in;
  wire             clock_crossing_bridge_m1_granted_buttons_s1;
  wire             clock_crossing_bridge_m1_granted_lcd_control_slave;
  wire             clock_crossing_bridge_m1_granted_lcd_light_s1;
  wire             clock_crossing_bridge_m1_granted_leds_s1;
  wire             clock_crossing_bridge_m1_granted_seg7_s1;
  wire             clock_crossing_bridge_m1_granted_switches_s1;
  wire             clock_crossing_bridge_m1_granted_sysid_control_slave;
  wire             clock_crossing_bridge_m1_granted_timer_s1;
  wire             clock_crossing_bridge_m1_granted_uart_s1;
  wire             clock_crossing_bridge_m1_latency_counter;
  wire    [  8: 0] clock_crossing_bridge_m1_nativeaddress;
  wire             clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in;
  wire             clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in;
  wire             clock_crossing_bridge_m1_qualified_request_buttons_s1;
  wire             clock_crossing_bridge_m1_qualified_request_lcd_control_slave;
  wire             clock_crossing_bridge_m1_qualified_request_lcd_light_s1;
  wire             clock_crossing_bridge_m1_qualified_request_leds_s1;
  wire             clock_crossing_bridge_m1_qualified_request_seg7_s1;
  wire             clock_crossing_bridge_m1_qualified_request_switches_s1;
  wire             clock_crossing_bridge_m1_qualified_request_sysid_control_slave;
  wire             clock_crossing_bridge_m1_qualified_request_timer_s1;
  wire             clock_crossing_bridge_m1_qualified_request_uart_s1;
  wire             clock_crossing_bridge_m1_read;
  wire             clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in;
  wire             clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in;
  wire             clock_crossing_bridge_m1_read_data_valid_buttons_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_lcd_control_slave;
  wire             clock_crossing_bridge_m1_read_data_valid_lcd_light_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_leds_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_seg7_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_switches_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_sysid_control_slave;
  wire             clock_crossing_bridge_m1_read_data_valid_timer_s1;
  wire             clock_crossing_bridge_m1_read_data_valid_uart_s1;
  wire    [ 31: 0] clock_crossing_bridge_m1_readdata;
  wire             clock_crossing_bridge_m1_readdatavalid;
  wire             clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in;
  wire             clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in;
  wire             clock_crossing_bridge_m1_requests_buttons_s1;
  wire             clock_crossing_bridge_m1_requests_lcd_control_slave;
  wire             clock_crossing_bridge_m1_requests_lcd_light_s1;
  wire             clock_crossing_bridge_m1_requests_leds_s1;
  wire             clock_crossing_bridge_m1_requests_seg7_s1;
  wire             clock_crossing_bridge_m1_requests_switches_s1;
  wire             clock_crossing_bridge_m1_requests_sysid_control_slave;
  wire             clock_crossing_bridge_m1_requests_timer_s1;
  wire             clock_crossing_bridge_m1_requests_uart_s1;
  wire             clock_crossing_bridge_m1_reset_n;
  wire             clock_crossing_bridge_m1_waitrequest;
  wire             clock_crossing_bridge_m1_write;
  wire    [ 31: 0] clock_crossing_bridge_m1_writedata;
  wire    [  8: 0] clock_crossing_bridge_s1_address;
  wire    [  3: 0] clock_crossing_bridge_s1_byteenable;
  wire             clock_crossing_bridge_s1_endofpacket;
  wire             clock_crossing_bridge_s1_endofpacket_from_sa;
  wire    [  8: 0] clock_crossing_bridge_s1_nativeaddress;
  wire             clock_crossing_bridge_s1_read;
  wire    [ 31: 0] clock_crossing_bridge_s1_readdata;
  wire    [ 31: 0] clock_crossing_bridge_s1_readdata_from_sa;
  wire             clock_crossing_bridge_s1_readdatavalid;
  wire             clock_crossing_bridge_s1_reset_n;
  wire             clock_crossing_bridge_s1_waitrequest;
  wire             clock_crossing_bridge_s1_waitrequest_from_sa;
  wire             clock_crossing_bridge_s1_write;
  wire    [ 31: 0] clock_crossing_bridge_s1_writedata;
  wire    [ 25: 0] cpu_data_master_address;
  wire    [ 25: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire    [  1: 0] cpu_data_master_byteenable_cfi_flash_s1;
  wire    [  1: 0] cpu_data_master_byteenable_sdram_s1;
  wire    [  1: 0] cpu_data_master_dbs_address;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_granted_cfi_flash_s1;
  wire             cpu_data_master_granted_clock_crossing_bridge_s1;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_granted_onchip_mem_s1;
  wire             cpu_data_master_granted_sdram_s1;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_no_byte_enables_and_last_term;
  wire             cpu_data_master_qualified_request_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_qualified_request_cfi_flash_s1;
  wire             cpu_data_master_qualified_request_clock_crossing_bridge_s1;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_onchip_mem_s1;
  wire             cpu_data_master_qualified_request_sdram_s1;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1;
  wire             cpu_data_master_read_data_valid_clock_crossing_bridge_s1;
  wire             cpu_data_master_read_data_valid_clock_crossing_bridge_s1_shift_register;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_onchip_mem_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1_shift_register;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_requests_DE0_SOPC_clock_0_in;
  wire             cpu_data_master_requests_cfi_flash_s1;
  wire             cpu_data_master_requests_clock_crossing_bridge_s1;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_onchip_mem_s1;
  wire             cpu_data_master_requests_sdram_s1;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 25: 0] cpu_instruction_master_address;
  wire    [ 25: 0] cpu_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_instruction_master_dbs_address;
  wire             cpu_instruction_master_granted_cfi_flash_s1;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_onchip_mem_s1;
  wire             cpu_instruction_master_granted_sdram_s1;
  wire             cpu_instruction_master_qualified_request_cfi_flash_s1;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_onchip_mem_s1;
  wire             cpu_instruction_master_qualified_request_sdram_s1;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_onchip_mem_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_requests_cfi_flash_s1;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_onchip_mem_s1;
  wire             cpu_instruction_master_requests_sdram_s1;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire             d1_DE0_SOPC_clock_0_in_end_xfer;
  wire             d1_DE0_SOPC_clock_1_in_end_xfer;
  wire             d1_DE0_SOPC_clock_2_in_end_xfer;
  wire             d1_SD_CARD_Interface_avalon_slave_end_xfer;
  wire             d1_buttons_s1_end_xfer;
  wire             d1_clock_crossing_bridge_s1_end_xfer;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_lcd_control_slave_end_xfer;
  wire             d1_lcd_light_s1_end_xfer;
  wire             d1_leds_s1_end_xfer;
  wire             d1_onchip_mem_s1_end_xfer;
  wire             d1_pll_s1_end_xfer;
  wire             d1_sdram_s1_end_xfer;
  wire             d1_seg7_s1_end_xfer;
  wire             d1_switches_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_timer_0_s1_end_xfer;
  wire             d1_timer_s1_end_xfer;
  wire             d1_tristate_bridge_avalon_slave_end_xfer;
  wire             d1_uart_s1_end_xfer;
  wire    [ 15: 0] data_to_and_from_the_cfi_flash;
  wire    [ 15: 0] incoming_data_to_and_from_the_cfi_flash;
  wire    [ 15: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_irq;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  wire             jtag_uart_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [  1: 0] lcd_control_slave_address;
  wire             lcd_control_slave_begintransfer;
  wire             lcd_control_slave_read;
  wire    [  7: 0] lcd_control_slave_readdata;
  wire    [  7: 0] lcd_control_slave_readdata_from_sa;
  wire             lcd_control_slave_reset_n;
  wire             lcd_control_slave_wait_counter_eq_0;
  wire             lcd_control_slave_write;
  wire    [  7: 0] lcd_control_slave_writedata;
  wire    [  1: 0] lcd_light_s1_address;
  wire             lcd_light_s1_chipselect;
  wire    [ 31: 0] lcd_light_s1_readdata;
  wire    [ 31: 0] lcd_light_s1_readdata_from_sa;
  wire             lcd_light_s1_reset_n;
  wire             lcd_light_s1_write_n;
  wire    [ 31: 0] lcd_light_s1_writedata;
  wire    [  1: 0] leds_s1_address;
  wire             leds_s1_chipselect;
  wire    [ 31: 0] leds_s1_readdata;
  wire    [ 31: 0] leds_s1_readdata_from_sa;
  wire             leds_s1_reset_n;
  wire             leds_s1_write_n;
  wire    [ 31: 0] leds_s1_writedata;
  wire             o_SD_clock_from_the_SD_CARD_Interface;
  wire    [ 12: 0] onchip_mem_s1_address;
  wire    [  3: 0] onchip_mem_s1_byteenable;
  wire             onchip_mem_s1_chipselect;
  wire             onchip_mem_s1_clken;
  wire    [ 31: 0] onchip_mem_s1_readdata;
  wire    [ 31: 0] onchip_mem_s1_readdata_from_sa;
  wire             onchip_mem_s1_reset;
  wire             onchip_mem_s1_write;
  wire    [ 31: 0] onchip_mem_s1_writedata;
  wire             out_clk_pll_c0;
  wire             out_clk_pll_c1;
  wire             out_clk_pll_c2;
  wire             out_clk_pll_c3;
  wire             out_port_from_the_lcd_light;
  wire    [  9: 0] out_port_from_the_leds;
  wire    [ 31: 0] out_port_from_the_seg7;
  wire             pll_cpu;
  wire             pll_cpu_reset_n;
  wire             pll_io;
  wire             pll_io_reset_n;
  wire    [  2: 0] pll_s1_address;
  wire             pll_s1_chipselect;
  wire             pll_s1_read;
  wire    [ 15: 0] pll_s1_readdata;
  wire    [ 15: 0] pll_s1_readdata_from_sa;
  wire             pll_s1_reset_n;
  wire             pll_s1_resetrequest;
  wire             pll_s1_resetrequest_from_sa;
  wire             pll_s1_write;
  wire    [ 15: 0] pll_s1_writedata;
  wire             pll_sdram;
  wire             pll_vga;
  wire             read_n_to_the_cfi_flash;
  wire             registered_cpu_data_master_read_data_valid_cfi_flash_s1;
  wire             registered_cpu_data_master_read_data_valid_onchip_mem_s1;
  wire             reset_n_sources;
  wire    [ 21: 0] sdram_s1_address;
  wire    [  1: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire             sdram_s1_read_n;
  wire    [ 15: 0] sdram_s1_readdata;
  wire    [ 15: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid;
  wire             sdram_s1_reset_n;
  wire             sdram_s1_waitrequest;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_write_n;
  wire    [ 15: 0] sdram_s1_writedata;
  wire    [  1: 0] seg7_s1_address;
  wire             seg7_s1_chipselect;
  wire    [ 31: 0] seg7_s1_readdata;
  wire    [ 31: 0] seg7_s1_readdata_from_sa;
  wire             seg7_s1_reset_n;
  wire             seg7_s1_write_n;
  wire    [ 31: 0] seg7_s1_writedata;
  wire             select_n_to_the_cfi_flash;
  wire    [  1: 0] switches_s1_address;
  wire             switches_s1_chipselect;
  wire             switches_s1_irq;
  wire             switches_s1_irq_from_sa;
  wire    [ 31: 0] switches_s1_readdata;
  wire    [ 31: 0] switches_s1_readdata_from_sa;
  wire             switches_s1_reset_n;
  wire             switches_s1_write_n;
  wire    [ 31: 0] switches_s1_writedata;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire    [  2: 0] timer_0_s1_address;
  wire             timer_0_s1_chipselect;
  wire             timer_0_s1_irq;
  wire             timer_0_s1_irq_from_sa;
  wire    [ 15: 0] timer_0_s1_readdata;
  wire    [ 15: 0] timer_0_s1_readdata_from_sa;
  wire             timer_0_s1_reset_n;
  wire             timer_0_s1_write_n;
  wire    [ 15: 0] timer_0_s1_writedata;
  wire    [  2: 0] timer_s1_address;
  wire             timer_s1_chipselect;
  wire             timer_s1_irq;
  wire             timer_s1_irq_from_sa;
  wire    [ 15: 0] timer_s1_readdata;
  wire    [ 15: 0] timer_s1_readdata_from_sa;
  wire             timer_s1_reset_n;
  wire             timer_s1_write_n;
  wire    [ 15: 0] timer_s1_writedata;
  wire             txd_from_the_uart;
  wire    [  2: 0] uart_s1_address;
  wire             uart_s1_begintransfer;
  wire             uart_s1_chipselect;
  wire             uart_s1_dataavailable;
  wire             uart_s1_dataavailable_from_sa;
  wire             uart_s1_irq;
  wire             uart_s1_irq_from_sa;
  wire             uart_s1_read_n;
  wire    [ 15: 0] uart_s1_readdata;
  wire    [ 15: 0] uart_s1_readdata_from_sa;
  wire             uart_s1_readyfordata;
  wire             uart_s1_readyfordata_from_sa;
  wire             uart_s1_reset_n;
  wire             uart_s1_write_n;
  wire    [ 15: 0] uart_s1_writedata;
  wire             write_n_to_the_cfi_flash;
  wire    [ 11: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram;
  wire    [  1: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;
  DE0_SOPC_clock_0_in_arbitrator the_DE0_SOPC_clock_0_in
    (
      .DE0_SOPC_clock_0_in_address                           (DE0_SOPC_clock_0_in_address),
      .DE0_SOPC_clock_0_in_byteenable                        (DE0_SOPC_clock_0_in_byteenable),
      .DE0_SOPC_clock_0_in_endofpacket                       (DE0_SOPC_clock_0_in_endofpacket),
      .DE0_SOPC_clock_0_in_endofpacket_from_sa               (DE0_SOPC_clock_0_in_endofpacket_from_sa),
      .DE0_SOPC_clock_0_in_nativeaddress                     (DE0_SOPC_clock_0_in_nativeaddress),
      .DE0_SOPC_clock_0_in_read                              (DE0_SOPC_clock_0_in_read),
      .DE0_SOPC_clock_0_in_readdata                          (DE0_SOPC_clock_0_in_readdata),
      .DE0_SOPC_clock_0_in_readdata_from_sa                  (DE0_SOPC_clock_0_in_readdata_from_sa),
      .DE0_SOPC_clock_0_in_reset_n                           (DE0_SOPC_clock_0_in_reset_n),
      .DE0_SOPC_clock_0_in_waitrequest                       (DE0_SOPC_clock_0_in_waitrequest),
      .DE0_SOPC_clock_0_in_waitrequest_from_sa               (DE0_SOPC_clock_0_in_waitrequest_from_sa),
      .DE0_SOPC_clock_0_in_write                             (DE0_SOPC_clock_0_in_write),
      .DE0_SOPC_clock_0_in_writedata                         (DE0_SOPC_clock_0_in_writedata),
      .clk                                                   (pll_cpu),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                            (cpu_data_master_byteenable),
      .cpu_data_master_granted_DE0_SOPC_clock_0_in           (cpu_data_master_granted_DE0_SOPC_clock_0_in),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_0_in (cpu_data_master_qualified_request_DE0_SOPC_clock_0_in),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in   (cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in),
      .cpu_data_master_requests_DE0_SOPC_clock_0_in          (cpu_data_master_requests_DE0_SOPC_clock_0_in),
      .cpu_data_master_waitrequest                           (cpu_data_master_waitrequest),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .cpu_data_master_writedata                             (cpu_data_master_writedata),
      .d1_DE0_SOPC_clock_0_in_end_xfer                       (d1_DE0_SOPC_clock_0_in_end_xfer),
      .reset_n                                               (pll_cpu_reset_n)
    );

  DE0_SOPC_clock_0_out_arbitrator the_DE0_SOPC_clock_0_out
    (
      .DE0_SOPC_clock_0_out_address                  (DE0_SOPC_clock_0_out_address),
      .DE0_SOPC_clock_0_out_address_to_slave         (DE0_SOPC_clock_0_out_address_to_slave),
      .DE0_SOPC_clock_0_out_byteenable               (DE0_SOPC_clock_0_out_byteenable),
      .DE0_SOPC_clock_0_out_granted_pll_s1           (DE0_SOPC_clock_0_out_granted_pll_s1),
      .DE0_SOPC_clock_0_out_qualified_request_pll_s1 (DE0_SOPC_clock_0_out_qualified_request_pll_s1),
      .DE0_SOPC_clock_0_out_read                     (DE0_SOPC_clock_0_out_read),
      .DE0_SOPC_clock_0_out_read_data_valid_pll_s1   (DE0_SOPC_clock_0_out_read_data_valid_pll_s1),
      .DE0_SOPC_clock_0_out_readdata                 (DE0_SOPC_clock_0_out_readdata),
      .DE0_SOPC_clock_0_out_requests_pll_s1          (DE0_SOPC_clock_0_out_requests_pll_s1),
      .DE0_SOPC_clock_0_out_reset_n                  (DE0_SOPC_clock_0_out_reset_n),
      .DE0_SOPC_clock_0_out_waitrequest              (DE0_SOPC_clock_0_out_waitrequest),
      .DE0_SOPC_clock_0_out_write                    (DE0_SOPC_clock_0_out_write),
      .DE0_SOPC_clock_0_out_writedata                (DE0_SOPC_clock_0_out_writedata),
      .clk                                           (clk),
      .d1_pll_s1_end_xfer                            (d1_pll_s1_end_xfer),
      .pll_s1_readdata_from_sa                       (pll_s1_readdata_from_sa),
      .reset_n                                       (clk_reset_n)
    );

  DE0_SOPC_clock_0 the_DE0_SOPC_clock_0
    (
      .master_address       (DE0_SOPC_clock_0_out_address),
      .master_byteenable    (DE0_SOPC_clock_0_out_byteenable),
      .master_clk           (clk),
      .master_endofpacket   (DE0_SOPC_clock_0_out_endofpacket),
      .master_nativeaddress (DE0_SOPC_clock_0_out_nativeaddress),
      .master_read          (DE0_SOPC_clock_0_out_read),
      .master_readdata      (DE0_SOPC_clock_0_out_readdata),
      .master_reset_n       (DE0_SOPC_clock_0_out_reset_n),
      .master_waitrequest   (DE0_SOPC_clock_0_out_waitrequest),
      .master_write         (DE0_SOPC_clock_0_out_write),
      .master_writedata     (DE0_SOPC_clock_0_out_writedata),
      .slave_address        (DE0_SOPC_clock_0_in_address),
      .slave_byteenable     (DE0_SOPC_clock_0_in_byteenable),
      .slave_clk            (pll_cpu),
      .slave_endofpacket    (DE0_SOPC_clock_0_in_endofpacket),
      .slave_nativeaddress  (DE0_SOPC_clock_0_in_nativeaddress),
      .slave_read           (DE0_SOPC_clock_0_in_read),
      .slave_readdata       (DE0_SOPC_clock_0_in_readdata),
      .slave_reset_n        (DE0_SOPC_clock_0_in_reset_n),
      .slave_waitrequest    (DE0_SOPC_clock_0_in_waitrequest),
      .slave_write          (DE0_SOPC_clock_0_in_write),
      .slave_writedata      (DE0_SOPC_clock_0_in_writedata)
    );

  DE0_SOPC_clock_1_in_arbitrator the_DE0_SOPC_clock_1_in
    (
      .DE0_SOPC_clock_1_in_address                                    (DE0_SOPC_clock_1_in_address),
      .DE0_SOPC_clock_1_in_byteenable                                 (DE0_SOPC_clock_1_in_byteenable),
      .DE0_SOPC_clock_1_in_endofpacket                                (DE0_SOPC_clock_1_in_endofpacket),
      .DE0_SOPC_clock_1_in_endofpacket_from_sa                        (DE0_SOPC_clock_1_in_endofpacket_from_sa),
      .DE0_SOPC_clock_1_in_nativeaddress                              (DE0_SOPC_clock_1_in_nativeaddress),
      .DE0_SOPC_clock_1_in_read                                       (DE0_SOPC_clock_1_in_read),
      .DE0_SOPC_clock_1_in_readdata                                   (DE0_SOPC_clock_1_in_readdata),
      .DE0_SOPC_clock_1_in_readdata_from_sa                           (DE0_SOPC_clock_1_in_readdata_from_sa),
      .DE0_SOPC_clock_1_in_reset_n                                    (DE0_SOPC_clock_1_in_reset_n),
      .DE0_SOPC_clock_1_in_waitrequest                                (DE0_SOPC_clock_1_in_waitrequest),
      .DE0_SOPC_clock_1_in_waitrequest_from_sa                        (DE0_SOPC_clock_1_in_waitrequest_from_sa),
      .DE0_SOPC_clock_1_in_write                                      (DE0_SOPC_clock_1_in_write),
      .DE0_SOPC_clock_1_in_writedata                                  (DE0_SOPC_clock_1_in_writedata),
      .clk                                                            (pll_io),
      .clock_crossing_bridge_m1_address_to_slave                      (clock_crossing_bridge_m1_address_to_slave),
      .clock_crossing_bridge_m1_byteenable                            (clock_crossing_bridge_m1_byteenable),
      .clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in           (clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in),
      .clock_crossing_bridge_m1_latency_counter                       (clock_crossing_bridge_m1_latency_counter),
      .clock_crossing_bridge_m1_nativeaddress                         (clock_crossing_bridge_m1_nativeaddress),
      .clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in (clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in),
      .clock_crossing_bridge_m1_read                                  (clock_crossing_bridge_m1_read),
      .clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in   (clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in),
      .clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in          (clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in),
      .clock_crossing_bridge_m1_write                                 (clock_crossing_bridge_m1_write),
      .clock_crossing_bridge_m1_writedata                             (clock_crossing_bridge_m1_writedata),
      .d1_DE0_SOPC_clock_1_in_end_xfer                                (d1_DE0_SOPC_clock_1_in_end_xfer),
      .reset_n                                                        (pll_io_reset_n)
    );

  DE0_SOPC_clock_1_out_arbitrator the_DE0_SOPC_clock_1_out
    (
      .DE0_SOPC_clock_1_out_address                      (DE0_SOPC_clock_1_out_address),
      .DE0_SOPC_clock_1_out_address_to_slave             (DE0_SOPC_clock_1_out_address_to_slave),
      .DE0_SOPC_clock_1_out_byteenable                   (DE0_SOPC_clock_1_out_byteenable),
      .DE0_SOPC_clock_1_out_granted_timer_0_s1           (DE0_SOPC_clock_1_out_granted_timer_0_s1),
      .DE0_SOPC_clock_1_out_qualified_request_timer_0_s1 (DE0_SOPC_clock_1_out_qualified_request_timer_0_s1),
      .DE0_SOPC_clock_1_out_read                         (DE0_SOPC_clock_1_out_read),
      .DE0_SOPC_clock_1_out_read_data_valid_timer_0_s1   (DE0_SOPC_clock_1_out_read_data_valid_timer_0_s1),
      .DE0_SOPC_clock_1_out_readdata                     (DE0_SOPC_clock_1_out_readdata),
      .DE0_SOPC_clock_1_out_requests_timer_0_s1          (DE0_SOPC_clock_1_out_requests_timer_0_s1),
      .DE0_SOPC_clock_1_out_reset_n                      (DE0_SOPC_clock_1_out_reset_n),
      .DE0_SOPC_clock_1_out_waitrequest                  (DE0_SOPC_clock_1_out_waitrequest),
      .DE0_SOPC_clock_1_out_write                        (DE0_SOPC_clock_1_out_write),
      .DE0_SOPC_clock_1_out_writedata                    (DE0_SOPC_clock_1_out_writedata),
      .clk                                               (clk),
      .d1_timer_0_s1_end_xfer                            (d1_timer_0_s1_end_xfer),
      .reset_n                                           (clk_reset_n),
      .timer_0_s1_readdata_from_sa                       (timer_0_s1_readdata_from_sa)
    );

  DE0_SOPC_clock_1 the_DE0_SOPC_clock_1
    (
      .master_address       (DE0_SOPC_clock_1_out_address),
      .master_byteenable    (DE0_SOPC_clock_1_out_byteenable),
      .master_clk           (clk),
      .master_endofpacket   (DE0_SOPC_clock_1_out_endofpacket),
      .master_nativeaddress (DE0_SOPC_clock_1_out_nativeaddress),
      .master_read          (DE0_SOPC_clock_1_out_read),
      .master_readdata      (DE0_SOPC_clock_1_out_readdata),
      .master_reset_n       (DE0_SOPC_clock_1_out_reset_n),
      .master_waitrequest   (DE0_SOPC_clock_1_out_waitrequest),
      .master_write         (DE0_SOPC_clock_1_out_write),
      .master_writedata     (DE0_SOPC_clock_1_out_writedata),
      .slave_address        (DE0_SOPC_clock_1_in_address),
      .slave_byteenable     (DE0_SOPC_clock_1_in_byteenable),
      .slave_clk            (pll_io),
      .slave_endofpacket    (DE0_SOPC_clock_1_in_endofpacket),
      .slave_nativeaddress  (DE0_SOPC_clock_1_in_nativeaddress),
      .slave_read           (DE0_SOPC_clock_1_in_read),
      .slave_readdata       (DE0_SOPC_clock_1_in_readdata),
      .slave_reset_n        (DE0_SOPC_clock_1_in_reset_n),
      .slave_waitrequest    (DE0_SOPC_clock_1_in_waitrequest),
      .slave_write          (DE0_SOPC_clock_1_in_write),
      .slave_writedata      (DE0_SOPC_clock_1_in_writedata)
    );

  DE0_SOPC_clock_2_in_arbitrator the_DE0_SOPC_clock_2_in
    (
      .DE0_SOPC_clock_2_in_address                                    (DE0_SOPC_clock_2_in_address),
      .DE0_SOPC_clock_2_in_byteenable                                 (DE0_SOPC_clock_2_in_byteenable),
      .DE0_SOPC_clock_2_in_endofpacket                                (DE0_SOPC_clock_2_in_endofpacket),
      .DE0_SOPC_clock_2_in_endofpacket_from_sa                        (DE0_SOPC_clock_2_in_endofpacket_from_sa),
      .DE0_SOPC_clock_2_in_nativeaddress                              (DE0_SOPC_clock_2_in_nativeaddress),
      .DE0_SOPC_clock_2_in_read                                       (DE0_SOPC_clock_2_in_read),
      .DE0_SOPC_clock_2_in_readdata                                   (DE0_SOPC_clock_2_in_readdata),
      .DE0_SOPC_clock_2_in_readdata_from_sa                           (DE0_SOPC_clock_2_in_readdata_from_sa),
      .DE0_SOPC_clock_2_in_reset_n                                    (DE0_SOPC_clock_2_in_reset_n),
      .DE0_SOPC_clock_2_in_waitrequest                                (DE0_SOPC_clock_2_in_waitrequest),
      .DE0_SOPC_clock_2_in_waitrequest_from_sa                        (DE0_SOPC_clock_2_in_waitrequest_from_sa),
      .DE0_SOPC_clock_2_in_write                                      (DE0_SOPC_clock_2_in_write),
      .DE0_SOPC_clock_2_in_writedata                                  (DE0_SOPC_clock_2_in_writedata),
      .clk                                                            (pll_io),
      .clock_crossing_bridge_m1_address_to_slave                      (clock_crossing_bridge_m1_address_to_slave),
      .clock_crossing_bridge_m1_byteenable                            (clock_crossing_bridge_m1_byteenable),
      .clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in           (clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in),
      .clock_crossing_bridge_m1_latency_counter                       (clock_crossing_bridge_m1_latency_counter),
      .clock_crossing_bridge_m1_nativeaddress                         (clock_crossing_bridge_m1_nativeaddress),
      .clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in (clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in),
      .clock_crossing_bridge_m1_read                                  (clock_crossing_bridge_m1_read),
      .clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in   (clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in),
      .clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in          (clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in),
      .clock_crossing_bridge_m1_write                                 (clock_crossing_bridge_m1_write),
      .clock_crossing_bridge_m1_writedata                             (clock_crossing_bridge_m1_writedata),
      .d1_DE0_SOPC_clock_2_in_end_xfer                                (d1_DE0_SOPC_clock_2_in_end_xfer),
      .reset_n                                                        (pll_io_reset_n)
    );

  DE0_SOPC_clock_2_out_arbitrator the_DE0_SOPC_clock_2_out
    (
      .DE0_SOPC_clock_2_out_address                                          (DE0_SOPC_clock_2_out_address),
      .DE0_SOPC_clock_2_out_address_to_slave                                 (DE0_SOPC_clock_2_out_address_to_slave),
      .DE0_SOPC_clock_2_out_byteenable                                       (DE0_SOPC_clock_2_out_byteenable),
      .DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave           (DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave),
      .DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave (DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave),
      .DE0_SOPC_clock_2_out_read                                             (DE0_SOPC_clock_2_out_read),
      .DE0_SOPC_clock_2_out_read_data_valid_SD_CARD_Interface_avalon_slave   (DE0_SOPC_clock_2_out_read_data_valid_SD_CARD_Interface_avalon_slave),
      .DE0_SOPC_clock_2_out_readdata                                         (DE0_SOPC_clock_2_out_readdata),
      .DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave          (DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave),
      .DE0_SOPC_clock_2_out_reset_n                                          (DE0_SOPC_clock_2_out_reset_n),
      .DE0_SOPC_clock_2_out_waitrequest                                      (DE0_SOPC_clock_2_out_waitrequest),
      .DE0_SOPC_clock_2_out_write                                            (DE0_SOPC_clock_2_out_write),
      .DE0_SOPC_clock_2_out_writedata                                        (DE0_SOPC_clock_2_out_writedata),
      .SD_CARD_Interface_avalon_slave_readdata_from_sa                       (SD_CARD_Interface_avalon_slave_readdata_from_sa),
      .SD_CARD_Interface_avalon_slave_waitrequest_from_sa                    (SD_CARD_Interface_avalon_slave_waitrequest_from_sa),
      .clk                                                                   (clk),
      .d1_SD_CARD_Interface_avalon_slave_end_xfer                            (d1_SD_CARD_Interface_avalon_slave_end_xfer),
      .reset_n                                                               (clk_reset_n)
    );

  DE0_SOPC_clock_2 the_DE0_SOPC_clock_2
    (
      .master_address       (DE0_SOPC_clock_2_out_address),
      .master_byteenable    (DE0_SOPC_clock_2_out_byteenable),
      .master_clk           (clk),
      .master_endofpacket   (DE0_SOPC_clock_2_out_endofpacket),
      .master_nativeaddress (DE0_SOPC_clock_2_out_nativeaddress),
      .master_read          (DE0_SOPC_clock_2_out_read),
      .master_readdata      (DE0_SOPC_clock_2_out_readdata),
      .master_reset_n       (DE0_SOPC_clock_2_out_reset_n),
      .master_waitrequest   (DE0_SOPC_clock_2_out_waitrequest),
      .master_write         (DE0_SOPC_clock_2_out_write),
      .master_writedata     (DE0_SOPC_clock_2_out_writedata),
      .slave_address        (DE0_SOPC_clock_2_in_address),
      .slave_byteenable     (DE0_SOPC_clock_2_in_byteenable),
      .slave_clk            (pll_io),
      .slave_endofpacket    (DE0_SOPC_clock_2_in_endofpacket),
      .slave_nativeaddress  (DE0_SOPC_clock_2_in_nativeaddress),
      .slave_read           (DE0_SOPC_clock_2_in_read),
      .slave_readdata       (DE0_SOPC_clock_2_in_readdata),
      .slave_reset_n        (DE0_SOPC_clock_2_in_reset_n),
      .slave_waitrequest    (DE0_SOPC_clock_2_in_waitrequest),
      .slave_write          (DE0_SOPC_clock_2_in_write),
      .slave_writedata      (DE0_SOPC_clock_2_in_writedata)
    );

  SD_CARD_Interface_avalon_slave_arbitrator the_SD_CARD_Interface_avalon_slave
    (
      .DE0_SOPC_clock_2_out_address_to_slave                                 (DE0_SOPC_clock_2_out_address_to_slave),
      .DE0_SOPC_clock_2_out_byteenable                                       (DE0_SOPC_clock_2_out_byteenable),
      .DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave           (DE0_SOPC_clock_2_out_granted_SD_CARD_Interface_avalon_slave),
      .DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave (DE0_SOPC_clock_2_out_qualified_request_SD_CARD_Interface_avalon_slave),
      .DE0_SOPC_clock_2_out_read                                             (DE0_SOPC_clock_2_out_read),
      .DE0_SOPC_clock_2_out_read_data_valid_SD_CARD_Interface_avalon_slave   (DE0_SOPC_clock_2_out_read_data_valid_SD_CARD_Interface_avalon_slave),
      .DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave          (DE0_SOPC_clock_2_out_requests_SD_CARD_Interface_avalon_slave),
      .DE0_SOPC_clock_2_out_write                                            (DE0_SOPC_clock_2_out_write),
      .DE0_SOPC_clock_2_out_writedata                                        (DE0_SOPC_clock_2_out_writedata),
      .SD_CARD_Interface_avalon_slave_address                                (SD_CARD_Interface_avalon_slave_address),
      .SD_CARD_Interface_avalon_slave_byteenable                             (SD_CARD_Interface_avalon_slave_byteenable),
      .SD_CARD_Interface_avalon_slave_chipselect                             (SD_CARD_Interface_avalon_slave_chipselect),
      .SD_CARD_Interface_avalon_slave_read                                   (SD_CARD_Interface_avalon_slave_read),
      .SD_CARD_Interface_avalon_slave_readdata                               (SD_CARD_Interface_avalon_slave_readdata),
      .SD_CARD_Interface_avalon_slave_readdata_from_sa                       (SD_CARD_Interface_avalon_slave_readdata_from_sa),
      .SD_CARD_Interface_avalon_slave_reset_n                                (SD_CARD_Interface_avalon_slave_reset_n),
      .SD_CARD_Interface_avalon_slave_waitrequest                            (SD_CARD_Interface_avalon_slave_waitrequest),
      .SD_CARD_Interface_avalon_slave_waitrequest_from_sa                    (SD_CARD_Interface_avalon_slave_waitrequest_from_sa),
      .SD_CARD_Interface_avalon_slave_write                                  (SD_CARD_Interface_avalon_slave_write),
      .SD_CARD_Interface_avalon_slave_writedata                              (SD_CARD_Interface_avalon_slave_writedata),
      .clk                                                                   (clk),
      .d1_SD_CARD_Interface_avalon_slave_end_xfer                            (d1_SD_CARD_Interface_avalon_slave_end_xfer),
      .reset_n                                                               (clk_reset_n)
    );

  SD_CARD_Interface the_SD_CARD_Interface
    (
      .b_SD_cmd             (b_SD_cmd_to_and_from_the_SD_CARD_Interface),
      .b_SD_dat             (b_SD_dat_to_and_from_the_SD_CARD_Interface),
      .b_SD_dat3            (b_SD_dat3_to_and_from_the_SD_CARD_Interface),
      .i_avalon_address     (SD_CARD_Interface_avalon_slave_address),
      .i_avalon_byteenable  (SD_CARD_Interface_avalon_slave_byteenable),
      .i_avalon_chip_select (SD_CARD_Interface_avalon_slave_chipselect),
      .i_avalon_read        (SD_CARD_Interface_avalon_slave_read),
      .i_avalon_write       (SD_CARD_Interface_avalon_slave_write),
      .i_avalon_writedata   (SD_CARD_Interface_avalon_slave_writedata),
      .i_clock              (clk),
      .i_reset_n            (SD_CARD_Interface_avalon_slave_reset_n),
      .o_SD_clock           (o_SD_clock_from_the_SD_CARD_Interface),
      .o_avalon_readdata    (SD_CARD_Interface_avalon_slave_readdata),
      .o_avalon_waitrequest (SD_CARD_Interface_avalon_slave_waitrequest)
    );

  buttons_s1_arbitrator the_buttons_s1
    (
      .buttons_s1_address                                    (buttons_s1_address),
      .buttons_s1_chipselect                                 (buttons_s1_chipselect),
      .buttons_s1_irq                                        (buttons_s1_irq),
      .buttons_s1_irq_from_sa                                (buttons_s1_irq_from_sa),
      .buttons_s1_readdata                                   (buttons_s1_readdata),
      .buttons_s1_readdata_from_sa                           (buttons_s1_readdata_from_sa),
      .buttons_s1_reset_n                                    (buttons_s1_reset_n),
      .buttons_s1_write_n                                    (buttons_s1_write_n),
      .buttons_s1_writedata                                  (buttons_s1_writedata),
      .clk                                                   (pll_io),
      .clock_crossing_bridge_m1_address_to_slave             (clock_crossing_bridge_m1_address_to_slave),
      .clock_crossing_bridge_m1_granted_buttons_s1           (clock_crossing_bridge_m1_granted_buttons_s1),
      .clock_crossing_bridge_m1_latency_counter              (clock_crossing_bridge_m1_latency_counter),
      .clock_crossing_bridge_m1_nativeaddress                (clock_crossing_bridge_m1_nativeaddress),
      .clock_crossing_bridge_m1_qualified_request_buttons_s1 (clock_crossing_bridge_m1_qualified_request_buttons_s1),
      .clock_crossing_bridge_m1_read                         (clock_crossing_bridge_m1_read),
      .clock_crossing_bridge_m1_read_data_valid_buttons_s1   (clock_crossing_bridge_m1_read_data_valid_buttons_s1),
      .clock_crossing_bridge_m1_requests_buttons_s1          (clock_crossing_bridge_m1_requests_buttons_s1),
      .clock_crossing_bridge_m1_write                        (clock_crossing_bridge_m1_write),
      .clock_crossing_bridge_m1_writedata                    (clock_crossing_bridge_m1_writedata),
      .d1_buttons_s1_end_xfer                                (d1_buttons_s1_end_xfer),
      .reset_n                                               (pll_io_reset_n)
    );

  buttons the_buttons
    (
      .address    (buttons_s1_address),
      .chipselect (buttons_s1_chipselect),
      .clk        (pll_io),
      .in_port    (in_port_to_the_buttons),
      .irq        (buttons_s1_irq),
      .readdata   (buttons_s1_readdata),
      .reset_n    (buttons_s1_reset_n),
      .write_n    (buttons_s1_write_n),
      .writedata  (buttons_s1_writedata)
    );

  clock_crossing_bridge_s1_arbitrator the_clock_crossing_bridge_s1
    (
      .clk                                                                     (pll_cpu),
      .clock_crossing_bridge_s1_address                                        (clock_crossing_bridge_s1_address),
      .clock_crossing_bridge_s1_byteenable                                     (clock_crossing_bridge_s1_byteenable),
      .clock_crossing_bridge_s1_endofpacket                                    (clock_crossing_bridge_s1_endofpacket),
      .clock_crossing_bridge_s1_endofpacket_from_sa                            (clock_crossing_bridge_s1_endofpacket_from_sa),
      .clock_crossing_bridge_s1_nativeaddress                                  (clock_crossing_bridge_s1_nativeaddress),
      .clock_crossing_bridge_s1_read                                           (clock_crossing_bridge_s1_read),
      .clock_crossing_bridge_s1_readdata                                       (clock_crossing_bridge_s1_readdata),
      .clock_crossing_bridge_s1_readdata_from_sa                               (clock_crossing_bridge_s1_readdata_from_sa),
      .clock_crossing_bridge_s1_readdatavalid                                  (clock_crossing_bridge_s1_readdatavalid),
      .clock_crossing_bridge_s1_reset_n                                        (clock_crossing_bridge_s1_reset_n),
      .clock_crossing_bridge_s1_waitrequest                                    (clock_crossing_bridge_s1_waitrequest),
      .clock_crossing_bridge_s1_waitrequest_from_sa                            (clock_crossing_bridge_s1_waitrequest_from_sa),
      .clock_crossing_bridge_s1_write                                          (clock_crossing_bridge_s1_write),
      .clock_crossing_bridge_s1_writedata                                      (clock_crossing_bridge_s1_writedata),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                              (cpu_data_master_byteenable),
      .cpu_data_master_granted_clock_crossing_bridge_s1                        (cpu_data_master_granted_clock_crossing_bridge_s1),
      .cpu_data_master_qualified_request_clock_crossing_bridge_s1              (cpu_data_master_qualified_request_clock_crossing_bridge_s1),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_clock_crossing_bridge_s1                (cpu_data_master_read_data_valid_clock_crossing_bridge_s1),
      .cpu_data_master_read_data_valid_clock_crossing_bridge_s1_shift_register (cpu_data_master_read_data_valid_clock_crossing_bridge_s1_shift_register),
      .cpu_data_master_requests_clock_crossing_bridge_s1                       (cpu_data_master_requests_clock_crossing_bridge_s1),
      .cpu_data_master_waitrequest                                             (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_data_master_writedata                                               (cpu_data_master_writedata),
      .d1_clock_crossing_bridge_s1_end_xfer                                    (d1_clock_crossing_bridge_s1_end_xfer),
      .reset_n                                                                 (pll_cpu_reset_n)
    );

  clock_crossing_bridge_m1_arbitrator the_clock_crossing_bridge_m1
    (
      .DE0_SOPC_clock_1_in_endofpacket_from_sa                        (DE0_SOPC_clock_1_in_endofpacket_from_sa),
      .DE0_SOPC_clock_1_in_readdata_from_sa                           (DE0_SOPC_clock_1_in_readdata_from_sa),
      .DE0_SOPC_clock_1_in_waitrequest_from_sa                        (DE0_SOPC_clock_1_in_waitrequest_from_sa),
      .DE0_SOPC_clock_2_in_endofpacket_from_sa                        (DE0_SOPC_clock_2_in_endofpacket_from_sa),
      .DE0_SOPC_clock_2_in_readdata_from_sa                           (DE0_SOPC_clock_2_in_readdata_from_sa),
      .DE0_SOPC_clock_2_in_waitrequest_from_sa                        (DE0_SOPC_clock_2_in_waitrequest_from_sa),
      .buttons_s1_readdata_from_sa                                    (buttons_s1_readdata_from_sa),
      .clk                                                            (pll_io),
      .clock_crossing_bridge_m1_address                               (clock_crossing_bridge_m1_address),
      .clock_crossing_bridge_m1_address_to_slave                      (clock_crossing_bridge_m1_address_to_slave),
      .clock_crossing_bridge_m1_byteenable                            (clock_crossing_bridge_m1_byteenable),
      .clock_crossing_bridge_m1_endofpacket                           (clock_crossing_bridge_m1_endofpacket),
      .clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in           (clock_crossing_bridge_m1_granted_DE0_SOPC_clock_1_in),
      .clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in           (clock_crossing_bridge_m1_granted_DE0_SOPC_clock_2_in),
      .clock_crossing_bridge_m1_granted_buttons_s1                    (clock_crossing_bridge_m1_granted_buttons_s1),
      .clock_crossing_bridge_m1_granted_lcd_control_slave             (clock_crossing_bridge_m1_granted_lcd_control_slave),
      .clock_crossing_bridge_m1_granted_lcd_light_s1                  (clock_crossing_bridge_m1_granted_lcd_light_s1),
      .clock_crossing_bridge_m1_granted_leds_s1                       (clock_crossing_bridge_m1_granted_leds_s1),
      .clock_crossing_bridge_m1_granted_seg7_s1                       (clock_crossing_bridge_m1_granted_seg7_s1),
      .clock_crossing_bridge_m1_granted_switches_s1                   (clock_crossing_bridge_m1_granted_switches_s1),
      .clock_crossing_bridge_m1_granted_sysid_control_slave           (clock_crossing_bridge_m1_granted_sysid_control_slave),
      .clock_crossing_bridge_m1_granted_timer_s1                      (clock_crossing_bridge_m1_granted_timer_s1),
      .clock_crossing_bridge_m1_granted_uart_s1                       (clock_crossing_bridge_m1_granted_uart_s1),
      .clock_crossing_bridge_m1_latency_counter                       (clock_crossing_bridge_m1_latency_counter),
      .clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in (clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_1_in),
      .clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in (clock_crossing_bridge_m1_qualified_request_DE0_SOPC_clock_2_in),
      .clock_crossing_bridge_m1_qualified_request_buttons_s1          (clock_crossing_bridge_m1_qualified_request_buttons_s1),
      .clock_crossing_bridge_m1_qualified_request_lcd_control_slave   (clock_crossing_bridge_m1_qualified_request_lcd_control_slave),
      .clock_crossing_bridge_m1_qualified_request_lcd_light_s1        (clock_crossing_bridge_m1_qualified_request_lcd_light_s1),
      .clock_crossing_bridge_m1_qualified_request_leds_s1             (clock_crossing_bridge_m1_qualified_request_leds_s1),
      .clock_crossing_bridge_m1_qualified_request_seg7_s1             (clock_crossing_bridge_m1_qualified_request_seg7_s1),
      .clock_crossing_bridge_m1_qualified_request_switches_s1         (clock_crossing_bridge_m1_qualified_request_switches_s1),
      .clock_crossing_bridge_m1_qualified_request_sysid_control_slave (clock_crossing_bridge_m1_qualified_request_sysid_control_slave),
      .clock_crossing_bridge_m1_qualified_request_timer_s1            (clock_crossing_bridge_m1_qualified_request_timer_s1),
      .clock_crossing_bridge_m1_qualified_request_uart_s1             (clock_crossing_bridge_m1_qualified_request_uart_s1),
      .clock_crossing_bridge_m1_read                                  (clock_crossing_bridge_m1_read),
      .clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in   (clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_1_in),
      .clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in   (clock_crossing_bridge_m1_read_data_valid_DE0_SOPC_clock_2_in),
      .clock_crossing_bridge_m1_read_data_valid_buttons_s1            (clock_crossing_bridge_m1_read_data_valid_buttons_s1),
      .clock_crossing_bridge_m1_read_data_valid_lcd_control_slave     (clock_crossing_bridge_m1_read_data_valid_lcd_control_slave),
      .clock_crossing_bridge_m1_read_data_valid_lcd_light_s1          (clock_crossing_bridge_m1_read_data_valid_lcd_light_s1),
      .clock_crossing_bridge_m1_read_data_valid_leds_s1               (clock_crossing_bridge_m1_read_data_valid_leds_s1),
      .clock_crossing_bridge_m1_read_data_valid_seg7_s1               (clock_crossing_bridge_m1_read_data_valid_seg7_s1),
      .clock_crossing_bridge_m1_read_data_valid_switches_s1           (clock_crossing_bridge_m1_read_data_valid_switches_s1),
      .clock_crossing_bridge_m1_read_data_valid_sysid_control_slave   (clock_crossing_bridge_m1_read_data_valid_sysid_control_slave),
      .clock_crossing_bridge_m1_read_data_valid_timer_s1              (clock_crossing_bridge_m1_read_data_valid_timer_s1),
      .clock_crossing_bridge_m1_read_data_valid_uart_s1               (clock_crossing_bridge_m1_read_data_valid_uart_s1),
      .clock_crossing_bridge_m1_readdata                              (clock_crossing_bridge_m1_readdata),
      .clock_crossing_bridge_m1_readdatavalid                         (clock_crossing_bridge_m1_readdatavalid),
      .clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in          (clock_crossing_bridge_m1_requests_DE0_SOPC_clock_1_in),
      .clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in          (clock_crossing_bridge_m1_requests_DE0_SOPC_clock_2_in),
      .clock_crossing_bridge_m1_requests_buttons_s1                   (clock_crossing_bridge_m1_requests_buttons_s1),
      .clock_crossing_bridge_m1_requests_lcd_control_slave            (clock_crossing_bridge_m1_requests_lcd_control_slave),
      .clock_crossing_bridge_m1_requests_lcd_light_s1                 (clock_crossing_bridge_m1_requests_lcd_light_s1),
      .clock_crossing_bridge_m1_requests_leds_s1                      (clock_crossing_bridge_m1_requests_leds_s1),
      .clock_crossing_bridge_m1_requests_seg7_s1                      (clock_crossing_bridge_m1_requests_seg7_s1),
      .clock_crossing_bridge_m1_requests_switches_s1                  (clock_crossing_bridge_m1_requests_switches_s1),
      .clock_crossing_bridge_m1_requests_sysid_control_slave          (clock_crossing_bridge_m1_requests_sysid_control_slave),
      .clock_crossing_bridge_m1_requests_timer_s1                     (clock_crossing_bridge_m1_requests_timer_s1),
      .clock_crossing_bridge_m1_requests_uart_s1                      (clock_crossing_bridge_m1_requests_uart_s1),
      .clock_crossing_bridge_m1_reset_n                               (clock_crossing_bridge_m1_reset_n),
      .clock_crossing_bridge_m1_waitrequest                           (clock_crossing_bridge_m1_waitrequest),
      .clock_crossing_bridge_m1_write                                 (clock_crossing_bridge_m1_write),
      .clock_crossing_bridge_m1_writedata                             (clock_crossing_bridge_m1_writedata),
      .d1_DE0_SOPC_clock_1_in_end_xfer                                (d1_DE0_SOPC_clock_1_in_end_xfer),
      .d1_DE0_SOPC_clock_2_in_end_xfer                                (d1_DE0_SOPC_clock_2_in_end_xfer),
      .d1_buttons_s1_end_xfer                                         (d1_buttons_s1_end_xfer),
      .d1_lcd_control_slave_end_xfer                                  (d1_lcd_control_slave_end_xfer),
      .d1_lcd_light_s1_end_xfer                                       (d1_lcd_light_s1_end_xfer),
      .d1_leds_s1_end_xfer                                            (d1_leds_s1_end_xfer),
      .d1_seg7_s1_end_xfer                                            (d1_seg7_s1_end_xfer),
      .d1_switches_s1_end_xfer                                        (d1_switches_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                (d1_sysid_control_slave_end_xfer),
      .d1_timer_s1_end_xfer                                           (d1_timer_s1_end_xfer),
      .d1_uart_s1_end_xfer                                            (d1_uart_s1_end_xfer),
      .lcd_control_slave_readdata_from_sa                             (lcd_control_slave_readdata_from_sa),
      .lcd_control_slave_wait_counter_eq_0                            (lcd_control_slave_wait_counter_eq_0),
      .lcd_light_s1_readdata_from_sa                                  (lcd_light_s1_readdata_from_sa),
      .leds_s1_readdata_from_sa                                       (leds_s1_readdata_from_sa),
      .reset_n                                                        (pll_io_reset_n),
      .seg7_s1_readdata_from_sa                                       (seg7_s1_readdata_from_sa),
      .switches_s1_readdata_from_sa                                   (switches_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                           (sysid_control_slave_readdata_from_sa),
      .timer_s1_readdata_from_sa                                      (timer_s1_readdata_from_sa),
      .uart_s1_readdata_from_sa                                       (uart_s1_readdata_from_sa)
    );

  clock_crossing_bridge the_clock_crossing_bridge
    (
      .master_address       (clock_crossing_bridge_m1_address),
      .master_byteenable    (clock_crossing_bridge_m1_byteenable),
      .master_clk           (pll_io),
      .master_endofpacket   (clock_crossing_bridge_m1_endofpacket),
      .master_nativeaddress (clock_crossing_bridge_m1_nativeaddress),
      .master_read          (clock_crossing_bridge_m1_read),
      .master_readdata      (clock_crossing_bridge_m1_readdata),
      .master_readdatavalid (clock_crossing_bridge_m1_readdatavalid),
      .master_reset_n       (clock_crossing_bridge_m1_reset_n),
      .master_waitrequest   (clock_crossing_bridge_m1_waitrequest),
      .master_write         (clock_crossing_bridge_m1_write),
      .master_writedata     (clock_crossing_bridge_m1_writedata),
      .slave_address        (clock_crossing_bridge_s1_address),
      .slave_byteenable     (clock_crossing_bridge_s1_byteenable),
      .slave_clk            (pll_cpu),
      .slave_endofpacket    (clock_crossing_bridge_s1_endofpacket),
      .slave_nativeaddress  (clock_crossing_bridge_s1_nativeaddress),
      .slave_read           (clock_crossing_bridge_s1_read),
      .slave_readdata       (clock_crossing_bridge_s1_readdata),
      .slave_readdatavalid  (clock_crossing_bridge_s1_readdatavalid),
      .slave_reset_n        (clock_crossing_bridge_s1_reset_n),
      .slave_waitrequest    (clock_crossing_bridge_s1_waitrequest),
      .slave_write          (clock_crossing_bridge_s1_write),
      .slave_writedata      (clock_crossing_bridge_s1_writedata)
    );

  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                            (pll_cpu),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                    (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                  (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module        (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module          (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_jtag_debug_module                 (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_data_master_writedata                                      (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                  (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                            (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                               (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                               (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                              (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                 (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset_n                                  (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                             (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                     (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                    (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                        (pll_cpu_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .DE0_SOPC_clock_0_in_readdata_from_sa                                    (DE0_SOPC_clock_0_in_readdata_from_sa),
      .DE0_SOPC_clock_0_in_waitrequest_from_sa                                 (DE0_SOPC_clock_0_in_waitrequest_from_sa),
      .buttons_s1_irq_from_sa                                                  (buttons_s1_irq_from_sa),
      .cfi_flash_s1_wait_counter_eq_0                                          (cfi_flash_s1_wait_counter_eq_0),
      .cfi_flash_s1_wait_counter_eq_1                                          (cfi_flash_s1_wait_counter_eq_1),
      .clk                                                                     (pll_cpu),
      .clock_crossing_bridge_s1_readdata_from_sa                               (clock_crossing_bridge_s1_readdata_from_sa),
      .clock_crossing_bridge_s1_waitrequest_from_sa                            (clock_crossing_bridge_s1_waitrequest_from_sa),
      .cpu_data_master_address                                                 (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                        (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable_cfi_flash_s1                                 (cpu_data_master_byteenable_cfi_flash_s1),
      .cpu_data_master_byteenable_sdram_s1                                     (cpu_data_master_byteenable_sdram_s1),
      .cpu_data_master_dbs_address                                             (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                            (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_DE0_SOPC_clock_0_in                             (cpu_data_master_granted_DE0_SOPC_clock_0_in),
      .cpu_data_master_granted_cfi_flash_s1                                    (cpu_data_master_granted_cfi_flash_s1),
      .cpu_data_master_granted_clock_crossing_bridge_s1                        (cpu_data_master_granted_clock_crossing_bridge_s1),
      .cpu_data_master_granted_cpu_jtag_debug_module                           (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave                     (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_granted_onchip_mem_s1                                   (cpu_data_master_granted_onchip_mem_s1),
      .cpu_data_master_granted_sdram_s1                                        (cpu_data_master_granted_sdram_s1),
      .cpu_data_master_irq                                                     (cpu_data_master_irq),
      .cpu_data_master_no_byte_enables_and_last_term                           (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_DE0_SOPC_clock_0_in                   (cpu_data_master_qualified_request_DE0_SOPC_clock_0_in),
      .cpu_data_master_qualified_request_cfi_flash_s1                          (cpu_data_master_qualified_request_cfi_flash_s1),
      .cpu_data_master_qualified_request_clock_crossing_bridge_s1              (cpu_data_master_qualified_request_clock_crossing_bridge_s1),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                 (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave           (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_onchip_mem_s1                         (cpu_data_master_qualified_request_onchip_mem_s1),
      .cpu_data_master_qualified_request_sdram_s1                              (cpu_data_master_qualified_request_sdram_s1),
      .cpu_data_master_read                                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in                     (cpu_data_master_read_data_valid_DE0_SOPC_clock_0_in),
      .cpu_data_master_read_data_valid_cfi_flash_s1                            (cpu_data_master_read_data_valid_cfi_flash_s1),
      .cpu_data_master_read_data_valid_clock_crossing_bridge_s1                (cpu_data_master_read_data_valid_clock_crossing_bridge_s1),
      .cpu_data_master_read_data_valid_clock_crossing_bridge_s1_shift_register (cpu_data_master_read_data_valid_clock_crossing_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                   (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave             (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_onchip_mem_s1                           (cpu_data_master_read_data_valid_onchip_mem_s1),
      .cpu_data_master_read_data_valid_sdram_s1                                (cpu_data_master_read_data_valid_sdram_s1),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                 (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_readdata                                                (cpu_data_master_readdata),
      .cpu_data_master_requests_DE0_SOPC_clock_0_in                            (cpu_data_master_requests_DE0_SOPC_clock_0_in),
      .cpu_data_master_requests_cfi_flash_s1                                   (cpu_data_master_requests_cfi_flash_s1),
      .cpu_data_master_requests_clock_crossing_bridge_s1                       (cpu_data_master_requests_clock_crossing_bridge_s1),
      .cpu_data_master_requests_cpu_jtag_debug_module                          (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave                    (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_onchip_mem_s1                                  (cpu_data_master_requests_onchip_mem_s1),
      .cpu_data_master_requests_sdram_s1                                       (cpu_data_master_requests_sdram_s1),
      .cpu_data_master_waitrequest                                             (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                   (cpu_data_master_write),
      .cpu_data_master_writedata                                               (cpu_data_master_writedata),
      .cpu_jtag_debug_module_readdata_from_sa                                  (cpu_jtag_debug_module_readdata_from_sa),
      .d1_DE0_SOPC_clock_0_in_end_xfer                                         (d1_DE0_SOPC_clock_0_in_end_xfer),
      .d1_clock_crossing_bridge_s1_end_xfer                                    (d1_clock_crossing_bridge_s1_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                                       (d1_cpu_jtag_debug_module_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                                 (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_onchip_mem_s1_end_xfer                                               (d1_onchip_mem_s1_end_xfer),
      .d1_sdram_s1_end_xfer                                                    (d1_sdram_s1_end_xfer),
      .d1_tristate_bridge_avalon_slave_end_xfer                                (d1_tristate_bridge_avalon_slave_end_xfer),
      .incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0          (incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                                 (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                            (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                         (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .onchip_mem_s1_readdata_from_sa                                          (onchip_mem_s1_readdata_from_sa),
      .pll_cpu                                                                 (pll_cpu),
      .pll_cpu_reset_n                                                         (pll_cpu_reset_n),
      .registered_cpu_data_master_read_data_valid_cfi_flash_s1                 (registered_cpu_data_master_read_data_valid_cfi_flash_s1),
      .registered_cpu_data_master_read_data_valid_onchip_mem_s1                (registered_cpu_data_master_read_data_valid_onchip_mem_s1),
      .reset_n                                                                 (pll_cpu_reset_n),
      .sdram_s1_readdata_from_sa                                               (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                            (sdram_s1_waitrequest_from_sa),
      .switches_s1_irq_from_sa                                                 (switches_s1_irq_from_sa),
      .timer_0_s1_irq_from_sa                                                  (timer_0_s1_irq_from_sa),
      .timer_s1_irq_from_sa                                                    (timer_s1_irq_from_sa),
      .uart_s1_irq_from_sa                                                     (uart_s1_irq_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .cfi_flash_s1_wait_counter_eq_0                                 (cfi_flash_s1_wait_counter_eq_0),
      .cfi_flash_s1_wait_counter_eq_1                                 (cfi_flash_s1_wait_counter_eq_1),
      .clk                                                            (pll_cpu),
      .cpu_instruction_master_address                                 (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cfi_flash_s1                    (cpu_instruction_master_granted_cfi_flash_s1),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_onchip_mem_s1                   (cpu_instruction_master_granted_onchip_mem_s1),
      .cpu_instruction_master_granted_sdram_s1                        (cpu_instruction_master_granted_sdram_s1),
      .cpu_instruction_master_qualified_request_cfi_flash_s1          (cpu_instruction_master_qualified_request_cfi_flash_s1),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_onchip_mem_s1         (cpu_instruction_master_qualified_request_onchip_mem_s1),
      .cpu_instruction_master_qualified_request_sdram_s1              (cpu_instruction_master_qualified_request_sdram_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cfi_flash_s1            (cpu_instruction_master_read_data_valid_cfi_flash_s1),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_onchip_mem_s1           (cpu_instruction_master_read_data_valid_onchip_mem_s1),
      .cpu_instruction_master_read_data_valid_sdram_s1                (cpu_instruction_master_read_data_valid_sdram_s1),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_readdata                                (cpu_instruction_master_readdata),
      .cpu_instruction_master_requests_cfi_flash_s1                   (cpu_instruction_master_requests_cfi_flash_s1),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_onchip_mem_s1                  (cpu_instruction_master_requests_onchip_mem_s1),
      .cpu_instruction_master_requests_sdram_s1                       (cpu_instruction_master_requests_sdram_s1),
      .cpu_instruction_master_waitrequest                             (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .d1_onchip_mem_s1_end_xfer                                      (d1_onchip_mem_s1_end_xfer),
      .d1_sdram_s1_end_xfer                                           (d1_sdram_s1_end_xfer),
      .d1_tristate_bridge_avalon_slave_end_xfer                       (d1_tristate_bridge_avalon_slave_end_xfer),
      .incoming_data_to_and_from_the_cfi_flash                        (incoming_data_to_and_from_the_cfi_flash),
      .onchip_mem_s1_readdata_from_sa                                 (onchip_mem_s1_readdata_from_sa),
      .reset_n                                                        (pll_cpu_reset_n),
      .sdram_s1_readdata_from_sa                                      (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                   (sdram_s1_waitrequest_from_sa)
    );

  cpu the_cpu
    (
      .clk                                   (pll_cpu),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                           (pll_cpu),
      .cpu_data_master_address_to_slave                              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave           (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave   (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave          (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_waitrequest                                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                                         (cpu_data_master_write),
      .cpu_data_master_writedata                                     (cpu_data_master_writedata),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                       (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .jtag_uart_avalon_jtag_slave_address                           (jtag_uart_avalon_jtag_slave_address),
      .jtag_uart_avalon_jtag_slave_chipselect                        (jtag_uart_avalon_jtag_slave_chipselect),
      .jtag_uart_avalon_jtag_slave_dataavailable                     (jtag_uart_avalon_jtag_slave_dataavailable),
      .jtag_uart_avalon_jtag_slave_dataavailable_from_sa             (jtag_uart_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_avalon_jtag_slave_irq                               (jtag_uart_avalon_jtag_slave_irq),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                       (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_read_n                            (jtag_uart_avalon_jtag_slave_read_n),
      .jtag_uart_avalon_jtag_slave_readdata                          (jtag_uart_avalon_jtag_slave_readdata),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                  (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readyfordata                      (jtag_uart_avalon_jtag_slave_readyfordata),
      .jtag_uart_avalon_jtag_slave_readyfordata_from_sa              (jtag_uart_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_avalon_jtag_slave_reset_n                           (jtag_uart_avalon_jtag_slave_reset_n),
      .jtag_uart_avalon_jtag_slave_waitrequest                       (jtag_uart_avalon_jtag_slave_waitrequest),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa               (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_avalon_jtag_slave_write_n                           (jtag_uart_avalon_jtag_slave_write_n),
      .jtag_uart_avalon_jtag_slave_writedata                         (jtag_uart_avalon_jtag_slave_writedata),
      .reset_n                                                       (pll_cpu_reset_n)
    );

  jtag_uart the_jtag_uart
    (
      .av_address     (jtag_uart_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_avalon_jtag_slave_writedata),
      .clk            (pll_cpu),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  lcd_control_slave_arbitrator the_lcd_control_slave
    (
      .clk                                                          (pll_io),
      .clock_crossing_bridge_m1_address_to_slave                    (clock_crossing_bridge_m1_address_to_slave),
      .clock_crossing_bridge_m1_byteenable                          (clock_crossing_bridge_m1_byteenable),
      .clock_crossing_bridge_m1_granted_lcd_control_slave           (clock_crossing_bridge_m1_granted_lcd_control_slave),
      .clock_crossing_bridge_m1_latency_counter                     (clock_crossing_bridge_m1_latency_counter),
      .clock_crossing_bridge_m1_nativeaddress                       (clock_crossing_bridge_m1_nativeaddress),
      .clock_crossing_bridge_m1_qualified_request_lcd_control_slave (clock_crossing_bridge_m1_qualified_request_lcd_control_slave),
      .clock_crossing_bridge_m1_read                                (clock_crossing_bridge_m1_read),
      .clock_crossing_bridge_m1_read_data_valid_lcd_control_slave   (clock_crossing_bridge_m1_read_data_valid_lcd_control_slave),
      .clock_crossing_bridge_m1_requests_lcd_control_slave          (clock_crossing_bridge_m1_requests_lcd_control_slave),
      .clock_crossing_bridge_m1_write                               (clock_crossing_bridge_m1_write),
      .clock_crossing_bridge_m1_writedata                           (clock_crossing_bridge_m1_writedata),
      .d1_lcd_control_slave_end_xfer                                (d1_lcd_control_slave_end_xfer),
      .lcd_control_slave_address                                    (lcd_control_slave_address),
      .lcd_control_slave_begintransfer                              (lcd_control_slave_begintransfer),
      .lcd_control_slave_read                                       (lcd_control_slave_read),
      .lcd_control_slave_readdata                                   (lcd_control_slave_readdata),
      .lcd_control_slave_readdata_from_sa                           (lcd_control_slave_readdata_from_sa),
      .lcd_control_slave_reset_n                                    (lcd_control_slave_reset_n),
      .lcd_control_slave_wait_counter_eq_0                          (lcd_control_slave_wait_counter_eq_0),
      .lcd_control_slave_write                                      (lcd_control_slave_write),
      .lcd_control_slave_writedata                                  (lcd_control_slave_writedata),
      .reset_n                                                      (pll_io_reset_n)
    );

  lcd the_lcd
    (
      .LCD_E         (LCD_E_from_the_lcd),
      .LCD_RS        (LCD_RS_from_the_lcd),
      .LCD_RW        (LCD_RW_from_the_lcd),
      .LCD_data      (LCD_data_to_and_from_the_lcd),
      .address       (lcd_control_slave_address),
      .begintransfer (lcd_control_slave_begintransfer),
      .clk           (pll_io),
      .read          (lcd_control_slave_read),
      .readdata      (lcd_control_slave_readdata),
      .reset_n       (lcd_control_slave_reset_n),
      .write         (lcd_control_slave_write),
      .writedata     (lcd_control_slave_writedata)
    );

  lcd_light_s1_arbitrator the_lcd_light_s1
    (
      .clk                                                     (pll_io),
      .clock_crossing_bridge_m1_address_to_slave               (clock_crossing_bridge_m1_address_to_slave),
      .clock_crossing_bridge_m1_granted_lcd_light_s1           (clock_crossing_bridge_m1_granted_lcd_light_s1),
      .clock_crossing_bridge_m1_latency_counter                (clock_crossing_bridge_m1_latency_counter),
      .clock_crossing_bridge_m1_nativeaddress                  (clock_crossing_bridge_m1_nativeaddress),
      .clock_crossing_bridge_m1_qualified_request_lcd_light_s1 (clock_crossing_bridge_m1_qualified_request_lcd_light_s1),
      .clock_crossing_bridge_m1_read                           (clock_crossing_bridge_m1_read),
      .clock_crossing_bridge_m1_read_data_valid_lcd_light_s1   (clock_crossing_bridge_m1_read_data_valid_lcd_light_s1),
      .clock_crossing_bridge_m1_requests_lcd_light_s1          (clock_crossing_bridge_m1_requests_lcd_light_s1),
      .clock_crossing_bridge_m1_write                          (clock_crossing_bridge_m1_write),
      .clock_crossing_bridge_m1_writedata                      (clock_crossing_bridge_m1_writedata),
      .d1_lcd_light_s1_end_xfer                                (d1_lcd_light_s1_end_xfer),
      .lcd_light_s1_address                                    (lcd_light_s1_address),
      .lcd_light_s1_chipselect                                 (lcd_light_s1_chipselect),
      .lcd_light_s1_readdata                                   (lcd_light_s1_readdata),
      .lcd_light_s1_readdata_from_sa                           (lcd_light_s1_readdata_from_sa),
      .lcd_light_s1_reset_n                                    (lcd_light_s1_reset_n),
      .lcd_light_s1_write_n                                    (lcd_light_s1_write_n),
      .lcd_light_s1_writedata                                  (lcd_light_s1_writedata),
      .reset_n                                                 (pll_io_reset_n)
    );

  lcd_light the_lcd_light
    (
      .address    (lcd_light_s1_address),
      .chipselect (lcd_light_s1_chipselect),
      .clk        (pll_io),
      .out_port   (out_port_from_the_lcd_light),
      .readdata   (lcd_light_s1_readdata),
      .reset_n    (lcd_light_s1_reset_n),
      .write_n    (lcd_light_s1_write_n),
      .writedata  (lcd_light_s1_writedata)
    );

  leds_s1_arbitrator the_leds_s1
    (
      .clk                                                (pll_io),
      .clock_crossing_bridge_m1_address_to_slave          (clock_crossing_bridge_m1_address_to_slave),
      .clock_crossing_bridge_m1_granted_leds_s1           (clock_crossing_bridge_m1_granted_leds_s1),
      .clock_crossing_bridge_m1_latency_counter           (clock_crossing_bridge_m1_latency_counter),
      .clock_crossing_bridge_m1_nativeaddress             (clock_crossing_bridge_m1_nativeaddress),
      .clock_crossing_bridge_m1_qualified_request_leds_s1 (clock_crossing_bridge_m1_qualified_request_leds_s1),
      .clock_crossing_bridge_m1_read                      (clock_crossing_bridge_m1_read),
      .clock_crossing_bridge_m1_read_data_valid_leds_s1   (clock_crossing_bridge_m1_read_data_valid_leds_s1),
      .clock_crossing_bridge_m1_requests_leds_s1          (clock_crossing_bridge_m1_requests_leds_s1),
      .clock_crossing_bridge_m1_write                     (clock_crossing_bridge_m1_write),
      .clock_crossing_bridge_m1_writedata                 (clock_crossing_bridge_m1_writedata),
      .d1_leds_s1_end_xfer                                (d1_leds_s1_end_xfer),
      .leds_s1_address                                    (leds_s1_address),
      .leds_s1_chipselect                                 (leds_s1_chipselect),
      .leds_s1_readdata                                   (leds_s1_readdata),
      .leds_s1_readdata_from_sa                           (leds_s1_readdata_from_sa),
      .leds_s1_reset_n                                    (leds_s1_reset_n),
      .leds_s1_write_n                                    (leds_s1_write_n),
      .leds_s1_writedata                                  (leds_s1_writedata),
      .reset_n                                            (pll_io_reset_n)
    );

  leds the_leds
    (
      .address    (leds_s1_address),
      .chipselect (leds_s1_chipselect),
      .clk        (pll_io),
      .out_port   (out_port_from_the_leds),
      .readdata   (leds_s1_readdata),
      .reset_n    (leds_s1_reset_n),
      .write_n    (leds_s1_write_n),
      .writedata  (leds_s1_writedata)
    );

  onchip_mem_s1_arbitrator the_onchip_mem_s1
    (
      .clk                                                      (pll_cpu),
      .cpu_data_master_address_to_slave                         (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                               (cpu_data_master_byteenable),
      .cpu_data_master_granted_onchip_mem_s1                    (cpu_data_master_granted_onchip_mem_s1),
      .cpu_data_master_qualified_request_onchip_mem_s1          (cpu_data_master_qualified_request_onchip_mem_s1),
      .cpu_data_master_read                                     (cpu_data_master_read),
      .cpu_data_master_read_data_valid_onchip_mem_s1            (cpu_data_master_read_data_valid_onchip_mem_s1),
      .cpu_data_master_requests_onchip_mem_s1                   (cpu_data_master_requests_onchip_mem_s1),
      .cpu_data_master_waitrequest                              (cpu_data_master_waitrequest),
      .cpu_data_master_write                                    (cpu_data_master_write),
      .cpu_data_master_writedata                                (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                  (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_onchip_mem_s1             (cpu_instruction_master_granted_onchip_mem_s1),
      .cpu_instruction_master_qualified_request_onchip_mem_s1   (cpu_instruction_master_qualified_request_onchip_mem_s1),
      .cpu_instruction_master_read                              (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_onchip_mem_s1     (cpu_instruction_master_read_data_valid_onchip_mem_s1),
      .cpu_instruction_master_requests_onchip_mem_s1            (cpu_instruction_master_requests_onchip_mem_s1),
      .d1_onchip_mem_s1_end_xfer                                (d1_onchip_mem_s1_end_xfer),
      .onchip_mem_s1_address                                    (onchip_mem_s1_address),
      .onchip_mem_s1_byteenable                                 (onchip_mem_s1_byteenable),
      .onchip_mem_s1_chipselect                                 (onchip_mem_s1_chipselect),
      .onchip_mem_s1_clken                                      (onchip_mem_s1_clken),
      .onchip_mem_s1_readdata                                   (onchip_mem_s1_readdata),
      .onchip_mem_s1_readdata_from_sa                           (onchip_mem_s1_readdata_from_sa),
      .onchip_mem_s1_reset                                      (onchip_mem_s1_reset),
      .onchip_mem_s1_write                                      (onchip_mem_s1_write),
      .onchip_mem_s1_writedata                                  (onchip_mem_s1_writedata),
      .registered_cpu_data_master_read_data_valid_onchip_mem_s1 (registered_cpu_data_master_read_data_valid_onchip_mem_s1),
      .reset_n                                                  (pll_cpu_reset_n)
    );

  onchip_mem the_onchip_mem
    (
      .address    (onchip_mem_s1_address),
      .byteenable (onchip_mem_s1_byteenable),
      .chipselect (onchip_mem_s1_chipselect),
      .clk        (pll_cpu),
      .clken      (onchip_mem_s1_clken),
      .readdata   (onchip_mem_s1_readdata),
      .reset      (onchip_mem_s1_reset),
      .write      (onchip_mem_s1_write),
      .writedata  (onchip_mem_s1_writedata)
    );

  pll_s1_arbitrator the_pll_s1
    (
      .DE0_SOPC_clock_0_out_address_to_slave         (DE0_SOPC_clock_0_out_address_to_slave),
      .DE0_SOPC_clock_0_out_granted_pll_s1           (DE0_SOPC_clock_0_out_granted_pll_s1),
      .DE0_SOPC_clock_0_out_nativeaddress            (DE0_SOPC_clock_0_out_nativeaddress),
      .DE0_SOPC_clock_0_out_qualified_request_pll_s1 (DE0_SOPC_clock_0_out_qualified_request_pll_s1),
      .DE0_SOPC_clock_0_out_read                     (DE0_SOPC_clock_0_out_read),
      .DE0_SOPC_clock_0_out_read_data_valid_pll_s1   (DE0_SOPC_clock_0_out_read_data_valid_pll_s1),
      .DE0_SOPC_clock_0_out_requests_pll_s1          (DE0_SOPC_clock_0_out_requests_pll_s1),
      .DE0_SOPC_clock_0_out_write                    (DE0_SOPC_clock_0_out_write),
      .DE0_SOPC_clock_0_out_writedata                (DE0_SOPC_clock_0_out_writedata),
      .clk                                           (clk),
      .d1_pll_s1_end_xfer                            (d1_pll_s1_end_xfer),
      .pll_s1_address                                (pll_s1_address),
      .pll_s1_chipselect                             (pll_s1_chipselect),
      .pll_s1_read                                   (pll_s1_read),
      .pll_s1_readdata                               (pll_s1_readdata),
      .pll_s1_readdata_from_sa                       (pll_s1_readdata_from_sa),
      .pll_s1_reset_n                                (pll_s1_reset_n),
      .pll_s1_resetrequest                           (pll_s1_resetrequest),
      .pll_s1_resetrequest_from_sa                   (pll_s1_resetrequest_from_sa),
      .pll_s1_write                                  (pll_s1_write),
      .pll_s1_writedata                              (pll_s1_writedata),
      .reset_n                                       (clk_reset_n)
    );

  //pll_cpu out_clk assignment, which is an e_assign
  assign pll_cpu = out_clk_pll_c0;

  //pll_sdram out_clk assignment, which is an e_assign
  assign pll_sdram = out_clk_pll_c1;

  //pll_io out_clk assignment, which is an e_assign
  assign pll_io = out_clk_pll_c2;

  //pll_vga out_clk assignment, which is an e_assign
  assign pll_vga = out_clk_pll_c3;

  pll the_pll
    (
      .address      (pll_s1_address),
      .c0           (out_clk_pll_c0),
      .c1           (out_clk_pll_c1),
      .c2           (out_clk_pll_c2),
      .c3           (out_clk_pll_c3),
      .chipselect   (pll_s1_chipselect),
      .clk          (clk),
      .read         (pll_s1_read),
      .readdata     (pll_s1_readdata),
      .reset_n      (pll_s1_reset_n),
      .resetrequest (pll_s1_resetrequest),
      .write        (pll_s1_write),
      .writedata    (pll_s1_writedata)
    );

  sdram_s1_arbitrator the_sdram_s1
    (
      .clk                                                            (pll_cpu),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_sdram_s1                            (cpu_data_master_byteenable_sdram_s1),
      .cpu_data_master_dbs_address                                    (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                   (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_sdram_s1                               (cpu_data_master_granted_sdram_s1),
      .cpu_data_master_no_byte_enables_and_last_term                  (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_sdram_s1                     (cpu_data_master_qualified_request_sdram_s1),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sdram_s1                       (cpu_data_master_read_data_valid_sdram_s1),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register        (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_sdram_s1                              (cpu_data_master_requests_sdram_s1),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_sdram_s1                        (cpu_instruction_master_granted_sdram_s1),
      .cpu_instruction_master_qualified_request_sdram_s1              (cpu_instruction_master_qualified_request_sdram_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_sdram_s1                (cpu_instruction_master_read_data_valid_sdram_s1),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_requests_sdram_s1                       (cpu_instruction_master_requests_sdram_s1),
      .d1_sdram_s1_end_xfer                                           (d1_sdram_s1_end_xfer),
      .reset_n                                                        (pll_cpu_reset_n),
      .sdram_s1_address                                               (sdram_s1_address),
      .sdram_s1_byteenable_n                                          (sdram_s1_byteenable_n),
      .sdram_s1_chipselect                                            (sdram_s1_chipselect),
      .sdram_s1_read_n                                                (sdram_s1_read_n),
      .sdram_s1_readdata                                              (sdram_s1_readdata),
      .sdram_s1_readdata_from_sa                                      (sdram_s1_readdata_from_sa),
      .sdram_s1_readdatavalid                                         (sdram_s1_readdatavalid),
      .sdram_s1_reset_n                                               (sdram_s1_reset_n),
      .sdram_s1_waitrequest                                           (sdram_s1_waitrequest),
      .sdram_s1_waitrequest_from_sa                                   (sdram_s1_waitrequest_from_sa),
      .sdram_s1_write_n                                               (sdram_s1_write_n),
      .sdram_s1_writedata                                             (sdram_s1_writedata)
    );

  sdram the_sdram
    (
      .az_addr        (sdram_s1_address),
      .az_be_n        (sdram_s1_byteenable_n),
      .az_cs          (sdram_s1_chipselect),
      .az_data        (sdram_s1_writedata),
      .az_rd_n        (sdram_s1_read_n),
      .az_wr_n        (sdram_s1_write_n),
      .clk            (pll_cpu),
      .reset_n        (sdram_s1_reset_n),
      .za_data        (sdram_s1_readdata),
      .za_valid       (sdram_s1_readdatavalid),
      .za_waitrequest (sdram_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram),
      .zs_ba          (zs_ba_from_the_sdram),
      .zs_cas_n       (zs_cas_n_from_the_sdram),
      .zs_cke         (zs_cke_from_the_sdram),
      .zs_cs_n        (zs_cs_n_from_the_sdram),
      .zs_dq          (zs_dq_to_and_from_the_sdram),
      .zs_dqm         (zs_dqm_from_the_sdram),
      .zs_ras_n       (zs_ras_n_from_the_sdram),
      .zs_we_n        (zs_we_n_from_the_sdram)
    );

  seg7_s1_arbitrator the_seg7_s1
    (
      .clk                                                (pll_io),
      .clock_crossing_bridge_m1_address_to_slave          (clock_crossing_bridge_m1_address_to_slave),
      .clock_crossing_bridge_m1_granted_seg7_s1           (clock_crossing_bridge_m1_granted_seg7_s1),
      .clock_crossing_bridge_m1_latency_counter           (clock_crossing_bridge_m1_latency_counter),
      .clock_crossing_bridge_m1_nativeaddress             (clock_crossing_bridge_m1_nativeaddress),
      .clock_crossing_bridge_m1_qualified_request_seg7_s1 (clock_crossing_bridge_m1_qualified_request_seg7_s1),
      .clock_crossing_bridge_m1_read                      (clock_crossing_bridge_m1_read),
      .clock_crossing_bridge_m1_read_data_valid_seg7_s1   (clock_crossing_bridge_m1_read_data_valid_seg7_s1),
      .clock_crossing_bridge_m1_requests_seg7_s1          (clock_crossing_bridge_m1_requests_seg7_s1),
      .clock_crossing_bridge_m1_write                     (clock_crossing_bridge_m1_write),
      .clock_crossing_bridge_m1_writedata                 (clock_crossing_bridge_m1_writedata),
      .d1_seg7_s1_end_xfer                                (d1_seg7_s1_end_xfer),
      .reset_n                                            (pll_io_reset_n),
      .seg7_s1_address                                    (seg7_s1_address),
      .seg7_s1_chipselect                                 (seg7_s1_chipselect),
      .seg7_s1_readdata                                   (seg7_s1_readdata),
      .seg7_s1_readdata_from_sa                           (seg7_s1_readdata_from_sa),
      .seg7_s1_reset_n                                    (seg7_s1_reset_n),
      .seg7_s1_write_n                                    (seg7_s1_write_n),
      .seg7_s1_writedata                                  (seg7_s1_writedata)
    );

  seg7 the_seg7
    (
      .address    (seg7_s1_address),
      .chipselect (seg7_s1_chipselect),
      .clk        (pll_io),
      .out_port   (out_port_from_the_seg7),
      .readdata   (seg7_s1_readdata),
      .reset_n    (seg7_s1_reset_n),
      .write_n    (seg7_s1_write_n),
      .writedata  (seg7_s1_writedata)
    );

  switches_s1_arbitrator the_switches_s1
    (
      .clk                                                    (pll_io),
      .clock_crossing_bridge_m1_address_to_slave              (clock_crossing_bridge_m1_address_to_slave),
      .clock_crossing_bridge_m1_granted_switches_s1           (clock_crossing_bridge_m1_granted_switches_s1),
      .clock_crossing_bridge_m1_latency_counter               (clock_crossing_bridge_m1_latency_counter),
      .clock_crossing_bridge_m1_nativeaddress                 (clock_crossing_bridge_m1_nativeaddress),
      .clock_crossing_bridge_m1_qualified_request_switches_s1 (clock_crossing_bridge_m1_qualified_request_switches_s1),
      .clock_crossing_bridge_m1_read                          (clock_crossing_bridge_m1_read),
      .clock_crossing_bridge_m1_read_data_valid_switches_s1   (clock_crossing_bridge_m1_read_data_valid_switches_s1),
      .clock_crossing_bridge_m1_requests_switches_s1          (clock_crossing_bridge_m1_requests_switches_s1),
      .clock_crossing_bridge_m1_write                         (clock_crossing_bridge_m1_write),
      .clock_crossing_bridge_m1_writedata                     (clock_crossing_bridge_m1_writedata),
      .d1_switches_s1_end_xfer                                (d1_switches_s1_end_xfer),
      .reset_n                                                (pll_io_reset_n),
      .switches_s1_address                                    (switches_s1_address),
      .switches_s1_chipselect                                 (switches_s1_chipselect),
      .switches_s1_irq                                        (switches_s1_irq),
      .switches_s1_irq_from_sa                                (switches_s1_irq_from_sa),
      .switches_s1_readdata                                   (switches_s1_readdata),
      .switches_s1_readdata_from_sa                           (switches_s1_readdata_from_sa),
      .switches_s1_reset_n                                    (switches_s1_reset_n),
      .switches_s1_write_n                                    (switches_s1_write_n),
      .switches_s1_writedata                                  (switches_s1_writedata)
    );

  switches the_switches
    (
      .address    (switches_s1_address),
      .chipselect (switches_s1_chipselect),
      .clk        (pll_io),
      .in_port    (in_port_to_the_switches),
      .irq        (switches_s1_irq),
      .readdata   (switches_s1_readdata),
      .reset_n    (switches_s1_reset_n),
      .write_n    (switches_s1_write_n),
      .writedata  (switches_s1_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                            (pll_io),
      .clock_crossing_bridge_m1_address_to_slave                      (clock_crossing_bridge_m1_address_to_slave),
      .clock_crossing_bridge_m1_granted_sysid_control_slave           (clock_crossing_bridge_m1_granted_sysid_control_slave),
      .clock_crossing_bridge_m1_latency_counter                       (clock_crossing_bridge_m1_latency_counter),
      .clock_crossing_bridge_m1_nativeaddress                         (clock_crossing_bridge_m1_nativeaddress),
      .clock_crossing_bridge_m1_qualified_request_sysid_control_slave (clock_crossing_bridge_m1_qualified_request_sysid_control_slave),
      .clock_crossing_bridge_m1_read                                  (clock_crossing_bridge_m1_read),
      .clock_crossing_bridge_m1_read_data_valid_sysid_control_slave   (clock_crossing_bridge_m1_read_data_valid_sysid_control_slave),
      .clock_crossing_bridge_m1_requests_sysid_control_slave          (clock_crossing_bridge_m1_requests_sysid_control_slave),
      .clock_crossing_bridge_m1_write                                 (clock_crossing_bridge_m1_write),
      .d1_sysid_control_slave_end_xfer                                (d1_sysid_control_slave_end_xfer),
      .reset_n                                                        (pll_io_reset_n),
      .sysid_control_slave_address                                    (sysid_control_slave_address),
      .sysid_control_slave_readdata                                   (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                           (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                                    (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  timer_s1_arbitrator the_timer_s1
    (
      .clk                                                 (pll_io),
      .clock_crossing_bridge_m1_address_to_slave           (clock_crossing_bridge_m1_address_to_slave),
      .clock_crossing_bridge_m1_granted_timer_s1           (clock_crossing_bridge_m1_granted_timer_s1),
      .clock_crossing_bridge_m1_latency_counter            (clock_crossing_bridge_m1_latency_counter),
      .clock_crossing_bridge_m1_nativeaddress              (clock_crossing_bridge_m1_nativeaddress),
      .clock_crossing_bridge_m1_qualified_request_timer_s1 (clock_crossing_bridge_m1_qualified_request_timer_s1),
      .clock_crossing_bridge_m1_read                       (clock_crossing_bridge_m1_read),
      .clock_crossing_bridge_m1_read_data_valid_timer_s1   (clock_crossing_bridge_m1_read_data_valid_timer_s1),
      .clock_crossing_bridge_m1_requests_timer_s1          (clock_crossing_bridge_m1_requests_timer_s1),
      .clock_crossing_bridge_m1_write                      (clock_crossing_bridge_m1_write),
      .clock_crossing_bridge_m1_writedata                  (clock_crossing_bridge_m1_writedata),
      .d1_timer_s1_end_xfer                                (d1_timer_s1_end_xfer),
      .reset_n                                             (pll_io_reset_n),
      .timer_s1_address                                    (timer_s1_address),
      .timer_s1_chipselect                                 (timer_s1_chipselect),
      .timer_s1_irq                                        (timer_s1_irq),
      .timer_s1_irq_from_sa                                (timer_s1_irq_from_sa),
      .timer_s1_readdata                                   (timer_s1_readdata),
      .timer_s1_readdata_from_sa                           (timer_s1_readdata_from_sa),
      .timer_s1_reset_n                                    (timer_s1_reset_n),
      .timer_s1_write_n                                    (timer_s1_write_n),
      .timer_s1_writedata                                  (timer_s1_writedata)
    );

  timer the_timer
    (
      .address    (timer_s1_address),
      .chipselect (timer_s1_chipselect),
      .clk        (pll_io),
      .irq        (timer_s1_irq),
      .readdata   (timer_s1_readdata),
      .reset_n    (timer_s1_reset_n),
      .write_n    (timer_s1_write_n),
      .writedata  (timer_s1_writedata)
    );

  timer_0_s1_arbitrator the_timer_0_s1
    (
      .DE0_SOPC_clock_1_out_address_to_slave             (DE0_SOPC_clock_1_out_address_to_slave),
      .DE0_SOPC_clock_1_out_granted_timer_0_s1           (DE0_SOPC_clock_1_out_granted_timer_0_s1),
      .DE0_SOPC_clock_1_out_nativeaddress                (DE0_SOPC_clock_1_out_nativeaddress),
      .DE0_SOPC_clock_1_out_qualified_request_timer_0_s1 (DE0_SOPC_clock_1_out_qualified_request_timer_0_s1),
      .DE0_SOPC_clock_1_out_read                         (DE0_SOPC_clock_1_out_read),
      .DE0_SOPC_clock_1_out_read_data_valid_timer_0_s1   (DE0_SOPC_clock_1_out_read_data_valid_timer_0_s1),
      .DE0_SOPC_clock_1_out_requests_timer_0_s1          (DE0_SOPC_clock_1_out_requests_timer_0_s1),
      .DE0_SOPC_clock_1_out_write                        (DE0_SOPC_clock_1_out_write),
      .DE0_SOPC_clock_1_out_writedata                    (DE0_SOPC_clock_1_out_writedata),
      .clk                                               (clk),
      .d1_timer_0_s1_end_xfer                            (d1_timer_0_s1_end_xfer),
      .reset_n                                           (clk_reset_n),
      .timer_0_s1_address                                (timer_0_s1_address),
      .timer_0_s1_chipselect                             (timer_0_s1_chipselect),
      .timer_0_s1_irq                                    (timer_0_s1_irq),
      .timer_0_s1_irq_from_sa                            (timer_0_s1_irq_from_sa),
      .timer_0_s1_readdata                               (timer_0_s1_readdata),
      .timer_0_s1_readdata_from_sa                       (timer_0_s1_readdata_from_sa),
      .timer_0_s1_reset_n                                (timer_0_s1_reset_n),
      .timer_0_s1_write_n                                (timer_0_s1_write_n),
      .timer_0_s1_writedata                              (timer_0_s1_writedata)
    );

  timer_0 the_timer_0
    (
      .address    (timer_0_s1_address),
      .chipselect (timer_0_s1_chipselect),
      .clk        (clk),
      .irq        (timer_0_s1_irq),
      .readdata   (timer_0_s1_readdata),
      .reset_n    (timer_0_s1_reset_n),
      .write_n    (timer_0_s1_write_n),
      .writedata  (timer_0_s1_writedata)
    );

  tristate_bridge_avalon_slave_arbitrator the_tristate_bridge_avalon_slave
    (
      .address_to_the_cfi_flash                                       (address_to_the_cfi_flash),
      .cfi_flash_s1_wait_counter_eq_0                                 (cfi_flash_s1_wait_counter_eq_0),
      .cfi_flash_s1_wait_counter_eq_1                                 (cfi_flash_s1_wait_counter_eq_1),
      .clk                                                            (pll_cpu),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_cfi_flash_s1                        (cpu_data_master_byteenable_cfi_flash_s1),
      .cpu_data_master_dbs_address                                    (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                   (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_cfi_flash_s1                           (cpu_data_master_granted_cfi_flash_s1),
      .cpu_data_master_no_byte_enables_and_last_term                  (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_cfi_flash_s1                 (cpu_data_master_qualified_request_cfi_flash_s1),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cfi_flash_s1                   (cpu_data_master_read_data_valid_cfi_flash_s1),
      .cpu_data_master_requests_cfi_flash_s1                          (cpu_data_master_requests_cfi_flash_s1),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cfi_flash_s1                    (cpu_instruction_master_granted_cfi_flash_s1),
      .cpu_instruction_master_qualified_request_cfi_flash_s1          (cpu_instruction_master_qualified_request_cfi_flash_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cfi_flash_s1            (cpu_instruction_master_read_data_valid_cfi_flash_s1),
      .cpu_instruction_master_requests_cfi_flash_s1                   (cpu_instruction_master_requests_cfi_flash_s1),
      .d1_tristate_bridge_avalon_slave_end_xfer                       (d1_tristate_bridge_avalon_slave_end_xfer),
      .data_to_and_from_the_cfi_flash                                 (data_to_and_from_the_cfi_flash),
      .incoming_data_to_and_from_the_cfi_flash                        (incoming_data_to_and_from_the_cfi_flash),
      .incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0 (incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0),
      .read_n_to_the_cfi_flash                                        (read_n_to_the_cfi_flash),
      .registered_cpu_data_master_read_data_valid_cfi_flash_s1        (registered_cpu_data_master_read_data_valid_cfi_flash_s1),
      .reset_n                                                        (pll_cpu_reset_n),
      .select_n_to_the_cfi_flash                                      (select_n_to_the_cfi_flash),
      .write_n_to_the_cfi_flash                                       (write_n_to_the_cfi_flash)
    );

  uart_s1_arbitrator the_uart_s1
    (
      .clk                                                (pll_io),
      .clock_crossing_bridge_m1_address_to_slave          (clock_crossing_bridge_m1_address_to_slave),
      .clock_crossing_bridge_m1_granted_uart_s1           (clock_crossing_bridge_m1_granted_uart_s1),
      .clock_crossing_bridge_m1_latency_counter           (clock_crossing_bridge_m1_latency_counter),
      .clock_crossing_bridge_m1_nativeaddress             (clock_crossing_bridge_m1_nativeaddress),
      .clock_crossing_bridge_m1_qualified_request_uart_s1 (clock_crossing_bridge_m1_qualified_request_uart_s1),
      .clock_crossing_bridge_m1_read                      (clock_crossing_bridge_m1_read),
      .clock_crossing_bridge_m1_read_data_valid_uart_s1   (clock_crossing_bridge_m1_read_data_valid_uart_s1),
      .clock_crossing_bridge_m1_requests_uart_s1          (clock_crossing_bridge_m1_requests_uart_s1),
      .clock_crossing_bridge_m1_write                     (clock_crossing_bridge_m1_write),
      .clock_crossing_bridge_m1_writedata                 (clock_crossing_bridge_m1_writedata),
      .d1_uart_s1_end_xfer                                (d1_uart_s1_end_xfer),
      .reset_n                                            (pll_io_reset_n),
      .uart_s1_address                                    (uart_s1_address),
      .uart_s1_begintransfer                              (uart_s1_begintransfer),
      .uart_s1_chipselect                                 (uart_s1_chipselect),
      .uart_s1_dataavailable                              (uart_s1_dataavailable),
      .uart_s1_dataavailable_from_sa                      (uart_s1_dataavailable_from_sa),
      .uart_s1_irq                                        (uart_s1_irq),
      .uart_s1_irq_from_sa                                (uart_s1_irq_from_sa),
      .uart_s1_read_n                                     (uart_s1_read_n),
      .uart_s1_readdata                                   (uart_s1_readdata),
      .uart_s1_readdata_from_sa                           (uart_s1_readdata_from_sa),
      .uart_s1_readyfordata                               (uart_s1_readyfordata),
      .uart_s1_readyfordata_from_sa                       (uart_s1_readyfordata_from_sa),
      .uart_s1_reset_n                                    (uart_s1_reset_n),
      .uart_s1_write_n                                    (uart_s1_write_n),
      .uart_s1_writedata                                  (uart_s1_writedata)
    );

  uart the_uart
    (
      .address       (uart_s1_address),
      .begintransfer (uart_s1_begintransfer),
      .chipselect    (uart_s1_chipselect),
      .clk           (pll_io),
      .dataavailable (uart_s1_dataavailable),
      .irq           (uart_s1_irq),
      .read_n        (uart_s1_read_n),
      .readdata      (uart_s1_readdata),
      .readyfordata  (uart_s1_readyfordata),
      .reset_n       (uart_s1_reset_n),
      .rxd           (rxd_to_the_uart),
      .txd           (txd_from_the_uart),
      .write_n       (uart_s1_write_n),
      .writedata     (uart_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  DE0_SOPC_reset_pll_cpu_domain_synch_module DE0_SOPC_reset_pll_cpu_domain_synch
    (
      .clk      (pll_cpu),
      .data_in  (1'b1),
      .data_out (pll_cpu_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    0 |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa |
    pll_s1_resetrequest_from_sa |
    pll_s1_resetrequest_from_sa);

  //reset is asserted asynchronously and deasserted synchronously
  DE0_SOPC_reset_pll_io_domain_synch_module DE0_SOPC_reset_pll_io_domain_synch
    (
      .clk      (pll_io),
      .data_in  (1'b1),
      .data_out (pll_io_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  DE0_SOPC_reset_clk_domain_synch_module DE0_SOPC_reset_clk_domain_synch
    (
      .clk      (clk),
      .data_in  (1'b1),
      .data_out (clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //DE0_SOPC_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_0_out_endofpacket = 0;

  //DE0_SOPC_clock_1_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_1_out_endofpacket = 0;

  //DE0_SOPC_clock_2_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign DE0_SOPC_clock_2_out_endofpacket = 0;

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_lane0_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 20: 0] rdaddress;
  input            rdclken;
  input   [ 20: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [2097151: 0];
  wire    [  7: 0] q;
  reg     [ 20: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash_lane0.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash_lane0.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 21,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_lane1_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 20: 0] rdaddress;
  input            rdclken;
  input   [ 20: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [2097151: 0];
  wire    [  7: 0] q;
  reg     [ 20: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash_lane1.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash_lane1.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 21,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash (
                   // inputs:
                    address,
                    read_n,
                    select_n,
                    write_n,

                   // outputs:
                    data
                 )
;

  inout   [ 15: 0] data;
  input   [ 20: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [ 15: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] data_1;
  wire    [ 15: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  wire    [  7: 0] q_1;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //cfi_flash_lane0, which is an e_ram
  cfi_flash_lane0_module cfi_flash_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data_1 = logic_vector_gasket[15 : 8];
  //cfi_flash_lane1, which is an e_ram
  cfi_flash_lane1_module cfi_flash_lane1
    (
      .data      (data_1),
      .q         (q_1),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? {q_1,
    q_0}: {16{1'bz}};


//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "/altera/11.0/quartus/eda/sim_lib/altera_mf.v"
`include "/altera/11.0/quartus/eda/sim_lib/220model.v"
`include "/altera/11.0/quartus/eda/sim_lib/sgate.v"
// /home/netlab/prhemery/year3/co-design/altera_up_sd_card_avalon_interface/hdl/Altera_UP_SD_Card_48_bit_Command_Generator.vhd
// /home/netlab/prhemery/year3/co-design/altera_up_sd_card_avalon_interface/hdl/Altera_UP_SD_Card_Avalon_Interface.vhd
// /home/netlab/prhemery/year3/co-design/altera_up_sd_card_avalon_interface/hdl/Altera_UP_SD_Card_Buffer.vhd
// /home/netlab/prhemery/year3/co-design/altera_up_sd_card_avalon_interface/hdl/Altera_UP_SD_Card_Clock.vhd
// /home/netlab/prhemery/year3/co-design/altera_up_sd_card_avalon_interface/hdl/Altera_UP_SD_Card_Control_FSM.vhd
// /home/netlab/prhemery/year3/co-design/altera_up_sd_card_avalon_interface/hdl/Altera_UP_SD_Card_Interface.vhd
// /home/netlab/prhemery/year3/co-design/altera_up_sd_card_avalon_interface/hdl/Altera_UP_SD_Card_Memory_Block.vhd
// /home/netlab/prhemery/year3/co-design/altera_up_sd_card_avalon_interface/hdl/Altera_UP_SD_Card_Response_Receiver.vhd
// /home/netlab/prhemery/year3/co-design/altera_up_sd_card_avalon_interface/hdl/Altera_UP_SD_CRC16_Generator.vhd
// /home/netlab/prhemery/year3/co-design/altera_up_sd_card_avalon_interface/hdl/Altera_UP_SD_CRC7_Generator.vhd
// /home/netlab/prhemery/year3/co-design/altera_up_sd_card_avalon_interface/hdl/Altera_UP_SD_Signal_Trigger.vhd
// SD_CARD_Interface.vhd
`include "pll.v"
`include "altpllpll.v"
`include "clock_crossing_bridge.v"
`include "leds.v"
`include "uart.v"
`include "DE0_SOPC_clock_1.v"
`include "timer_0.v"
`include "sdram.v"
`include "sdram_test_component.v"
`include "sysid.v"
`include "switches.v"
`include "timer.v"
`include "jtag_uart.v"
`include "lcd.v"
`include "DE0_SOPC_clock_0.v"
`include "cpu_test_bench.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "DE0_SOPC_clock_2.v"
`include "lcd_light.v"
`include "onchip_mem.v"
`include "seg7.v"
`include "buttons.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             DE0_SOPC_clock_0_in_endofpacket_from_sa;
  wire             DE0_SOPC_clock_0_out_endofpacket;
  wire             DE0_SOPC_clock_1_out_endofpacket;
  wire             DE0_SOPC_clock_2_out_endofpacket;
  wire    [  7: 0] DE0_SOPC_clock_2_out_nativeaddress;
  wire             LCD_E_from_the_lcd;
  wire             LCD_RS_from_the_lcd;
  wire             LCD_RW_from_the_lcd;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd;
  wire    [ 21: 0] address_to_the_cfi_flash;
  wire             b_SD_cmd_to_and_from_the_SD_CARD_Interface;
  wire             b_SD_dat3_to_and_from_the_SD_CARD_Interface;
  wire             b_SD_dat_to_and_from_the_SD_CARD_Interface;
  reg              clk;
  wire             clock_crossing_bridge_s1_endofpacket_from_sa;
  wire    [ 15: 0] data_to_and_from_the_cfi_flash;
  wire    [  2: 0] in_port_to_the_buttons;
  wire    [  9: 0] in_port_to_the_switches;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             o_SD_clock_from_the_SD_CARD_Interface;
  wire             out_port_from_the_lcd_light;
  wire    [  9: 0] out_port_from_the_leds;
  wire    [ 31: 0] out_port_from_the_seg7;
  wire             pll_cpu;
  wire             pll_io;
  wire             pll_sdram;
  wire             pll_vga;
  wire             read_n_to_the_cfi_flash;
  reg              reset_n;
  wire             rxd_to_the_uart;
  wire             select_n_to_the_cfi_flash;
  wire             sysid_control_slave_clock;
  wire             txd_from_the_uart;
  wire             uart_s1_dataavailable_from_sa;
  wire             uart_s1_readyfordata_from_sa;
  wire             write_n_to_the_cfi_flash;
  wire    [ 11: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram;
  wire    [  1: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  DE0_SOPC DUT
    (
      .LCD_E_from_the_lcd                          (LCD_E_from_the_lcd),
      .LCD_RS_from_the_lcd                         (LCD_RS_from_the_lcd),
      .LCD_RW_from_the_lcd                         (LCD_RW_from_the_lcd),
      .LCD_data_to_and_from_the_lcd                (LCD_data_to_and_from_the_lcd),
      .address_to_the_cfi_flash                    (address_to_the_cfi_flash),
      .b_SD_cmd_to_and_from_the_SD_CARD_Interface  (b_SD_cmd_to_and_from_the_SD_CARD_Interface),
      .b_SD_dat3_to_and_from_the_SD_CARD_Interface (b_SD_dat3_to_and_from_the_SD_CARD_Interface),
      .b_SD_dat_to_and_from_the_SD_CARD_Interface  (b_SD_dat_to_and_from_the_SD_CARD_Interface),
      .clk                                         (clk),
      .data_to_and_from_the_cfi_flash              (data_to_and_from_the_cfi_flash),
      .in_port_to_the_buttons                      (in_port_to_the_buttons),
      .in_port_to_the_switches                     (in_port_to_the_switches),
      .o_SD_clock_from_the_SD_CARD_Interface       (o_SD_clock_from_the_SD_CARD_Interface),
      .out_port_from_the_lcd_light                 (out_port_from_the_lcd_light),
      .out_port_from_the_leds                      (out_port_from_the_leds),
      .out_port_from_the_seg7                      (out_port_from_the_seg7),
      .pll_cpu                                     (pll_cpu),
      .pll_io                                      (pll_io),
      .pll_sdram                                   (pll_sdram),
      .pll_vga                                     (pll_vga),
      .read_n_to_the_cfi_flash                     (read_n_to_the_cfi_flash),
      .reset_n                                     (reset_n),
      .rxd_to_the_uart                             (rxd_to_the_uart),
      .select_n_to_the_cfi_flash                   (select_n_to_the_cfi_flash),
      .txd_from_the_uart                           (txd_from_the_uart),
      .write_n_to_the_cfi_flash                    (write_n_to_the_cfi_flash),
      .zs_addr_from_the_sdram                      (zs_addr_from_the_sdram),
      .zs_ba_from_the_sdram                        (zs_ba_from_the_sdram),
      .zs_cas_n_from_the_sdram                     (zs_cas_n_from_the_sdram),
      .zs_cke_from_the_sdram                       (zs_cke_from_the_sdram),
      .zs_cs_n_from_the_sdram                      (zs_cs_n_from_the_sdram),
      .zs_dq_to_and_from_the_sdram                 (zs_dq_to_and_from_the_sdram),
      .zs_dqm_from_the_sdram                       (zs_dqm_from_the_sdram),
      .zs_ras_n_from_the_sdram                     (zs_ras_n_from_the_sdram),
      .zs_we_n_from_the_sdram                      (zs_we_n_from_the_sdram)
    );

  cfi_flash the_cfi_flash
    (
      .address  (address_to_the_cfi_flash[21 : 1]),
      .data     (data_to_and_from_the_cfi_flash),
      .read_n   (read_n_to_the_cfi_flash),
      .select_n (select_n_to_the_cfi_flash),
      .write_n  (write_n_to_the_cfi_flash)
    );

  sdram_test_component the_sdram_test_component
    (
      .clk      (pll_cpu),
      .zs_addr  (zs_addr_from_the_sdram),
      .zs_ba    (zs_ba_from_the_sdram),
      .zs_cas_n (zs_cas_n_from_the_sdram),
      .zs_cke   (zs_cke_from_the_sdram),
      .zs_cs_n  (zs_cs_n_from_the_sdram),
      .zs_dq    (zs_dq_to_and_from_the_sdram),
      .zs_dqm   (zs_dqm_from_the_sdram),
      .zs_ras_n (zs_ras_n_from_the_sdram),
      .zs_we_n  (zs_we_n_from_the_sdram)
    );

  initial
    clk = 1'b0;
  always
    #10 clk <= ~clk;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on