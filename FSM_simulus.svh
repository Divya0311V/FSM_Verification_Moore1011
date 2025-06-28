class simulus;
  virtual fsm_signals vif;
  function new(virtual fsm_signals vif);
    this.vif = vif;
  endfunction

  task simulus_gen();
    @(posedge vif.clock); vif.sequence_in = 1; // "1"
    @(posedge vif.clock); vif.sequence_in = 0; // "0"
    @(posedge vif.clock); vif.sequence_in = 1; // "1"
    @(posedge vif.clock); vif.sequence_in = 1; // "1"
    @(posedge vif.clock); vif.sequence_in = 0; // "0" 
  endtask
endclass
