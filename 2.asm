.data 
	index:.word 0 ## the first iteration
	end:.word 7 ## iterate untill it equal to 6
	A:.word 1   ## A = A * 3
	B:.word 1  ## B = B * 4
	C:.word 1  ## next C = -1 * C

.text
	lw $t0, index  # t0 = index
	lw $t1 end     # t1 = end
	lw $t2, A
	lw $t3 , B
	lw $t4 , C
	xor $s1, $0, $0
Loop:
	# t5 save the result of each round
	mul $t5, $t2, $t3 # t5 = Ai * Bi
	mul $t5, $t5, $t4  # t5 = t5(Ai * Bi) * Ci
	add $s1, $s1, $t5  # s1 = s1 + t5
	
	mul $t2, $t2, 3  ## A[i] = A[i-1] * 3
	mul $t3, $t3, 4 ## B[i] = B[i-1] * 4
	mul $t4, $t4, -1  ## C[i] = C[i-1] * -1
	
	addi $t0, $t0, 1  ## index++
	blt $t0, $t1, Loop  #  if index < 7 Loop again
	
End: