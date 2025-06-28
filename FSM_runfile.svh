class run;
  virtual fsm_signals vif;
  function new(virtual fsm_signals vif);
    this.vif = vif;
  endfunction
  
  task run_block();
    clk clk_h = new(vif);
    rst rst_h=new(vif);
    reset_on reset_on_h=new(vif);
    next_state_analyses next_state_analyses_h=new(vif);
    detector_out detector_out_h=new(vif);
    simulus simulus_h=new(vif);
    
    fork
      clk_h.clk_gen();
      rst_h.rst_gen();
      reset_on_h.reset_on_gen();
      next_state_analyses_h.next_state_analyses_check();
      detector_out_h.detection_gen();
      simulus_h.simulus_gen();
    join
  endtask
endclass
