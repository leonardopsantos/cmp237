.section .data
val1: .word 0x03
val2: .word 0xA5A5A5A5
val3: .word 0xCACACACA
val4: .word 0xA5A5A5A5

.section .text
.globl _start



_start:
	ldr r0, =val1
	ldr r3, [r0]
	add r4, r3, r1	/* true data depency */
	add r7, r1, r2
	mov r0, #0
	mov r1, #1
	mov r2, #2
	mov r3, #3
	mov r4, #4
	mov r5, #5
	ldr r0, =val1
	ldr r3, [r0]
	add r4, r3, r1	/* true data depency */
	add r7, r1, r2
	add r5, r1, r2
	add r3, r1, r2	/* antidependence, WAR */
	add r3, r1, #4	/* antidependence, WAW */
/* syscall exit(int status) */
	mov r0, #0      /* status -> 0 */
	mov r7, #1      /* exit is syscall #1 */
	swi #0          /* invoke syscall */

	