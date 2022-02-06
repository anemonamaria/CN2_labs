############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project semaphores_mam
set_top myTopFuncSem
add_files semaphores_mam/sem.cpp
add_files -tb semaphores_mam/test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb semaphores_mam/test.h -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7a100t-csg324-1}
create_clock -period 10 -name default
source "./semaphores_mam/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
