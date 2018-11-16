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
    #tell the system the end of main 
    li $v0, 10
    syscall 
    
    EmptyInput:
    #checks to see if the input is empty
    la $a0, msgempty #loading empty message 
    li $v0, 4 #prints string
    syscall 
    j exit 

