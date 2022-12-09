Built in HICUM/L2 Output Characteristics Xyce Simulation
.options abstol=1e-12 reltol=1e-6 temp=26.85 vntol=1e-6

Q1 C B 0 0 qhic

VB B  0 DC 0
VC C  0 DC 0


.model qhic npn Level=8
.inculde model.l

.control

*dc VC 0 2 0.001 VB 0.65 0.9 0.001 ; 
op
plot -i(VC)
.endc

.end
