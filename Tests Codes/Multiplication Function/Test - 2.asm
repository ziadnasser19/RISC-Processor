# Power Function
# Calculate 0($0) to the power of 1($0)
# The output is stored in $5


# Load the inputs
lw $1, 0($0)
lw $2, 1($0)

# Store the defult result (1)
addi $3, $0, 1
sw $3, 1($0)


addi $4, $0, 0
power_loop:
beq $4, $2, exit
addi $5, $0, 0
jal mul
sw $5, 1($0)
addi $4, $4, 1
j power_loop

exit: j exit

mul:

# Set the stack pointer at the last position in the memory
addi $6, $0, -1

# Save Preserved values
sw $4, 0($6) 
sw $3, -1($6)
sw $2, -2($6)

# Load inputs
lw $4, 0($5) 
lw $3, 1($5)

addi $2, $0, 0
addi $5, $0, 0

loop:
beq $2, $4, return
add $5, $5, $3
addi $2, $2, 1
j loop

return:

# Load Preserved values
lw $4, 0($6)
lw $3, -1($6)
lw $2, -2($6)

jr $7