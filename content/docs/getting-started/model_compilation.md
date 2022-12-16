+++
title = "Usage"
description = "One page summary of how to start a new AdiDoks project."
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

```bash
openvaf <file>.va
``` 

in a terminal and the compilation should complete quickly.
OpenVAF offers advanced options which are shown by `openvaf --help`, but these won't usually be required.

If there are no errors in the Verilog-A source, a file called `<file>.osdi` will be generated that can be used by 
circuit simulators that implement the [OSDI interface](../../details/osdi), such as Ngspice.
