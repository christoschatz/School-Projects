# Define the number of iterations
n = 18

# Initialize the first two values in the sequence
fibonacci = [0, 1]

# Calculate the next n-2 values in the sequence
for i in range(2, n):
  fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])

# Convert the values to hexadecimal using 8 characters per value
hex_fibonacci = [hex(num)[2:].zfill(8) for num in fibonacci]

# Save the hexadecimal values to a file
with open("fibonacci.txt", "w") as f:
  for num in hex_fibonacci:
    f.write(num + "\n")