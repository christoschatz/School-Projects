.text
.align 4
.global code_to_test 
code_to_test:add t2,x0,x0
li t3,0xfff
loop:
lw t0,(t2)
lw t1,4(t2)
mul s0,t0,t1
mulhu  s1,t0,t1
sw s0,(t2)
sw s1,4(t2)
addi t2,t2,0x8
beq t2,t3,end
j loop
end:
jr ra