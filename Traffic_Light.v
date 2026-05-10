`timescale 1ns / 1ps

module Traffic_Light(
    input clk,
    input reset,

    input north_density,
    input east_density,
    input south_density,
    input west_density,

    output reg [2:0] north,
    output reg [2:0] east,
    output reg [2:0] south,
    output reg [2:0] west
);

// Encoding
parameter RED=3'b100, YELLOW=3'b010, GREEN=3'b001;

// States
parameter NG=0, NY=1, EG=2, EY=3,
          SG=4, SY=5, WG=6, WY=7;

reg [2:0] state;
reg [31:0] counter;

// 100 MHz clock
parameter GREEN_CHECK = 200_000_000; // 2 sec
parameter YELLOW_TIME = 200_000_000; // 2 sec

// Active LOW sensors → convert
wire vN = ~north_density;
wire vE = ~east_density;
wire vS = ~south_density;
wire vW = ~west_density;

always @(posedge clk or posedge reset) begin
    if(reset) begin
        state <= NG;
        counter <= 0;
    end else begin
        counter <= counter + 1;

        case(state)

        // -------- NORTH --------
        NG: begin
            if(counter >= GREEN_CHECK) begin
                counter <= 0;
                if(!vN) state <= NY;  // no traffic → move
                else state <= NG;     // traffic → stay GREEN
            end
        end

        NY: if(counter >= YELLOW_TIME) begin
                state <= EG;
                counter <= 0;
        end

        // -------- EAST --------
        EG: begin
            if(counter >= GREEN_CHECK) begin
                counter <= 0;
                if(!vE) state <= EY;
                else state <= EG;
            end
        end

        EY: if(counter >= YELLOW_TIME) begin
                state <= SG;
                counter <= 0;
        end

        // -------- SOUTH --------
        SG: begin
            if(counter >= GREEN_CHECK) begin
                counter <= 0;
                if(!vS) state <= SY;
                else state <= SG;
            end
        end

        SY: if(counter >= YELLOW_TIME) begin
                state <= WG;
                counter <= 0;
        end

        // -------- WEST --------
        WG: begin
            if(counter >= GREEN_CHECK) begin
                counter <= 0;
                if(!vW) state <= WY;
                else state <= WG;
            end
        end

        WY: if(counter >= YELLOW_TIME) begin
                state <= NG;
                counter <= 0;
        end

        endcase
    end
end

// OUTPUT LOGIC (ONLY ONE ACTIVE)
always @(*) begin
    north = RED;
    east  = RED;
    south = RED;
    west  = RED;

    case(state)
        NG: north = GREEN;
        NY: north = YELLOW;

        EG: east = GREEN;
        EY: east = YELLOW;

        SG: south = GREEN;
        SY: south = YELLOW;

        WG: west = GREEN;
        WY: west = YELLOW;
    endcase
end
endmodule