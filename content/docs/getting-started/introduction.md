+++
title = "Introduction"
description = "AdiDoks is a Zola theme helping you build modern documentation websites, which is a port of the Hugo theme Doks for Zola."
date = 2021-05-01T08:00:00+00:00
updated = 2021-05-01T08:00:00+00:00
draft = false
weight = 5
sort_by = "weight"
template = "docs/page.html"

+++

## Introduction 

Circuit simulators are used for designing electrical circuits. For this purpose one requires so-called compact models that 
mathematically describe the terminal characteristics of devices as functions of terminal voltages and model parameters. 
Modern compact models usually have a significant complexity that makes hand implementation a tedious and error-prone task. 

In recent years Verilog-A has become the de-facto standard 
for distributing compact models to model users. 
The difficulty of incorporating Verilog-A models into circuit simulators has been overcome
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
* ... use of standard libraries for compiler construction for enabling **user friendly error messages**.
