Built in BSIMBULK Output Characteristics NGspice Simulation
.options abstol=1e-12 reltol=1e-6 temp=26.85 vntol=1e-6 chgtol=1e-14

VG G  0 DC 1 SIN (0.5 0.4 1M)
VD D  0 DC 1

.model mosn bsimbulk_va
.include bsim.lib     
    
N1 D G 0 0 mosn

.control
pre_osdi bsimbulk.osdi
tran 0.0001ns 50ns 0ns 0.0001ns
plot -i(VD)
.endc

.end
