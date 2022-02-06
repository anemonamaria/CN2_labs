############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project alarma_mam
set_top myTopFunction
add_files alarma_mam/alarma_mam.cpp
add_files -tb alarma_mam/test.cpp
add_files -tb alarma_mam/test.h
open_solution "alarma_mam" -flow_target vivado
set_part {xc7a12ticsg325-1L}
create_clock -period 10 -name default
#source "./alarma_mam/alarma_mam/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
