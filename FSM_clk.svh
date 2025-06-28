//clock generation
class clk;
  virtual fsm_signals vif;
  function new(virtual fsm_signals vif);
    this.vif = vif;
  endfunction
  
  task clk_gen();
    forever begin
      #5 vif.clock = ~vif.clock;
    end
  endtask
endclass
