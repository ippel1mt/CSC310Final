

	.global main
	.extern printf

main:
	PUSH {fp, lr}
	
	@ ask user for number
	LDR R0, =input_string
	BL printf

	@ scan for input
	LDR R0, =input_format
	LDR R1, =number
	BL scanf

	@ move value to R5
	LDR R6, =number
	LDR R6, [R6]

	@ initialize output number
	MOV R4, #0
	
loop:
	@ check to exit program
	CMP R6, #0
	BLE exit

	ADD R4, R6

	@ subtract and branch
	SUB R6, #1
	B loop

exit:
	@ end the program
	LDR R0, =final_output
	MOV R1, R4
	BL printf
	POP {fp, pc}

.data
input_format: .asciz "%d"
input_string: .asciz "Please enter in a number: "
final_output: .asciz "Your summation was: %d\n"
number: .word 1
