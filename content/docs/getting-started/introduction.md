+++
title = "Introduction to Verilog-A"
description = "Introduction to compact models, Verilog-A and why they are critical for economic circuit design."
date = 2022-12-01T08:00:00+00:00
updated = 2022-12-01T08:00:00+00:00
draft = false
weight = 5
sort_by = "weight"
template = "docs/page.html"

+++

## Introduction to Compact Models 

Circuit simulators play a critical role in the design of electrical circuits.
By allowing designers to test the behavior of their circuits before fabrication
they **significantly reduce design time and costs**.
Producing a test-wafer during IC development producing costs tens of thousands of euros.
More importantly a lead-time of at least 6 months is required which significantly hinders design velocity.
Accurate simulations alleviate this problem by reducing the number of required design iterations,
ideally enabling a first-time-right design.

Circuit simulators require models that describe the behavior of the used electronic devices.
Full simulation of device physics (TCAD) is impractical, because it requires usually secret foundry data
and takes an hour to simulate just a single transistor 
Instead, so-called compact models are used that
mathematically describe the terminal characteristics of devices as functions of terminal voltages and model parameters.

There are two primary variables that influence the accuracy of a simulation:

* The accuracy of the compact-model
* The quality of the model parameters extracted from measurements of the electronic devices.

If you require a high-quality set of model-parameters, please [contact us](https://wwww.semimod.de) we are experts!
However, even the best parameter extraction can not compensate an inaccurate compact-model.
Therefore, compact models have **grown in complexity** significantly to reduce development costs and **keep up with modern technologies**.

However, this complexity has made **integrating** these models **into simulators manually tedious, error-prone task and expensive** process.
In particular, the derivatives of all computed terminal characteristics are required by simulators.
These symbolic derivatives quickly balloon to unmanageable terms that are many times larger than the (already complex) model equations.
Numeric derivatives are not an option as they are an order of magnitude slower to compute and often cause convergence problems.
As a result, we frequently encountered **incorrect compact models** when working with our customers.
Furthermore, some simulators with no/limited Verilog-A integration **are lacking many compact-models**.

Finally, these manually implemented compact models often **differ between multiple simulators** as EDA vendors rename parameters or change model equations.
Therefore, PDKs are often only usable with a select few simulators.

## Moving the industry forward with Verilog-A 

To address these problems it has become the [de-facto standard](https://si2.org/standard-models/) to develop and distribute compact models in Verilog-A.
Verilog-A allows implementing compact models in a **simulator independent** language.
Furthermore, derivatives do not need to be implemented by hand.
This tedious and error-prone process is instead automatically performed when the Verilog-A code
is compiled for use within a circuit simulator.

Verilog-A also makes compact-models more flexible by allowing modifications without considering
complex implementation details like derivatives or interaction with the simulator. 
This makes identifying problems and advanced design tasks easier.
For example most compact-models do not produce correct results at cryogenic temperatures.
When Verilog-A integration is available, model equations are can be adjusted to correctly account for low temperatures.

Verilog-A can be useful beyond compact modelling by also facilitating the implementation of behavioral models
or even entire circuits.
Implementing these in Verilog-A instead of net lists has the advantage of being portable across simulators
and also allows for increased ergonomics and flexibility by offering a more powerful language
compared to netlists.


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