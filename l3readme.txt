l3q1:
    Counting the number of even numbers from a given array of 8-bit integer.
    Solved by doing binary AND with 1.
    
l3q2:
    Counting the number of elements in the array that are <0, >0, =0 and print respectively.
    Solved by doing circular left shift on the number and checking carry flag since the MSB
    is 1 for negative numbers in 2's complement.
    
l3q3:
    Idenifying whether each 8 bit signed number in the array has even(00) or odd(01).
    Solved by using jpo instruction which checks if the last arithmetic operation result had
    parity bit set or not in the flag register.
    
Shubhradeep Saha 19580
Yuvraj Mishra 19576