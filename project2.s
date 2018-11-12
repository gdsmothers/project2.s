.data
    str: .space 4
    
.text 
    main: 
    #tells program to expect userinput
    li $v0, 8 
    #tell the system the end of main 
    li $v0, 10
    syscall
