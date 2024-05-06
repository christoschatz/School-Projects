#This program has many dependencies
#from line to line, to show forwarding
#capabilities of the processor
#(only stall for branch and load from mem)
.align 4
.global code_to_test 
code_to_test:li x12,512
slli x12,x12,5
add x11,x0,x0

next_mem_element:

lw x7,0(x11)

addi x7,x7,5
addi x8,x7,1
mul x9,x7,x8
slli x10,x9,2
sub x10,x10,x9

sw x10,0(x11)

addi x11,x11,4
ble x11,x12,next_mem_element
jr ra