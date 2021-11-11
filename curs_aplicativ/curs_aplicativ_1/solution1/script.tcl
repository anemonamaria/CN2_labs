############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project curs_aplicativ_1
set_top fi
add_files curs_aplicativ_1/functii_inline.cpp
add_files -tb curs_aplicativ_1/functii_inline_tb.cpp
add_files -tb curs_aplicativ_1/functii_inline_tb.h
open_solution "solution1" -flow_target vivado
set_part {xc7a100tcsg324-1}
create_clock -period 10 -name default
#source "./curs_aplicativ_1/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
