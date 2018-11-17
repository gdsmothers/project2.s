.data
    str: .space 1000
    msgempty: .asciiz "Input is empty."
    msginvalid: .asciiz "Invalid base-28 number."
    msglong: .asciiz "Input is too long."
.text 
    main: 
    #tells program to expect userinput
    li $v0, 8 
    la $a0, str
    li $a1, 1000
    syscall 
    
    RightSpaces:
    
    
    LeftSpaces:
    #deletes the left spaces if any in user input 
    li $t8, 32 #ascii code for space
    lb $t9, 0($a0) #stores 0 into $t9
    beq $t8, $t9, CharacterSpaces
    move $t9, $a0 
    j Length
    
    CharacterSpaces:
    #deletes spaces if there are any
    addi $a0, $a0, 1
    j LeftSpaces
    
    Length:
    addi $t0, $t0, 0 
    addi $t1, $t1, 20
    add $t4, $t4, $a0 #add can add registers and with addi you have to have a  immediate number
    
    FindLength:
    #Finds the length of the string
    lb $t2, 0($a0)
    beqz $t2, CheckLength  #if t2 equal to 0 go to CheckLength function
    beq $t2, $t1, CheckLength #if t1 and t1 are equal go to CheckLength function
    addi $a0, $a0, 1
    addi $t0, $t0, 1
    j FindLength 
    
    CheckLength:
    #Checks if the string is empty or too long
    beqz $t0, EmptyInput 
    slti $t3, $t0, 5 #if string is of appropriate length
    beqz $t3, LongInput
    move $a0, $t4 
    j ConvertString 
    
    ConvertString:
    #makes sure that character is in range
    lb $t5, 0($a0)  
    beqz $t5, Conversion 
    beq $t5, $t1, Conversion
    slti $t6, $t5, 48  #if the character is less than 0 than invalid 
    bne $t6, $zero, InvalidInput
    slti $t6, $t5, 58  # if character is less than 9 then valid 
    bne $t6, $zero, FindingChar
    slti $t6, $t5, 65  # if character less than A then invalid 
    bne $t6, $zero, InvalidInput
    slti $t6, $t5, 82  # if character less than R then valid 
    bne $t6, $zero, FindingChar
    slti $t6, $t5, 97  # if character less than a then invalid 
    bne $t6, $zero, InvalidInput
    slti $t6, $t5, 115 # if character less than s then valid  
    bne $t6, $zero, FindingChar
    bgt $t5, 114, InvalidInput # if character greater than r then invalid  
    
    FindingChar:
    #checks character individually for string
    addi $a0, $a0, 1
    j ConvertString

    Conversion:
    move $a0, $t4 
    addi $t7, $t7, 0 #intializes t7
    add $s0, $s0, $t0
    addi $s0, $s0, -1 #sets s0 to s0 plus 16-bit immediate for overflow
    li $s3, 3 #will be stored at first character
    li $s2, 2 #will be stored at 2nd character
    li $s1, 1 #will be stored at 3rd character
    li $s5, 0 #will be stored at 4th character
    
    exit:
    #tell the system the end of main 
    li $v0, 10
    syscall 
    
    EmptyInput:
    #checks to see if the input is empty
    la $a0, msgempty #loading message 
    li $v0, 4 #prints string
    syscall 
    j exit 
    
    InvalidInput:
    #checks to see if the input is invlalid 
    la $a0, msginvalid
    li $v0, 4
    syscall 
    j exit 
    
    LongInput:
    #checks to see if the input is longer than 4 characters
    la $a0, msglong
    li $v0, 4
    syscall 
    j exit 
    

