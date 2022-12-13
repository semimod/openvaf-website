Verilog-A HICUM/L2 Output Characteristics NGspice Simulation
.options abstol=1e-12 reltol=1e-6 temp=26.85 vntol=1e-6

VB B  0 DC 0.1 AC 1 SIN (0.5 0.4 1M)
VC C  0 DC 1

.model npn_full_sh hicuml2va
.include model.l

N1 C B 0 0 npn_full_sh

.control
pre_osdi hicumL2V2p4p0.osdi
dc VC 0 2 0.001 VB 0.65 0.9 0.001 ; 
*dc VC 0 2 0.001 VB 0.8 0.9 0.02 ; 
plot -i(VC)
.endc

.end
