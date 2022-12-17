+++
title = "Usage"
description = "Usage of OpenVAF and the associated Ngspice integration."
date = 2021-05-01T08:20:00+00:00
updated = 2021-05-01T08:20:00+00:00
draft = false
weight = 30
sort_by = "weight"
template = "docs/page.html"

+++

# Usage

Once OpenVAF is installed, compilation of Verilog-A models to an OSDI library suitable for circuit simulation is easy. 
Simply run 

``` bash
openvaf <file>.va
``` 

in a terminal and the compilation should complete quickly.
OpenVAF offers advanced options which are shown by `openvaf --help`, but these won't usually be required.

If there are no errors in the Verilog-A source, a file called `<file>.osdi` will be generated that can be used by 
circuit simulators that implement the [OSDI interface](../../details/osdi), such as Ngspice.


## Ngspice Integrationg 

Once you have obtained a compiled OSDI file as described above it can be loaded into ngspice with a simple simulator command.

```bash
osdi <path>.osdi
```

If the path specified is a relative path like `folder/example.osdi` it will be resolved in current working directory.
To load a model within a netlist the `pre_osdi` command must be used to ensure the model is loaded before the netlist is resolved:

```bash
.control
pre_osdi <file>.osdi
*other control commands
.endc
```

If a relative path is used with the `pre_osdi` command, the path will be resolved in **the parent directory of the netlist**.
<!--Ngspice will look for the **osdi** in the path specified via the **pre_osdi** command. 
The path can be either absolute, or relative to the current working directory. -->

Once an OSDI file has been loaded, Verilog-A modules can be initiated in a netlist as shown below.
Note that the `N` prefix is important for the device name to ensure correct behaviour.

```bash
.model <model name> <Verilog-A module name> <model parameters>*

N<instance name> <nodes>* <model name> <instance parameters>*
```

A minimal example netlist that create a single instance of the HICUM/L2 model is shown below.
More examples can be found [here](../examples)

```bash
OSDI Example

.model hicum_model hicuml2va c10=1e-30

N1 C B E S hicum_model

.control
pre_osdi hicumL2V3p0p0.osdi
.endc
.end
```

