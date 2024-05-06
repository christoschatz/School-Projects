with open("hex_numbers_list.txt","r") as input_file, open("output_file.txt", "w") as output_file:
  # Loop through each line in the input file
  for line in input_file:
    # Convert the line to an integer
    num = int(line.strip(), 16)

    # Perform the RISC-V operations
    x7 = num
    x7 += 5
    x8 = x7 + 1
    x9 = x7 * x8
    x10 = x9 << 2
    x10 -= x9

    # Convert x10 value to a 32-bit hexadecimal number (8 characters) and write it to the output file
    output_file.write("{:08x}\n".format(x10 & 0xFFFFFFFF))
