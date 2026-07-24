module washing_machine(

input clk,
input rst,

input start,
input water_full,
input wash_done,
input rinse_done,
input spin_done,
input buzzer_done,

output reg water_valve,
output reg motor,
output reg drain,
output reg buzzer,
output reg done

);

/////////////////////////////////////////////////////
// State Encoding
/////////////////////////////////////////////////////

parameter IDLE   = 3'd0,
          FILL   = 3'd1,
          WASH   = 3'd2,
          RINSE  = 3'd3,
          SPIN   = 3'd4,
          BUZZER = 3'd5;

reg [2:0] state,next_state;

/////////////////////////////////////////////////////
// Sequential Block
/////////////////////////////////////////////////////

always @(posedge clk or posedge rst)
begin
    if(rst)
        state <= IDLE;
    else
        state <= next_state;
end

/////////////////////////////////////////////////////
// Next State Logic
/////////////////////////////////////////////////////

always @(*)
begin

    next_state = state;

    case(state)

    IDLE:
        if(start)
            next_state = FILL;

    FILL:
        if(water_full)
            next_state = WASH;

    WASH:
        if(wash_done)
            next_state = RINSE;

    RINSE:
        if(rinse_done)
            next_state = SPIN;

    SPIN:
        if(spin_done)
            next_state = BUZZER;

    BUZZER:
        if(buzzer_done)
            next_state = IDLE;

    default:
        next_state = IDLE;

    endcase

end

/////////////////////////////////////////////////////
// Output Logic
/////////////////////////////////////////////////////

always @(*)
begin

    // Default Outputs

    water_valve = 0;
    motor       = 0;
    drain       = 0;
    buzzer      = 0;
    done        = 0;

    case(state)

    IDLE:
    begin
    end

    FILL:
    begin
        water_valve = 1;
    end

    WASH:
    begin
        motor = 1;
    end

    RINSE:
    begin
        motor = 1;
        drain = 1;
        water_valve = 1;
    end

    SPIN:
    begin
        motor = 1;
        drain = 1;
    end

    BUZZER:
    begin
        buzzer = 1;
        done   = 1;
    end

    endcase

end

endmodule
