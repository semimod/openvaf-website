+++
title = "Verilog-A Standard Compliance"
description = "Contribute to AdiDoks, improve documentation, or submit to showcase."
date = 2022-12-01T08:00:00+00:00
updated = 2022-12-01T08:00:00+00:00
draft = false
weight = 440
sort_by = "weight"
template = "docs/page.html"

[extra]
toc=true
+++

<div class="wrap container" role="document">
  <div class="content">
    <section class="section container-fluid mt-n3 pb-3">
      <div class="row justify-content-center">
        <div class="row justify-content-center">
					<div class="col-md col-lg col-xxl">
						<article>
							<h1 class="text-center">Preview</h1>
							<p class="text-center">This page is not yet fully complete and is missing some conent.</p>
						</article>
					</div>
				</div>
      </div>
    </section>
  </div>
</div>

# Verilog-A Standard Compliance


OpenVAF follows the [Verilog-AMS Language Reference Manual 2.4.0][vams] language standard.
The current goal is to support only the analog (Verilog-A) subset defined within this standard, 
digital models can not (yet) be parsed.
We take the standard seriously and try to follow it closely to ensure all models are supported.

We were not yet able to implement all features of the Verilog-A standard (take a look at our [roadmap](../roadmap)).
However, OpenVAF is primarily aimed at compact modeling at the moment.
The subset of the standard that is used by compact models (and more) is already implemented.
Therefore, the compiler was released with partial support for the language standard as it already supports many practical applications.

To better facilitating compact modeling in particular a few additional features were also added to OpenVAF.
On this page all differences between the language subset implemented by OpenVAF and the Verilog-A subset of the 
[Verilog-AMS Language Reference Manual][vams] are documented.





## Incomplete Features



Some features in the [Verilog-AMS Language Reference Manual][vams] are aimed at behavioral modeling or describing 
entire circuits.
Some of these features are not yet implemented by OpenVAF.
Here all language features not implemented by OpenVAF are laid out.


### (Analog) Event Control Statements

**Standard Section** 5.10 Analog event control statements <br>
**Status** Syntax for events other than `inital_step` and `final_step` can't be parsed

The Verilog-AMS standard allows to mark statements with event control.
Such statements are only executed when the indicated event has occurred.
The events are usually not used in compact models as they may introduce discontinuities.
Therefore, OpenVAF only supports the `inital_step` and `final_step` events for initialization code.
These events are always executed on every iteration and time step.
Historically `inital_step` was used in compact models to mark initialization code.
OpenVAF automatically separates initialization code and therefore ignoring `intial_step` has the desired effect. 

#### Examples

There are four kinds of events specified in the standard.
They are listed here with an example and an indication to show whether OpenVAF currently supports this syntax:

* Global events (`@(initial_step)`, `@(final_step)`) *supported*
* Named (manually triggered) events (`@foo`) *not supported*
* Monitored events (`@(cross(V(smpl) - thresh, dir))`) *not supported*
* Or events (a combination of multiple other events) `@(initial_step or cross(V(smpl)-2.5,+1))` *not supported*

### Arithmetic Bit Shift

**Standard Section** 4.2.11 Shift Operators <br>
**Status** Arithmetic Shift Operator can not be parsed (no change planned)

Arithmetic bit shifts are not allowed in analog blocks, yet they are a sub-set of the Verilog-AMS standard that is not excluded for Verilog-A. 
To avoid having to maintain unused code, the arithmetic bit shift operator is not supported by the compiler.

## Additional Features

Some features that are not part of the Verilog-A standard have been added to OpenVAF.
The need for these features arose when OpenVAF was used in practice for compact model compilation and parameter, 
extraction. Below is a table that lists these additional features and a corresponding example.

In the following section each feature -including a motivation- is explained in detail.
To make it easy to remain standard-compliant, 
OpenVAF will emit a warning by default when any one of the listed features is used.

### Symbolic Derivatives with respect to Temperature 

