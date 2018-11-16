.data
    str: .space 1000
    msgempty: .asciiz "Input is empty"
    msginvalid: .asciiz "Invalid base-28 number"
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
