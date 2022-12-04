+++
title = "Model compilation"
description = "One page summary of how to start a new AdiDoks project."
date = 2021-05-01T08:20:00+00:00
updated = 2021-05-01T08:20:00+00:00
draft = false
weight = 30
sort_by = "weight"
template = "docs/page.html"

+++

## Model Compilation

Once OpenVAF is installed, compilation of Verilog-A models to a shared-library suitable for circuit simulation is fairly easy. 
Simply run 

```bash
openvaf <VerilogA-File>.va
``` 

in a terminal. This invokes the compilation process.

If there are no errors in the Verilog-A source, a file called **VerilogA-File.osdi** will be generated that can be used by 
circuit simulators that implement the [OSDI interface](../../implementation_details/osdi), such as Ngspice.
