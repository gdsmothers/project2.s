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
    j length
    
    CharacterSpaces:
    #deletes spaces if there are any
    addi $a0, $a0, 1
    j LeftSpaces
    
    
    
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
    

