with open("hex_numbers_list.txt", "r") as input_file:
    # Read the hexadecimal number from the file
    hex_number = input_file.readline().strip()

# Convert the hexadecimal number to an integer
int_number = int(hex_number, 16)

# Check if the integer is even or odd
if int_number % 2 == 0:
    flag = "00000000"  # Even
else:
    flag = "00000001"  # Odd

# Open the output file for writing
with open("hex_number_list_out.txt", "w") as output_file:
    # Write the flag to the file
    output_file.write(flag)