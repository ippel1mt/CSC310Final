/* fib.s -- fibonacci number printed out
*  M Ippel
*  CSC310W19
*/

	.text
	.global main
	.func main
	.extern printf
main:
        push {fp, lr}
	add fp, sp, #4
	push {R0}
	ldr R0, [R1, #4]
        BL atoi
	ldr R1, =number
	str R0, [R1]
	pop {R1}

	ldr R0, =command_arg
	ldr R1, =number
	ldr R1, [R1]
	BL printf

	ldr R4, =number
	ldr R4, [R4]

	cmp R4, #1
	beq exit2

	cmp R4, #0
	beq exit1

	mov R4, #0
	mov R5, #1
	ldr R8, =number
	ldr R8, [R8]	

fibloop:
        sub R8, #1
        cmp R8, #0
        beq exit0
        add R6, R5, R4
        mov R4, R5
	mov R5, R6
        B fibloop

exit:
        ldr R0, =output
	ldr R1, =number
	ldr R1, [R1]
	BL printf
	pop {fp, pc}

exit0:
	mov R2, R6
	B exit

exit1:
	mov R2, #0
	B exit

exit2:
	mov R2, #1
	B exit

.data
number: .word 1
command_arg: .asciz "The number entered was %d\n"
output: .asciz "Your fibonacci number of %d is %d\n"


