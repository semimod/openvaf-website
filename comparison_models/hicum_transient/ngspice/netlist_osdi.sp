OSDI HICUM/L2 Output Characteristics Xyce Simulation
.options abstol=1e-12 reltol=1e-6 temp=26.85 vntol=1e-6 chgtol=1e-14

VB B  0 DC 0.8 AC 1 SIN (0.8 0.1 1G)
VC C  0 DC 1

.model npn_full_sh hicuml2va
.include model.lib

N1 C B 0 0 npn_full_sh

.control
pre_osdi hicumL2V2p4p0.osdi
tran 0.0001ns 200ns 0ns 0.0001ns
*plot -i(VC)
.endc

.end
