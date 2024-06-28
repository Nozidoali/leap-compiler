module simple(
    input wire clk,         // Clock signal
    input wire reset,       // Asynchronous reset signal
    input wire in,          // Input signal to control state transitions
    output reg [1:0] state, // Current state output
    output reg out          // Output signal
);

    // State encoding
    localparam IDLE   = 2'b00;
    localparam STATE1 = 2'b01;
    localparam STATE2 = 2'b10;

    // State register
    reg [1:0] next_state;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE; // Reset to IDLE state
        else
            state <= next_state; // Transition to next state
    end

    // Next state logic and output logic
    always @(*) begin
        // Default assignments
        next_state = state;
        out = 1'b0;

        case (state)
            IDLE: begin
                if (in)
                    next_state = STATE1;
            end

            STATE1: begin
                out = 1'b1; // Example output in STATE1
                if (in)
                    next_state = STATE2;
                else
                    next_state = IDLE;
            end

            STATE2: begin
                out = 1'b0; // Example output in STATE2
                if (!in)
                    next_state = IDLE;
            end

            default: next_state = IDLE; // Default state
        endcase
    end
endmodule
