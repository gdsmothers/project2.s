.data
    str: .space 4
    
.text 
    main: 
    #tells program to expect userinput
    li $v0, 8 
    la $a0, str
    li $a1, 4
    syscall 
    #tell the system the end of main 
    li $v0, 10
    syscall
