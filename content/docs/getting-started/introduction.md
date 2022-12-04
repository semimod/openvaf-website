+++
title = "Introduction"
description = "Introduction to compact models, Verilog-A and why they are critical for economic circuit design."
date = 2022-12-01T08:00:00+00:00
updated = 2022-12-01T08:00:00+00:00
draft = false
weight = 5
sort_by = "weight"
template = "docs/page.html"

+++

## Circuit Simulation 

Circuit simulators play a critical role in the design of electrical circuits.
Accurate simulations allow circuit designers to validate circuit behavior before actual fabrication happens, 
potentially saving **significantly re-design costs.**
The simulation of a circuits critically depends on the so-called compact models and therefore:

* The **accuracy of the compact-model** 
* The quality of the **model parameters** 

## Compact Models 

Compact models are used to predict the device **terminal characteristics** by means of computationally inexpensive equations. 
With increasingly advanced technologies, compact models have been **growing significantly in complexity**. 
At the same time an increasingly diverse set of technologies is offered to designers, requiring **specific compact models for each kind of electron device**. 

The complexity of compact models has made the manual integration into simulators **a tedious, error-prone and expensive** task.
One reason for this is that not only the model equations have to be implemented, but also their symbolic derivatives. 
<!--The necessary accuracy of the derivatives is high because even small errors may lead to non-convergence, rendering numeric differentiation impractical. -->
Numeric derivatives are not an option because they are orders of magnitude slower to compute than analytical derivatives and can introduce convergence problems due to inaccuracies.
It is not uncommon, even in commercial tools, to find model **implementation bugs** or observing **convergence problems** that result 
from incorrectly implemented derivatives. 
Some simulators with no or limited Verilog-A integration **do not implement many compact-models and can therefore not simulate many processes at all**.

Manually implemented compact models may **differ between simulators** since EDA vendors often rename parameters or alter particular model equations.
Due to these simulator specific peculiarities, PDKs can usually only be used by a few specific simulators.

## Verilog-A 

Verilog-A has been developed to address these problems and has become the [de-facto standard](https://si2.org/standard-models/) for developing and distributing compact models. 
It allows implementing compact models via a **simulator independent** and standardized language.
**Verilog-A compilers** can translate these models to machine code and allow simulators to use these models **without manually implementing them**. 

Verilog-A enables...

* **model development and customization** by allowing to quickly modify the model equations without having to worry about model implementation details. 
* implementing **behavioral or data-driven models**, or even entire circuits.
* inherent **portability between simulators** for both models and PDKs that would not be possible with traditional netlist-based formats.

Model development and customization is necessary for advanced technologies and applications, for example quantum computing, 
where existing models cannot provide satisfactory results and must be adjusted. 
It also enables research and development.

<!-- The difficulty of incorporating Verilog-A models into circuit simulators has been overcome 
with the help of specialized tools such as ADMS, which should eliminate the need for implementing all model
equations and their derivatives into simulators manually.

ADMS employs a **transpilation** approach that has significant drawbacks:

* The use of an intermediate language prohibits code optimization that would otherwise be possible when using an actual compiler. 
* Usually, only a sub-set of the Verilog-A standard is implemented.
* Functionality is highly simulator dependent, since the transpilation files have to be re-defined for each simulator. 

Furthermore, ADMS is not officially supported anymore and implementations found in popular open-source circuit simulators such as Ngspice and 
Xyce are buggy. 
Verilog-A compiled models are usually slower than hand implemented models and most commercial tools still manually implement each model. 

**OpenVAF** has been developed to overcome these issues by employing ...

* ... compilation of Verilog-A **directly to machine code** using techniques that are standard in the field of compiler construction. 
* ... state-of-the-art software development techniques such as **automated testing** and proper **version control**.
* ... definition of a **flexible interface to the compiled machine code** that can be implemented into circuit simulators. 
* ... use of standard libraries for compiler construction for enabling **user friendly error messages**. -->