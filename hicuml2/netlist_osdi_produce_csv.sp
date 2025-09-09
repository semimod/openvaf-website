OSDI Example

VB B  0 DC 0.1 AC 1 SIN (0.5 0.4 1M)
VC C  0 DC 1

.model npn_full_sh hicuml2va
.include model.l

N1 C B 0 0 npn_full_sh

.control
set filetype ascii
set wr_vecnames
set wr_singlescale
pre_osdi hicumL2V3p0p0.osdi

dc VC 0 2 0.01 VB 0.76 0.9 0.02 ; 
wrdata output.csv all
.endc

.end
