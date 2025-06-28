class rst;
  virtual fsm_signals vif;

  function new(virtual fsm_signals vif);
    this.vif = vif;
  endfunction

  task rst_gen();
    vif.reset = 1;
    repeat(2) @(posedge vif.clock); 
    vif.reset = 0;
    $display("#time:%0t Info: Reset deasserted -- rst.svh", $time);
  endtask
endclass
