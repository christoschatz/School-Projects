# Script to compare results given by CPU and mul_mulhu_implementation.py
with open("output.txt","r") as file1, open("testhexdatawhite.txt","r") as file2, open("result.txt","w") as result_file:
  lines1 = file1.readlines()
  lines2 = file2.readlines()
  for i in range(min(len(lines1), len(lines2))):
    if lines1[i] == lines2[i]:
      result_file.write("1\n")
    else:
      result_file.write("0\n")
  for i in range(min(len(lines1), len(lines2)), max(len(lines1), len(lines2))):
    result_file.write("0\n")
  print("Results saved to result.txt")
