onerror {quit -f}
vlib work
vlog -work work booth.vo
vlog -work work booth.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.booth_vlg_vec_tst
vcd file -direction booth.msim.vcd
vcd add -internal booth_vlg_vec_tst/*
vcd add -internal booth_vlg_vec_tst/i1/*
add wave /*
run -all