The [Verilog-AMS Language Reference Manual][vams] allows calculating derivatives with the `ddx` analog filter.
However, only derivatives w.r.t. node voltages `V(node)` or branch currents (`I(branch)`) are allowed.
For parameter extraction derivatives by ambient Temperature (`$temperature`) may be of interest for extracting temperature dependencies.

#### Guide

The behavior of the `ddx` analog filter is extended so that `ddx(foo,$temperature)` is valid.
When such a derivative is evaluated, all voltages and currents are assumed to be independent of temperature. 
Apart from this the `ddx` filter behaves identical as when used with nodes/branches, 
the derivative of the temperature is calculated by repeated application of the chain rule.

#### Examples

``` verilog
x = ddx($temperature,$temperature)
y = ddx(v(node),$temperature)
z = ddx(i(branch),$temperature)
// x = 1, y=z=0

foo = 20*exp($temperature/10)+V(node)
bar = ddx(foo,$temperature)
// bar = 2*exp($temperature/10)
```




### Symbolic Derivatives with respect to Voltages

Equations of compact models usually depend upon voltage differences `V(a,b)` (or equivalently branch voltage `V(br_ab)`).
The derivatives of these model Equations are required/useful during parameter extraction and for use in circuit simulators. However, Verilog-A only allows derivatives w.r.t. to node potentials. 

Usually, such voltage derivatives are instead calculated with respect to the derivative of the voltage's 
upper node `ddx(foo,V(a,b) = ddx(foo,V(a))`.
This approach can fail when an equation depends on multiple branch voltages, as is demonstrated by the example below.
For ensuring correct behavior it is therefore more desirable to calculate the derivative by `V(a,b)` directly.

``` verilog
foo = V(a,b) + V(c,a)
dfoo1 = ddx(foo, V(a))
dfoo2 = ddx(foo,V(a,b))
// dfoo1 = 0, dfoo2 = 1
```

#### Guide

The behavior of the `ddx` analog filter is extended so that `ddx(foo,V(node1,node2))` is valid.
Branch currents are treated as constants. Voltage derivatives w.r.t. `V(node1,node2)` are implemented as follows:

* The derivative of `V(node1,node2)` is 1
* The derivative of `V(node2,node1)` is -1
* The derivative of `V(branchX)` is 1 if the branches nodes are `node1` and `node2`: `branch (node1, node2) branchX`
* The derivative of `V(branchX)` is -1 if the branches nodes are `node2` and `node1`: `branch (node2, node1) branchX`
* In all other cases the derivative is 0

Otherwise, the `ddx` filter behaves identical as when used with nodes/branches.
The derivative of the argument is calculated by repeated application of the chain rule.

#### Example

``` verilog
branch (b,e) br_be;

begin
    Vt = $vt;
    Ib = Isbc * exp(V(b,c)/Vt) + Isbe * exp(V(br_be)/Vt);
    gbc = ddx(Ib, V(b,c)); // gbc =  Isbc/Vt*exp(V(b,c)/Vt)
    gbe = ddx(Ib, V(b,e)); // gbe =  Isbe/Vt*exp(V(b,c)/Vt)

end
```

#### Technical Background

For performance reasons OpenVAF uses voltage derivatives instead of potential derivatives to calculate the Jacobian matrix entries.
Consider a network with two nodes `a` and `b` which are connected by a single branch `br_ab` whose current only depends upon the voltage difference of the two nodes. 
The matrix entries can then be calculated as follows: 

``` verilog
ddx(I(<a>),V(a))=ddx(I(<b>),V(b)) = ddx(I(br_ab),V(a,b))
ddx(I(<a>),V(b))= ddx(I(<a>),V(b)) = - ddx(I(br_ab),V(a,b))
```

Almost all equations in compact models have above form using this technique effectively enables to reduce the number of derivatives by a factor of 4.
Considering how complicated and therefore computationally expensive such derivatives can be, it is unlikely even modern compilers could optimize these duplication's away completely.
Therefore, it is preferable for OpenVAF to calculate derivatives by voltage difference and then calculate the Matrix entries from the results.

[vams]: https://www.accellera.org/images/downloads/standards/v-ams/VAMS-LRM-2-4.pdf
[vae]: dspom.gitlab.io/VerilogAE

