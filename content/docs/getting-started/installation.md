+++
title = "Installation"
description = "Install Instructions for the OpenVAF compiler."
date = 2021-05-01T08:20:00+00:00
updated = 2021-05-01T08:20:00+00:00
draft = false
weight = 10
sort_by = "weight"
template = "docs/page.html"

[extra]
lead = "installation"
+++

# Installation

OpenVAF is [available](../../../download) as a pre-compiled standalone executable for 
Windows and Linux.
Compiling OpenVAF yourself is also possible but not recommended as is involved to setup correctly at the moment.

## System Requirements

OpenVAF supports:

* All Unix systems released from RHEL 7 on. 
* Windows systems from Windows 10 on. 

Note that OSX is currently not supported.
If you are interested in OSX support reach out to us.

## Pre-compiled Executable

Pre-compiled OpenVAF executables for all supported platforms [can be downloaded here](../../../download). 
After download, place the **openvaf** executable in your PATH, so that it can be called from everywhere. 

Try to run 

```bash
openvaf --help
``` 

in a terminal and see if the executable is found.

## Compilation

Users can also compile OpenVAF themselves. 
This is not recommended for users that do not want to actively take part in the development of OpenVAF
since the build process is quite involved because of its **LLVM dependency**. 

The compilation is detailed in the **README.md** of the [OpenVAF repository](https://github.com/pascalkuthe/OpenVAF).


