+++
title = "Installation"
description = "One page summary of how to start a new AdiDoks project."
date = 2021-05-01T08:20:00+00:00
updated = 2021-05-01T08:20:00+00:00
draft = false
weight = 10
sort_by = "weight"
template = "docs/page.html"

+++

# Installation

OpenVAF is available as a pre-compiled standalone executable. 
Of course, it is also possible to compile the tool oneself, but this is not recommended.

## System Requirements

OpenVAF supports:

* All Unix systems released from RHEL 7 on. 
* Windows systems from Windows 10 on. 

Note that OSX is currently not supported.

## Pre-compiled Executable

Pre-compiled OpenVAF executables for all supported platforms [can be downloaded here](../../../download). 
After download, place the **openvaf**  executable in your PATH, so that it can be called from everywhere. 

Try to run 

```bash
openvaf
``` 

in a terminal and see if the executable is found.

## Compilation

Users can also compile OpenVAF themselves. 
This is not recommended for users that do not want to actively take part in the development of OpenVAF
since the build process is quite involved because of its **LLVM dependency**. 
This is no problem on most up to date Unix systems that have LLVM pre-compiled in their repos.

The compilation is detailed in the **README.md** of the [OpenVAF repository](https://gitlab.com/DSPOM/OpenVAF).


