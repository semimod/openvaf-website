+++
title = "FAQ"
description = "Answers to frequently asked questions."
date = 2021-05-01T19:30:00+00:00
updated = 2021-05-01T19:30:00+00:00
draft = false
weight = 30
sort_by = "weight"
template = "docs/page.html"

+++

### Why did you develop OpenVAF?

Coming from a modeling/software-engineering/academic background we noticed at the beginning of 2019 that 
commercial Verilog-A compilers had serious shortcomings (slow compilation and simulation speed, questionable Verilog-A standard compliance, license cost, convergence issues). 
Even worse, the ADMS tool used in the open-source circuit simulators is notoriously buggy and slow, 
and not anymore maintained.

We also needed access to an affordable and fast circuit simulator for our modeling work. 

### What are the main benefits of OpenVAF?

With OpenVAF, you get a **real Verilog-A compiler** that directly generates executable machine code and does not use 
an intermediate language such as C. The compilation is fast and the generated machine code is highly optimized for speed using state-of-the-art compiler techniques.

OpenVAF is also Verilog-A standard compliant. If you have problems or questions, [SemiMod GmbH](https://semimod.de/) 
can directly be contacted, or you can get in touch using the [Git repo](https://github.com/pascalkuthe/OpenVAF). 

### What are potential future applications?

The open-source silicon movement led by Google will very likely make use of OpenVAF sooner or later, since many models 
used in commercial PDKs cannot be run with the existing Ngspice/Xyce simulators. We hope that the Xyce team will 
integrate our OSDI interface.

We also hope that the modeling community will notice the benefits of using OpenVAF in the coming years and OpenVAF might make it 
into one of the commercial tools. We are available as support for potential cooperation partners. 

We believe that more and more data-driven or hybrid analytical/data driven models will be employed in the semiconductor industry. This may necessitate the integration of new features to OpenVAF or extending the Verilog-A standard that has not been 
developed further for over a decade.


### Why did you license OpenVAF under GPL?

The choice for open-source was clear, since we needed the tool for our own sake and wanted people to 
also benefit. 
Sharing brings nothing but advantages to everyone. 
It enables to locate bugs, improve the tools, but also shows the commercial EDA vendors what is technically possible. 


### I need help integrating OpenVAF into my simulator, can you guys help me?

We will do our best to help developers of open-source simulators to integrate the OSDI interface. 
Note that, of course, this depends on our available free time.

Commercial EDA vendors are encouraged to get in touch with us and we may certainly find a way to work together. 

### I need help extracting model parameters for my process, can you guys help me?

Unfortunately, the extraction of compact model parameters is a very knowledge and tool intensive process. 
The model parameters found in many commercial and open-source PDKs are rather questionable and a serious problem 
for circuit designers. 
Having bad models can result in tremendous follow up costs due to re-design.

If you need help with model parameter extraction, do not hesitate to reach out to [SemiMod](https://semimod.de/) and 
we may discuss potential collaboration options.

### Who should I contact if I have problems, questions or feature requests?

You can post all questions, bugs or feature requests on the [OpenVAF Git repository](https://github.com/pascalkuthe/OpenVAF).