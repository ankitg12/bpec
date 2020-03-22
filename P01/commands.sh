cat assignment.txt
# Simple Program to add two numbers
cat add_two.c
# Get Pre-processed output
gcc -E add_two.c 
# assembly output
gcc -S add_two.c -o add_two_x86.s
cat add_two_x86.s
# object outout 
gcc -c add_two.c -o add_two_x86.o
objdump -d add_two_x86.o
# executable output
gcc add_two.c -o add_two_x86
objdump -d add_two_x86

# Get Pre-processed output for ARM
arm-linux-gnueabihf-gcc -E add_two.c
# Assembly output for ARM 
arm-linux-gnueabihf-gcc -S add_two.c -o add_two_arm.s
cat add_two_arm.s 
# Object output for ARM
arm-linux-gnueabihf-gcc -c add_two.c -o add_two_arm.o
arm-linux-gnueabihf-objdump -d add_two_arm.o 
# Executable output for ARM
arm-linux-gnueabihf-gcc add_two.c -o add_two_arm
arm-linux-gnueabihf-objdump -d add_two_arm.o
ls -lt