+++
title = "Performance"
description = "Contribute to AdiDoks, improve documentation, or submit to showcase."
date = 2022-12-01T18:10:00+00:00
updated = 2022-12-01T18:10:00+00:00
draft = false
weight = 480
sort_by = "weight"
template = "docs/page.html"

[extra]
toc = false

+++

# OpenVAF Performance 

The following paragraphs give an overview on OpenVAF`s performance. 
Both compilation and simulation speed are analyzed. 

Benchmarking and comparing different simulators is not trivial as each simulator implements different convergence 
algorithms, and might perform better under different circumstances. 
We have made the netlists and options as equal as possible, yet it must be stressed that the comparisons are not perfect. 

The chosen test cases are relatively simple, since mainly the 
famous **load** function that is called in the simulators during model evaluation is of interest. 
The employed CPU in the tests is an Intel i7-9750H@2.60GHz with 16 GB of DDR4 RAM and a SSD, if not mentioned otherwise.

In all ADS and Spectre simulations, the **license checkout time has been removed** from the run-time. 
As far as possible, writing to the hard-disk has been turned off for reducing the impact of read/write calls that are not of interest here. 
This has not been achieved for the Keysight ADS netlists that still cause some overhead due to read/write access.

## 1 Model Compilation

The model compilation time in seconds is compared between different models and different tools, next. 
Two tests have been conducted, since no test machine with all tools at the same time was available. 

<!-- The employed CPU in test (2) was an AMD Opteron 8220 with 64 GB of DDR3 RAM.  -->
The employed OpenVAF version was the latest master from 08.12.22, XYCE 7.5, Keysight ADS 512.update2.0 and Spectre 18.1.077.

Test results:

|               | HICUM/L2v3.0 | PSPv103 | BSIM4 | JUNCAP200 | EKV2.6 | BSIM-SOI 4.6.1 | BSIM-BULK 107.0.0 |
|---------------|--------------|---------|-------|-----------|--------|----------------|-------------------|
| OpenVAF       |   0.72       |  3.48   |  6.7  |   0.61    |  0.23  |    2.1         |   2.9             |
| Xyce ADMS     |     22*      |  109    |  25.1 |    16.6   |  9.6*  |     102.1*     |    -*             |
| ADS           |   7.7        |  33.9   |  27.0 |    5.1    |  2.5   |     30.7       |    34.5           |

* \* = Xyce buildxyceplugin fails:  
    - HICUM/L2: brackets at macro def
    - BSIM-SOI: Custom model v4.5 from Xyce repo
    - BSIM-Bulk: Non-independent initializations and node collapses, could not easily fix
    - EKV: par. range macros, noise sources not working

<!-- On machine (2) OpenVAF is not available as it runs on a very old RHEL distro that does not support recent LLVM versions. 
Test results on machine (2):

|               | HICUM/L2v3.0 | PSPv103 | BSIM4 | JUNCAP200 | EKV2.6 | BSIM-SOI 4.6.1 | BSIM-BULK 107.0.0 |
|---------------|--------------|---------|-------|-----------|--------|----------------|-------------------|
| Spectre       |    35.6      |   28.5  | 118.9 |  21.18    |  12.85 | 24.1           |     26.3          |
| ADS           |    30.6      |  128.32 | 111.0 |  25.7     |   9.5  |  120           |     115.16        | -->

**=> OpenVAF compiles around x10 faster than existing tools!**

## 2 Model Evaluation 
### 2.1 HICUM/L2v4p0 Output Characteristics

Test: Simulation of HBT output characteristics using HICUM/L2 for the exemplary model from the OpenVAF examples 

Notes: The collector and base voltage step width is set to 1 mV, increasing the simulation time significantly.

Results:

* **Ngspice (OpenVAF): 9.16s**
* Ngspice (built-in): 14.64s
* Xyce (ADMS): 36.42s
* Xyce (built-in): 26.56s
* ADS (Verilog-A ): 8.63s
* ADS (built-in): 7.01s


Notes:

* Ngspice with OpenVAF runs faster than built in Ngspice HICUM/L2 model as this particular built-in implementation uses slow dual-number based derivatives
* Xyce evaluation time is very likely larger due to difference in convergence algorithms, and not inherently due to Xyce itself.


<!--**=> Both Xyce and ADS run slower with Verilog-A model.**

**=> Ngspice runs comparably fast as commercial ADS simulator.**-->


### 2.2 HICUM/L2v2p4p0 Transient Simulation

Test: Simulation of HBT transient behavior with 1 GHz input signal at the base node and fixed ultra short time step.

* **Ngspice (OpenVAF): 50.05s**
* Ngspice (built-in): 82.39s
* Xyce (ADMS): 56s
* ADS (Verilog-A): 1000.4s
* ADS (built-in): 930.9s

Note that the ADS evaluation time is very likely larger due to excessive writing to the hard-disk that could not be turned off easily. 

<!-- **=> Ngspice with OpenVAF runs reasonably fast.** -->

### 2.3 BSIMSOI 4.4.0 Output Characteristics

Test: Simulation of MOSFET output characteristics with very fine bias steps.

Note: Use of BSIMSOI v4.5.0 in Xyce

* **Ngspice (OpenVAF): 8.47s**
* Ngspice (built-in): 7.98s
* Xyce (ADMS): 42.9s
* ADS (Verilog-A): 430.4s
* ADS (built-in): 408.4s

### 2.4 BSIMBULK 106.2 Output Characteristics

Test: Simulation of MOSFET output characteristics with very fine bias steps.

* **Ngspice (OpenVAF): 2.08s**
* Ngspice (ADMS): 3.38s
* ADS (Verilog-A): 79.63s
* ADS (built-in): 76.87s

<!-- **=> OpenVAF generally around 30% faster than ADMS based simulation.** -->

### 2.4 BSIMBULK 106.2 Transient 

Test: Simulation of MOSFET transient characteristics with very fine fixed time steps.

* **Ngspice (OpenVAF): 9.47s**
* Ngspice (ADMS): 13.70s
* ADS (Verilog-A): 74.9s
* ADS (built-in): 74.5s

### 2.4 PSP 103.8 Inverter 

Test: Transient simulation of the inverter from the examples section using a very fine bias grid.

* **Ngspice (OpenVAF): 20.01s**
* Ngspice (ADMS): 25.07s

### 2.4 ISCAS Benchmark Circuit with PSP 103.8 

Test: Transient simulation of the ISCAS benchmark circuit from the examples section using a very fine bias grid. 
Note that Ngspice has been built with openmp for this example to enable parallelization.

* **Ngspice (OpenVAF): 20min**
* Ngspice (ADMS): 25min

