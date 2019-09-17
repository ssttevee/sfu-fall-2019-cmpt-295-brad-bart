	.globl times

# times takes two unsigned integers, a and b, and returns their product
times:
	# %edi -> a (unsigned int)
	# %esi -> b (unsigned int)
	# %eax -> ret

	# %ecx -> i

	# initialize the return value
	mov $0, %eax	# ret = 0

	# check fast path, where either a or b are zero
	# since a*0 or 0*b = 0

	cmp $0, %edi	# if (a == 0) {
	je done		# 	return
			# }

	cmp $0, %esi	# if (b == 0) {
	je done		#	return
			# }

	# initialize the countdown
	mov %edi, %ecx	# i = a

loop:			# do {
	# add b to the return value on each iteration
	addl %esi, %eax	# 	ret += b
	loop loop	# } while (--i > 0)

done:
	ret

