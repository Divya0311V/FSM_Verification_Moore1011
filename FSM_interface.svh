interface fsm_signals;
  logic clock; 
  logic reset; 
  logic sequence_in;
  logic detector_out; 
  logic [2:0] current_state;
  logic [2:0] next_state;
  parameter  Zero=3'b000, // "Zero" State
  One=3'b001,             // "One" State
  OneZero=3'b011,         // "OneZero" State
  OneZeroOne=3'b010,    // "OnceZeroOne" State
  OneZeroOneOne=3'b110;
endinterface
