	.globl times

# times takes two unsigned integers, a and b, and returns their product
times:
	# %edi -> a (unsigned int)
	# %esi -> b (unsigned int)
	# %eax -> ret

	# %ecx -> idx
	# %edx -> rem
	# %r8d -> val
	# %r9d -> tmp

	mov $0, %eax	# ret = 0

	cmp $0, %edi	# if (a == 0) {
	je done		# 	return
			# }

	cmp $0, %esi	# if (b == 0) {
	je done		#	return
			# }

	mov %edi, %edx	# rem = a

loop_outer:		# for {
	cmp $0, %edx	# 	if (rem == 0) {
	je done		# 		return
			# 	}

	mov $1, %r9d	# 	tmp = 1
	mov $1, %ecx	# 	idx = 1
	mov %esi, %r8d	# 	val = b

loop_inner:		#	for {
	add %ecx, %r9d	# 		tmp += idx
	cmp %edx, %r9d	# 		if (tmp > rem) {
	jg endl_inner	# 			break
			# 		}

	mov %r9d, %ecx	# 		idx = tmp
	add %r8d, %r8d	# 		val += val

	jmp loop_inner	# 		continue
			#	}

endl_inner:
	sub %ecx, %edx	# 	rem -= idx
	add %r8d, %eax	# 	ret += val

	jmp loop_outer	# 	continue
			# }

done:
	ret

