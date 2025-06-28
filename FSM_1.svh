class reset_on;
  virtual fsm_signals vif;

  function new(virtual fsm_signals vif);
    this.vif = vif;
  endfunction

  task reset_on_gen();
    forever @(posedge vif.clock) begin
      if (vif.reset == 1) begin
        if (vif.current_state == vif.Zero)
          $display("#time:%0t  Correct: FSM reset to Zero state -- FSM_1.svh", $time);
        else
          $error("#time:%0t  Error: FSM not in Zero state after reset -- FSM_1.svh", $time);
      end else begin
        if (vif.current_state == vif.next_state)
          $display("#time:%0t  Correct: FSM holds its state after reset released -- FSM_1.svh", $time);
        else
          $display("#time:%0t  Info: FSM is transitioning normally after reset -- FSM_1.svh", $time);
      end
    end
  endtask
endclass
