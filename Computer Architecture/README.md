# Computer Architecture
SystemVerilog project which implements a RISC-V instruction set 5-stage pipeline processor using forwarding technique. 

This was a group project. The members of the group were:
- [Aggelos Kavaleros](https://github.com/AggelosKv)
- [Christos Chatzisavvas](https://github.com/christoschatz)


![Banner](https://github.com/christoschatz/School-Projects/blob/main/Computer%20Architecture/screenshots/processor.png)

# Lab 1:

- To implement the MUL and MULHU functions, modifications were made to both the decode and execution stages.
  
![Banner](https://github.com/christoschatz/School-Projects/blob/main/Computer%20Architecture/screenshots/mul_mulhu.png)


# Lab 2:

- To enhance efficiency, a 5-stage pipeline was implemented. This involved integrating a unit within the decode stage to identify dependencies between read-after-write operations, halting sequential execution until such dependencies cease to exist.

![Banner](https://github.com/christoschatz/School-Projects/blob/main/Computer%20Architecture/screenshots/pipeline.png)

# Lab 3:

- To mitigate instruction stalling, we utilize the forwarding technique within the decode stage. Consequently, the processor stalls only when the required value for a register originates from a memory load operation.

![Banner](https://github.com/christoschatz/School-Projects/blob/main/Computer%20Architecture/screenshots/forwarding.png)
