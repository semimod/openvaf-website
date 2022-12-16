+++
title = "OSDI interface"
description = "Contribute to AdiDoks, improve documentation, or submit to showcase."
date = 2022-12-01T08:00:00+00:00
updated = 2022-12-01T08:00:00+00:00
draft = false
weight = 420
sort_by = "weight"
template = "docs/page.html"

+++

# OSDI Interface

OpenVAF generates shared objects that can be loaded by circuit simulators at run-time. 
To ensure compatibility with a wide variety of simulators these models implement a **simulator independent** interface.
The interface is described in [the OSDI manual](/osdi/osdi_v0p3.pdf) and implemented into `ngspice`.