+++
title = "FAQ"
description = "Answers to frequently asked questions."
date = 2022-12-01T18:10:00+00:00
updated = 2022-12-01T18:10:00+00:00
draft = false
weight = 30
sort_by = "weight"
template = "docs/page.html"

[extra]
toc = true
top = false
+++
# FAQ

Answers to frequently asked questions.

### Why did you develop OpenVAF?

Coming from a modeling/software-engineering/academic background we noticed at the beginning of 2019 that 
existing Verilog-A compilers had serious shortcomings.
For example slow compilation and simulation speed, questionable Verilog-A standard compliance and convergence issues. 
Even worse, the ADMS tool used in the open-source circuit simulators is notoriously buggy and slow, 
and unmaintained.

This problem became particularly pressing in recent years as CMC models moved to using newer Verilog-A features
that are not supported by ADMS.
This caused problems both for both open source and commercial simulators using this tool.

### What are the main benefits of OpenVAF?

OpenVAF directly generates executable machine code and does not use an intermediate language such as C.
The compilation is very fast (up to 10 times faster than alternatives).
Furthermore, this approach allows implementation of better auto-differentiation algorithms
that can generated highly optimized machine code that can run faster than code produced by traditional compilers.

OpenVAF also takes Verilog-A standard compliance seriously.
The approach described above allows OpenVAF to support more Verilog-A features without
sacrificing compilation or simulation performance.
As a result OpenVAF can compile a wide variety of standard compliant models
without modifications while offering better performance then other compilers.

Finally, OpenVAF also puts a great focus on ease of use.
No complicated setup is required to install the compiler
Furthermore 

<!-- If you have problems or questions youc [SemiMod GmbH](https://semimod.de/) 
can directly be contacted, or you can get in touch using the [Git repo](https://github.com/pascalkuthe/OpenVAF). -->

<!--### What are potential future applications?

The open-source silicon movement led by Google will very likely make use of OpenVAF sooner or later, since many models 
used in commercial PDKs cannot be run with the existing Ngspice/Xyce simulators. We hope that the Xyce team will 
integrate our OSDI interface.

We also hope that the modeling community will notice the benefits of using OpenVAF in the coming years and OpenVAF might make it 
into one of the commercial tools. We are available as support for potential cooperation partners. 

We believe that more and more data-driven or hybrid analytical/data driven models will be employed in the semiconductor industry.
This may necessitate the integration of new features to OpenVAF or extending the Verilog-A standard that has not been 
developed further for over a decade.


 ### Why did you license OpenVAF under GPL?

The choice for open-source was clear, since we needed the tool for our own sake and wanted people to 
also benefit. 
Sharing brings nothing but advantages to everyone. 
It enables to locate bugs, improve the tools, but also shows the commercial EDA vendors what is technically possible. -->

### Will OpenVAF remain open-source?

Yes, OpenVAF and the OSDI specification will always remain open-source projects. 
However, SemiMod offers potential commercial partners to build or integrate OpenVAF into proprietary tooling. 
Some tools developed as part of this cooperation may not become open-source.

### Why is additional parameter information like description, units and type (instance parameters) not available for some models?

Some older Verilog-A models use non-standard syntax for indicating parameter information
that can not be supported by OpenVAF.
Recently released compact models usually use the newer syntax.

The old syntax looks as follows:

```
paramter real example=1.0 (*type="instance"*);
```

The syntax is often abbreviated with a macro that disables the syntax outside ADMS:

```
paramter real example=1.0 `P(type="instance");
```

The Verilog-A standard (and therefore OpenVAF) support the following syntax instead:

```
(*type="instance"*) paramter real example=1.0;
```


### I need help integrating OpenVAF into a simulator, can you help?

Please [get in touch](https://semimod.de/contact/) with us to determine the best path for cooperation. 

### I need help extracting model parameters for a technology, can you help?

Unfortunately, the extraction of compact model parameters is a very knowledge and tool intensive process. 
The model parameters found in many commercial and open-source PDKs are rather questionable and a serious problem 
for circuit designers. 
Bad models can result in tremendous follow-up costs due to re-design.

If you need help with model parameter extraction, do not hesitate to reach out to [SemiMod](https://semimod.de/) and 
we may discuss potential collaboration options.

### Who should I contact if I have problems, questions or feature requests?

You can post all questions, bugs or feature requests on the [OpenVAF Git repository](https://github.com/pascalkuthe/OpenVAF).