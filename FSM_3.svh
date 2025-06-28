class detector_out;
  virtual fsm_signals vif;

  function new(virtual fsm_signals vif);
    this.vif = vif;
  endfunction

  task detection_gen();
    forever @(posedge vif.clock) begin
      case (vif.current_state)
        vif.Zero,
        vif.One,
        vif.OneZero,
        vif.OneZeroOne: begin
          if (vif.detector_out == 0)
            $display("#time:%0t Correct: detector_out = 0 in state %0d", $time, vif.current_state);
          else
            $error("#time:%0t Wrong: detector_out != 0 in state %0d", $time, vif.current_state);
        end

        vif.OneZeroOneOne: begin
          if (vif.detector_out == 1)
            $display("#time:%0t Correct: detector_out = 1 in OneZeroOneOne", $time);
          else
            $error("#time:%0t Wrong: detector_out != 1 in OneZeroOneOne", $time);
        end

        default:
          $display("#time:%0t Warning: Unknown state", $time);
      endcase
    end
  endtask
endclass
