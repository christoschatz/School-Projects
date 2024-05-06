quit -sim
file delete -force work

vlib work
vlog -f files_rtl.f

vsim -novopt processor_tb
log -r /*

run -all

add wave -position end  sim:/processor_tb/clk
add wave -position end  sim:/processor_tb/instruction
add wave -position end  sim:/processor_tb/pipeline_commit_NPC
add wave -position end  sim:/processor_tb/pipeline_commit_wr_idx
add wave -position end  sim:/processor_tb/pipeline_commit_wr_data
add wave -position end  sim:/processor_tb/pipeline_commit_wr

radix -hexadecimal