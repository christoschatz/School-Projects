.text
.align 4
.global code_to_test
code_to_test: lui t0,0xfffff
addi t1,t1,0xff
slli t1,t1,4
addi t1,t1,0xf
add t1,t0,t1
addi t0,x0,0xf
mul s0,t0,t1
mulhu  s1,t0,t1