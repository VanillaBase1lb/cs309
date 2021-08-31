l1q1:
    Converting integer, float and double datatypes to bits, representing how these datatypes are actually sored in memory.
    For integer, using simple divide method and then reverse string. If integer input is negative, then perform 2's complement.
    For float, converting integer and float part to binary, calculating bias exponent and then shifting the decimal point to get to 1.XXXXX form and get mantissa.
    For double, same process as float, but with different bias value and number of bits.
    Takes input from stdin.
    
l1q2:
    Converting integer and float datatypes presented in binary format to decimal and performing addition and multiplication.
    For integer, using simple 2^x method to calculate value in decimal.
    For float, folling the IEEE formula to convert binary to deimal.
    Then simply adding and multiplying the decimals.
    Takes input from stdin.
l1q3:
    Converting decimal to BCD and vice versa.
    For decimal to BCD, replacing every digit with its corresponding BCD code.
    Fot BCD to decimal, checking for BCD code in steps of 4 and replacing it with its decimal equivalent.
    Takes input from stdin.
    
Shubhradeep Saha 19580
Yuvraj Mishra 19576