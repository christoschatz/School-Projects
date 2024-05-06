# Create random hexadecimal numbers 
import random

possible_letters = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E','F']

hex_out = open('hex_numbers_list.txt','w')
out_str = ''
for j in range(0, 8192):
  for i in range(0, 8):
    current_letter = random.choice(possible_letters)
    out_str = out_str + current_letter
  hex_out.write(str(out_str))
  hex_out.write('\n')
  out_str = ''

hex_out.close()