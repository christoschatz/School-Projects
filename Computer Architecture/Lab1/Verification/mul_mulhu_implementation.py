# Define mul and mulhu functions in order to compare with cpu results
def mul(x, y):
  return (x * y) & 0xFFFFFFFF

def mulhu(x, y):
  return ((x * y) >> 32) & 0xFFFFFFFF

with open("algorithm.txt", "r") as input_file, open("output.txt","w") as output_file:
  lines = input_file.readlines()
  for i in range(0, len(lines), 2):
    x = int(lines[i], 16)
    y = int(lines[i + 1], 16)
    result_mul = hex(mul(x, y))[2:].zfill(8)
    result_mulhu = hex(mulhu(x, y))[2:].zfill(8)
    output_file.write(result_mul + "\n")
    output_file.write(result_mulhu + "\n")
