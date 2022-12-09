+++
title = "Performance"
description = "Contribute to AdiDoks, improve documentation, or submit to showcase."
date = 2021-05-01T18:10:00+00:00
updated = 2021-05-01T18:10:00+00:00
draft = false
weight = 480
sort_by = "weight"
template = "docs/page.html"

+++

# OpenVAF Performance 

The following paragraphs give an overview on the performance that OpenVAF achieves. 
Both compilation and simulation speed are compared against other solutions. 

Note that such comparisons are far from trivial, since each simulator has different convergence 
algorithms and might perform better under different circumstances. 
For this purpose, the chosen test cases are not very complicated, since we mainly want to test the 
famous **load** function that is called in simulators during model evaluation. 

## 1 Model Compilation

Next, the actual model compilation time in seconds is compared between different models and different tools. 
Two tests have been conducted, since no test machine with all tools at the same time was available. 

The employed CPU in test (1) was an Intel i7-9750H@2.60GHz with 16 GB of DDR4 RAM and a SSD. 
The employed CPU in test (2) was an AMD Opteron 8220 with 64 GB of DDR3 RAM. 
The employed OpenVAF version is the laster master from 08.12.22, XYCE 7.5, Keysight ADS 512.update2.0, Spectre 18.1.077.

Test results on machine (1):

|               | HICUM/L2v3.0 | PSPv103 | BSIM4 | JUNCAP200 | EKV2.6 | BSIM-SOI 4.6.1 | BSIM-BULK 107.0.0 |
|---------------|--------------|---------|-------|-----------|--------|----------------|-------------------|
| OpenVAF       |   0.72       |  3.48   |  6.7  |   0.61    |  0.23  |    2.1         |   2.9             |
| Xyce ADMS     |     22*      |  109    |  25.1 |    16.6   |  9.6*  |     -*         |    -*             |
| ADS           |   7.7        |  33.9   |  27.0 |    5.1    |  2.5   |     30.7       |    34.5           |

* \* = Xyce buildxyceplugin fails:  
    - HICUM/L2: brackets at macro def
    - BSIM models: non-independent initializations and node collapses, could not easily fix
    - EKV: par. range macros, noise sources not working

* ADS time calculated from difference between circuit run with and without compile.

Test results on machine (2):

|               | HICUM/L2v3.0 | PSPv103 | BSIM4 | JUNCAP200 | EKV2.6 | BSIM-SOI 4.6.1 | BSIM-BULK 107.0.0 |
|---------------|--------------|---------|-------|-----------|--------|----------------|-------------------|
| OpenVAF       |              |         |       |           |        |                |                   |
| Spectre       |    35.6      |   28.5  | 118.9 |  21.18    |  12.85 | 24.1           |     26.3          |
| ADS           |    30.6      |  128.32 | 111.0 |  25.7     |   9.5  |  120           |     115.16        |

* ADS and Spectre time calculated from difference between circuit run with and without compile.

**=> OpenVAF gives at least a x10 speed improvement compared to existing tools!**

## 2 Model Evaluation 
### 2.1 HICUM/L2v4p0 Output Characteristics

Next, the simulation of HBT output characteristics with HICUM/L2 for the exemplary model from the OpenVAF examples 
(but with v2.4.0 instead of 3.0.0) is compared between simulators on machine (1) as defined in paragraph one. 
The collector and base voltage step width is set to 1 mV, thereby increasing the simulation time significantly.

* Ngspice (Verilog-A): 4.65s
* Ngspice (built-in): 4.65s
* Xyce (Verilog-A): 42.78s
* Xyce (built-in): 36.8s
* ADS (Verilog-A ): 8.63s
* ADS (built-in): 7.01s

The ADS license checkout time has been removed from the the ADS result.
Xyce simulation did not work without Verilog-A code modifications. 

### 2.2 PSP103 Output Characteristics

Next, the simulation of MOS output characteristics with PSP103 for the exemplary model from the OpenVAF examples 
is compared between simulators on machine (1) as defined in paragraph one. 
The drain and gate voltage step width is set to 1 mV, thereby increasing the simulation time significantly.

* Ngspice (Verilog-A): 
* Xyce (Verilog-A): 
* ADS (Verilog-A ): 
* ADS (built-in): 

The ADS license checkout time has been removed from the the ADS result.