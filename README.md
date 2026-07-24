# Washing_Machine
Washing Machine Controller using Verilog

Description

This project implements a simple washing machine controller using a Finite State Machine (FSM) in Verilog. The controller moves through different stages of a washing cycle based on input signals and controls the corresponding outputs such as the water valve, motor, drain, and buzzer.

The design was simulated to verify that all state transitions occur correctly.

---

## States

* IDLE
* FILL
* WASH
* RINSE
* SPIN
* BUZZER

The controller starts in the **IDLE** state. After receiving the `start` signal, it proceeds through each stage of the washing cycle and finally returns to **IDLE** after the buzzer state.


## Inputs

Signal             Function                 
 clk              System clock             
 rst              Reset                    
 start            Starts the washing cycle 
 water_full       Water filling completed  
 wash_done        Washing completed        
 rinse_done      Rinsing completed        
 spin_done       Spinning completed       
 buzzer_done     Ends the buzzer state    


Outputs

 Signal          Function                        
 
 water_valve    Opens the water inlet           
 motor          Runs the washing/spinning motor 
 drain          Drains water                    
 buzzer         Indicates the cycle is complete 
 done           Washing cycle completed         






Simulation

A Verilog testbench was written to verify the functionality of the controller. The simulation checks that the FSM moves through all states in the correct order when the corresponding input signals are asserted.



## Folder Structure

```text
Washing-Machine-FSM
│
├── rtl/
│   └── washing_machine.v
│
├── tb/
│   └── washing_machine_tb.v
│
├── images/
│   └── waveform.png
│
└── README.md
```

---
 Tools Used

* Verilog HDL
* EDA Playground
* GitHub

 Possible Improvements

* Add different washing modes (Quick, Normal, Heavy)
* Replace external done signals with internal timers
* Add door lock and pause/resume functionality
* Include error handling for abnormal conditions


Author

Anjali Raj
