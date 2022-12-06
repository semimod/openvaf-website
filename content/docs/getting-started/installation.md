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

## System Requirements

OpenVAF is shipped as a pre-compiled standalone executable for several OS:

* All Unix systems released from RHEL 7 on. 
* Windows systems from Windows 10 on. 

Note that OSX is currently not supported.

## Pre-compiled Executable

Pre-compiled OpenVAF executables for all supported platforms [can be downloaded here](todo). 
After download, place the **openvaf**  executable in your PATH, so that it can be called from everywhere. 

Try to run 

```bash
openvaf
``` 

in a terminal and see if the executable is found.

## Compilation

Compilation todo ... 

### Unix

```bash
git clone https://github.com/aaranxu/adidoks.git
cd adidoks
zola serve
```

Visit `http://127.0.0.1:1111/` in the browser.

### Windows


