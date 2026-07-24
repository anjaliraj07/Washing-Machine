`timescale 1ns/1ps

module washing_machine_tb;

reg clk;
reg rst;
reg start;
reg water_full;
reg wash_done;
reg rinse_done;
reg spin_done;
reg buzzer_done;

wire water_valve;
wire motor;
wire drain;
wire buzzer;
wire done;

// DUT Instantiation
washing_machine dut(
    .clk(clk),
    .rst(rst),
    .start(start),
    .water_full(water_full),
    .wash_done(wash_done),
    .rinse_done(rinse_done),
    .spin_done(spin_done),
    .buzzer_done(buzzer_done),
    .water_valve(water_valve),
    .motor(motor),
    .drain(drain),
    .buzzer(buzzer),
    .done(done)
);

// Clock Generation
always #5 clk = ~clk;


  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, washing_machine_tb);
end
  initial
begin
    clk = 0;
    rst = 1;

    start = 0;
    water_full = 0;
    wash_done = 0;
    rinse_done = 0;
    spin_done = 0;
    buzzer_done = 0;

    // Reset
    #20;
    rst = 0;

    // Start Washing Machine
    #10;
    start = 1;

    #10;
    start = 0;

    // Fill complete
    #30;
    water_full = 1;

    #10;
    water_full = 0;

    // Washing complete
    #40;
    wash_done = 1;

    #10;
    wash_done = 0;

    // Rinse complete
    #40;
    rinse_done = 1;

    #10;
    rinse_done = 0;

    // Spin complete
    #40;
    spin_done = 1;

    #10;
    spin_done = 0;

    // Buzzer timeout
    #30;
    buzzer_done = 1;

    #10;
    buzzer_done = 0;

    #50;
    $finish;
end

// Monitor Signals
initial
begin
    $monitor("Time=%0t | State Outputs -> Valve=%b Motor=%b Drain=%b Buzzer=%b Done=%b",
             $time, water_valve, motor, drain, buzzer, done);
end

endmodule
