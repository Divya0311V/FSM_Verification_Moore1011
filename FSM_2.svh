class next_state_analyses;
  virtual fsm_signals vif;

  function new(virtual fsm_signals vif);
    this.vif = vif;
  endfunction

  task next_state_analyses_check();
    forever @(posedge vif.clock) begin

      case (vif.current_state)

        vif.Zero: begin
          $display("Current state is Zero now");
          if(vif.sequence_in == 1) begin
            $display("zero case: sequence == 1");
            if(vif.next_state == vif.One) begin
              $display("#time:%0t Correct: next state as One in zero case", $time);
            end else begin
              $error("#time:%0t Wrong: next state not as One in zero case", $time);
            end
          end else begin
            $display("zero case: sequence == 0");
            if(vif.next_state == vif.Zero) begin
              $display("#time:%0t Correct: next state as Zero in zero case", $time);
            end else begin
              $error("#time:%0t Wrong: next state not as Zero in zero case", $time);
            end
          end
        end

        vif.One: begin
          $display("Current state is One now");
          if(vif.sequence_in == 0) begin
            $display("one case: sequence == 0");
            if(vif.next_state == vif.OneZero) begin
              $display("#time:%0t Correct: next state as OneZero in one case", $time);
            end else begin
              $error("#time:%0t Wrong: next state not as OneZero in one case", $time);
            end
          end else begin
            $display("one case: sequence == 1");
            if(vif.next_state == vif.One) begin
              $display("#time:%0t Correct: next state as One in one case", $time);
            end else begin
              $error("#time:%0t Wrong: next state not as One in one case", $time);
            end
          end
        end

        vif.OneZero: begin
          $display("Current state is OneZero now");
          if(vif.sequence_in == 0) begin
            $display("one case: sequence == 0");
            if(vif.next_state == vif.Zero) begin
              $display("#time:%0t Correct: next state as Zero in OneZero case ", $time);
            end else begin
              $error("#time:%0t Wrong: next state not as Zero in OneZero case", $time);
            end
          end else begin
            $display("one case: sequence == 1");
            if(vif.next_state == vif.OneZeroOne) begin
              $display("#time:%0t Correct: next state as OneZeroOne in OneZero case", $time);
            end else begin
              $error("#time:%0t Wrong: next state not as OneZeroOne in OneZero case", $time);
            end
          end
        end

        vif.OneZeroOne: begin
          $display("Current state is OneZeroOne now");
          if(vif.sequence_in == 0) begin
            $display("one case: sequence == 0");
            if(vif.next_state == vif.OneZero) begin
              $display("#time:%0t Correct: next state as OneZero in OneZeroOne case", $time);
            end else begin
              $error("#time:%0t Wrong: next state not as OneZero in OneZeroOne case", $time);
            end
          end else begin
            $display("one case: sequence == 1 ");
            if(vif.next_state == vif.OneZeroOneOne) begin
              $display("#time:%0t Correct: next state as OneZeroOneOne in OneZeroOne case", $time);
            end else begin
              $error("#time:%0t Wrong: next state not as OneZeroOneOne in OneZeroOne case", $time);
            end
          end
        end

        vif.OneZeroOneOne: begin
          $display("Current state is OneZeroOneOne now");
          if(vif.sequence_in == 0) begin
            $display("one case: sequence == 0");
            if(vif.next_state == vif.OneZero) begin
              $display("#time:%0t Correct: next state as OneZero in OneZeroOneOne case", $time);
            end else begin
              $error("#time:%0t Wrong: next state not as OneZero in OneZeroOneOne case", $time);
            end
          end else begin
            $display("one case: sequence == 1");
            if(vif.next_state == vif.One) begin
              $display("#time:%0t Correct: next state as One in OneZeroOneOne case", $time);
            end else begin
              $error("#time:%0t Wrong: next state not as One in OneZeroOneOne case", $time);
            end
          end
        end

        default: begin
          $error("#time:%0t Error: Unknown state", $time);
        end
      endcase

    end
  endtask
endclass
