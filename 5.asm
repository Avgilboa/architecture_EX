
Power:
	addi $sp, $sp, -12  #saving place in the stack for a,b,$ra
	sw $a1, 8($sp)      # save b in the stack (sp)
	sw $a0, 4($sp)	    #savr a int the stack 
	sw $ra , ($sp)	    # SAVE $ra
	bgt $a1, $0, else   # if b>0 jump to else
	addi $v0, $0, 1     # make $v0 = 1 when b is 0
	addi, $sp, $sp, 12  # realocate the stack place
	jr $ra			# jump with the adresses in the stack to the next address on the ecurtion
else:
	addi $a1, $a1, -1 	# b--
	jal Power		# jump to Power untill b =0
	lw $ra, ($sp)		# load the $ra of the recurstion
	lw $a0, 4($sp)		# load the current value of a (not change)
	lw $a1, 8($sp)		# load the current value of b 
	addi $sp, $sp, 12      # free the place on the stack
	mul $v0, $v0, $a0	#make the results with power big with one more
	jr $ra			# Jump back to the next recurtion
