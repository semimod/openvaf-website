+++
title = "Downloads"
description = "Download precompiled executables of OpenVAF"
date = 2022-12-16T08:00:00+00:00
updated = 2022-12-16T08:00:00+00:00
draft = false

[extra]
class = "page single"
+++

Below you can download precompiled binaries for the latest releases and read the changelog between each version.
See our [installation](https://openvaf.semimod.de/docs/getting-started/installation/) instructions for details.

#### OpenVAF 23.2.0 (2023-2-2)



|Link                                        |   Description                               |
|--------------------------------------------|--------------------------------------------:|
|[openvaf_23_2_0_windows_amd64.zip](https://openva.fra1.cdn.digitaloceanspaces.com/openvaf_23_2_0_windows_amd64.zip)   |  Windows x86-64 executable                  |
|[openvaf_23_2_0_linux_amd64.tar.gz](https://openva.fra1.cdn.digitaloceanspaces.com/openvaf_23_2_0_linux_amd64.tar.xz)  |  Linux x86-64 executable                    |
|*To be added in the future*                 |  Windows x86-64 installer                   |
|*To be added in the future*                 |  Debian x86-64 package                      |
|*To be added in the future*                 |  REHL x86-64 package                        |


**Breaking Changes**

* Removed LLD integration which made packaging exceptionally difficult and caused crashes on Windows in some cases. OpenVAF now requires that the system linker (and `msvcrt.lib` when targeting windows) is available.

**Fixes**

* Correctly detect file encoding.
* Improve diagnostic messages.
* Removed bug when a user defined function is used with `$limit`.
* Correctly parse net declarations without attached discipline (`ground`).
* Fix crash when a model contains no branch contributes.
* Fix crash when the associated current of a voltage source is unused.
* Fix crash for parameters with `exclude` expressions.
* Fix crash when using instance parameters.
* Fix swapped signatures for `slew` and `transition`.
* Take into account `aliasparam` declarations .

#### OpenVAF 22.12.0 (2022-12-16)



|Link                                        |   Description                               |
|--------------------------------------------|--------------------------------------------:|
|[openvaf_22_12_0_windows_amd64.zip](https://openva.fra1.cdn.digitaloceanspaces.com/openvaf_22_12_0_windows_amd64.zip)   |  Windows x86-64 executable                  |
|[openvaf_22_12_0_linux_amd64.tar.gz](https://openva.fra1.cdn.digitaloceanspaces.com/openvaf_22_12_0_linux_amd64.tar.gz)  |  Linux x86-64 executable                    |
