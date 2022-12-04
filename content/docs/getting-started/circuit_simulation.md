+++
title = "Ngspice circuit simulation"
description = "One page summary of how to start a new AdiDoks project."
date = 2021-05-01T08:20:00+00:00
updated = 2021-05-01T08:20:00+00:00
draft = false
weight = 40
sort_by = "weight"
template = "docs/page.html"

+++

## Introduction 

In the following, the simulation of some circuits that rely on Verilog-A defined compact models is detailed using **Ngspice**
as an exemplary circuit simulator. 
For this purpose, please install Ngspice as is explained on the [Ngspice website](https://ngspice.sourceforge.io/).

**The OSDI interface of Ngspice is only available in the pre-master branch at this time!**

## Netlist Syntax 

After having compiled a Verilog-A source file as [described here](../model-compilation), the compiled **osdi** file can be included into a netlist after the **.control** statement like this:

```bash
pre_osdi hicumL2V3p0p0.osdi
```

Ngspice will look for the **osdi** file in the current directory and in TODO.



## Example 1: HICUM/L2 Model

This example demonstrates how to simulate the HICUM/L2 model using OpenVAF.  
First, create a folder that will be used for the simulation. 

In this folder, place the following three files: 

* the netlist below, which you can also download [here](/hicuml2/netlist_osdi.sp). 
* the model parameters [model.l](/hicuml2/model.l) that specify the model parameters.
* the **hicumL2V3p0p0.va** file that you can download [here](https://www.iee.et.tu-dresden.de/iee/eb/forsch/Hicum_PD/HicumQ/hicumL2V3p0p0.va).

```bash
OSDI Example

VB B  0 DC 0.1 AC 1 SIN (0.5 0.4 1M)
VC C  0 DC 1

.model npn_full_sh hicuml2va
.include model.l

N1 C B 0 0 npn_full_sh

.control
pre_osdi hicumL2V3p0p0.osdi

dc VC 0 2 0.01 VB 0.65 0.9 0.05 ; 
plot -i(VC)
.endc

.end
```

The netlist specifies a bipolar transistor that uses the model **hicuml2va** and the model parameters **model.l**. 
The model is made available to Ngspice via the line 

```bash
pre_osdi hicumL2V3p0p0.osdi
```

To generate this osdi file you must compile the Verilog-A code by running

```bash
openvaf hicumL2V3p0p0.va
``` 

in the folder.




## Example 2: MOS circuit

## Example 3: Holger circuit

