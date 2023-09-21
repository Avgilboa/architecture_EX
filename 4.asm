.data
	startOfArray:.word 0x10010010
	start:.word 0
	end:.word 16
.text

lw $t0, startOfArray ## t0 = the adress of the array
lw $t1, start         ## t1 = index
lw $t5 , end		## t5 = 16 -> the last word
xor $s3, $s3, $s3     ## s3 = counter
addi $t4 , $0, 10	## t4 = 10 -> for multiple the value from the array
Loop:
	lw $t2, 0($t0)  # t2 = value from the array[i] 

	mult $t2, $t4    # t2 *= 10
	mfhi $t5	# t5 = load the hi bits from the mult 
	sgt $t3, $t5, $0 # t3 = if the mult need more then 32 bits than mfhi != 0 return 1 else return 0
	
	add $s3 ,$s3,  $t3  # count t3 (number of time that mghi used)
	
	addi $t0, $t0, 4  ## array[start+1] = array + 4 bytes
	addi $t1, $t1, 1  ## start++
	
	blt $t0, $t5, Loop # if start < 16 Loop again (iterate from 0 to 15)
End:
	