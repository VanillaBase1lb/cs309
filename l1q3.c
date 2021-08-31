#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int main()
{
    char bcdCode[10][5] = {"0000", "0001", "0010", "0011", "0100",
                            "0101", "0110", "0111", "1000", "1001"};
    char mode;
    char input[50];
    char converted[50] = "";
    int temp;
    
    printf("Enter whether to convert from BCD(b) or decimal(d):\n");
    scanf("%c", &mode);
    printf("Input:\n");
    scanf("%s", input);
    
    switch (mode)
    {
    case 'd':
        for (int i = 0; input[i] != '\0'; i++) // move through input and replace with bcd
        {
            if (isdigit(input[i]) == 0)
            {
                printf("invalid numerical input\n");
                return 0;
            }
            temp = input[i] - '0';
            strcat(converted, bcdCode[temp]);
        }
        break;
    
    case 'b':
        if (strlen(input) % 4 != 0)
        {
            printf("bcd input length should be multiple of 4\n");
            return 0;
        }

        for (int i = 0; input[i] != '\0'; i = i + 4) // move through 4 bits
        {
            char bcd[5];
            char decimal[2];
            short flag = 0;
            strncpy(bcd, &input[i], 4);

            for (int j = 0; j < 10; j++) // fetch corresponding bcd code
            {
                if (strcmp(bcd, bcdCode[j]) == 0)
                {
                    sprintf(decimal, "%d", j);
                    strcat(converted, decimal);
                    flag = 1;
                }
            }
            if (flag == 0)
            {
                printf("invalid bcd input\n");
                return 0;
            }
        }
        break;

    default:
        printf("invalid input, only 'b' or 'd'\n");
        return 0;
        break;
    }
    
    printf("%s\n", converted);

    return 0;
}