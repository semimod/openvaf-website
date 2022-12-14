Built in HICUM/L2 Output Characteristics NGspice Simulation
.options abstol=1e-12 reltol=1e-6 temp=26.85 vntol=1e-6

VB B  0 DC 0
VC C  0 DC 0

.model qhic npn Level=8
.include model.l

Q1 C B 0 0 qhic

.control

dc VC 0 2 0.001 VB 0.65 0.9 0.001 ; 
*dc VC 0 2 0.001 VB 0.8 0.9 0.02 ; 
plot -i(VC)
.endc

.end
