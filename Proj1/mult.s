/* mult.s --
*
*/

	.global main
	.extern printf
main:
	PUSH {fp, lr}

	ldr R0, =enter_string
	BL printf

	ldr R0, =format
	ldr R1, =base
	BL scanf

	ldr R0, = exponent_string
	BL printf

	ldr R0, =format
	ldr R1, =exponent
	BL scanf

#	ldr R0, =test_string
#	ldr R1, = base
#	ldr R2, =exponent
#	ldr R1, [R1]
#	ldr R2, [R2]
#	BL printf

	mov R4, #1

	ldr R6, =exponent
	ldr R6, [R6]

	ldr R5, =base
	ldr R5, [R5]
	
exp:
	mul R4, R5, R4

	sub R6, #1
	cmp R6, #0
	beq exit
	bne exp




exit:
	ldr R0, =final_output
	mov R1, R4
	BL printf

	POP {fp, pc}

.data
enter_string: .asciz "Enter in a base: "
format: .string "%d"
exponent_string: .asciz "Enter an exponent: "
base: .word 1
exponent: .word 1
test_string: .asciz "base %d, exponent %d"
final_output: .asciz "Your value was %d\n"


