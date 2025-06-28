`define stimulation_time #200
`include "FSM_interface.svh"
`include "FSM_package.svh"
import fsm_sgls::*;
module Sequence_Detector_MOORE_Verilog_top_tb();
  fsm_signals vif();
  Sequence_Detector_MOORE_Verilog dut(
    .clock(vif.clock),
    .reset(vif.reset),
    .sequence_in(vif.sequence_in),
    .detector_out(vif.detector_out),
    .current_state(vif.current_state), 
    .next_state(vif.next_state)
  );
  
   //initialization 
  initial begin
    vif.clock <= 0;
    vif.reset <= 1;
    vif.sequence_in <= 0;
    `stimulation_time;
    $finish;   
  end
  
    //run files
  initial begin
    automatic run run_h = new(vif);
    run_h.run_block();
  end
  
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
