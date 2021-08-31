#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

char *strrev(char *str) // to reverse a string
{
    if (!str || ! *str)
        return str;

    int i = strlen(str) - 1, j = 0;

    char ch;
    while (i > j)
    {
        ch = str[i];
        str[i] = str[j];
        str[j] = ch;
        i--;
        j++;
    }
    return str;
}

int main()
{
    char dataType;
    int in;
    float fl;
    double du;
    char binary[64] = "0";
    int length;
    short negative = 0;
    int biasValue;

    printf("Enter the datatype: Integer(i), Float(f), Double(d)\n");
    scanf("%s", &dataType);
    printf("Enter the value in decimal form:\n");
    
    switch (dataType)
    {
    case 'i':
        scanf("%d", &in);
        
        if (in < 0)
            negative = 1;
        length = sizeof(int);
            
        int temp = abs(in);
        int i;
        // converting decimal int to binary
        for (i = 0; temp > 0; i++) // division process to get reverse binary
        {
            binary[i] = (temp % 2) ? '1' : '0';
            temp = temp / 2;
        }
        for (int j = i; j < length * 8; j++) // fill empty spaces with 0
        {
            binary[j] = '0';
        }
        binary[length * 8] = '\0';

        if (negative != 1)
            printf("%s\n", strrev(binary));
        
        else // if int is negative, print 2's complement
        {
            for (int j = 0; j < length * 8; j++) // 1's complement
            {
                if (binary[j] == '0')
                    binary[j] = '1';
                else
                    binary[j] = '0';
            }
            // add 1 to 1's complement
            int j;
            for (j = 0; binary[j] == '1'; j++)
            {
                binary[j] = '0';
            }
            binary[j] = '1';
            
            printf("%s\n", strrev(binary));
        }

        break;
        
    case 'f':
        scanf("%f", &fl);
        
        if (fl < 0)
            binary[0] = '1';
        length = sizeof(float);
        biasValue = 127;

        temp = abs((int)fl);
        char intPart[64] = "0";
        char mantissaF[24];
        // converting integer part to binary
        for (i = 0; temp > 0; i++) // division process to get reverse binary
        {
            intPart[i] = (temp % 2) ? '1' : '0';
            temp = temp / 2;
        }
        for (int j = i; j < sizeof(int) * 8; j++) // fill empty spaces with 0
        {
            intPart[j] = '0';
        }
        binary[sizeof(int) * 8] = '\0';
        strcpy(intPart, strrev(intPart));
        
        float tempf = fabs(fl) - abs((int)fl);
        char flPart[24] = "0";
        // converting float part to binary
        for (i = 0; tempf > 0; i++) // multiplication process to get binary
        {
            tempf = tempf * 2;
            if (tempf >= 1)
            {
                flPart[i] = '1';
                tempf = tempf - 1;
            }
            else
                flPart[i] = '0';
        }
        for (int j = i; j < 23; j++) // fill empty spaces with 0
        {
            flPart[j] = '0';
        }
        flPart[23] = '\0';
        int trueExponent = 0;
        // convert into normalized representation
        for (i = 0; intPart[i] == '0' && intPart[i] != '\0'; i++) // get to the first 1 in intPart
        {
        }
        if (intPart[i] == '1') // shift decimal point to the left
        {
            trueExponent = sizeof(int) * 8 - 1 - i;
            char tempBuffer[24];
            strcpy(tempBuffer, &intPart[i + 1]);
            strcat(tempBuffer, flPart);
            tempBuffer[23] = '\0';
            strcpy(mantissaF, tempBuffer);
        }
        else // shift decimal point to the right
        {
            for (i = 0; flPart[i] == '0' && flPart[i] != '\0'; i++)
            {
            }
            trueExponent = i - 1;
            strcpy(mantissaF, &flPart[i + 1]);
            for (int j = 0; j < 23; j++)
            {
                if (mantissaF[j] == '\0')
                    mantissaF[j] = '0';
            }
            mantissaF[23] = '\0';
        }
        int biasExponent = trueExponent + biasValue;
        char biasExpF[9] = "0";
        // converting bias exponent to binary
        for (i = 0; biasExponent > 0; i++)
        {
            biasExpF[i] = (biasExponent % 2) ? '1' : '0';
            biasExponent = biasExponent / 2;
        }
        for (int j = i; j < 8; j++)
        {
            intPart[j] = '0';
        }
        biasExpF[8] = '\0';

        printf("%c%s%s", binary[0], biasExpF, mantissaF);

        break;
        
    case 'd': // exact same process as float but larger values
        scanf("%lf", &du);
        
        if (du < 0)
            binary[0] = '1';
        length = sizeof(double);
        biasValue = 1023;

        temp = abs((int)du);
        char mantissaD[53];
        for (i = 0; temp > 0; i++)
        {
            intPart[i] = (temp % 2) ? '1' : '0';
            temp = temp / 2;
        }
        for (int j = i; j < sizeof(int) * 8; j++)
        {
            intPart[j] = '0';
        }
        binary[sizeof(int) * 8] = '\0';
        strcpy(intPart, strrev(intPart));
        
        float tempd = fabs(du) - abs((int)du);
        char duPart[53] = "0";
        for (i = 0; tempd > 0; i++)
        {
            tempd = tempd * 2;
            if (tempd >= 1)
            {
                duPart[i] = '1';
                tempd = tempd - 1;
            }
            else
                duPart[i] = '0';
        }
        for (int j = i; j < 52; j++)
        {
            duPart[j] = '0';
        }
        duPart[52] = '\0';
        trueExponent = 0;
        for (i = 0; intPart[i] == '0' && intPart[i] != '\0'; i++)
        {
        }
        if (intPart[i] == '1')
        {
            trueExponent = sizeof(int) * 8 - 1 - i;
            char tempBuffer[53];
            strcpy(tempBuffer, &intPart[i + 1]);
            strcat(tempBuffer, duPart);
            tempBuffer[52] = '\0';
            strcpy(mantissaD, tempBuffer);
        }
        else
        {
            for (i = 0; duPart[i] == '0' && duPart[i] != '\0'; i++)
            {
            }
            trueExponent = i - 1;
            strcpy(mantissaD, &duPart[i + 1]);
            for (int j = 0; j < 52; j++)
            {
                if (mantissaD[j] == '\0')
                    mantissaD[j] = '0';
            }
            mantissaD[52] = '\0';
        }
        biasExponent = trueExponent + biasValue;
        char biasExpD[12] = "0";
        for (i = 0; biasExponent > 0; i++)
        {
            biasExpD[i] = (biasExponent % 2) ? '1' : '0';
            biasExponent = biasExponent / 2;
        }
        for (int j = i; j < 11; j++)
        {
            intPart[j] = '0';
        }
        biasExpD[11] = '\0';

        printf("%c%s%s", binary[0], biasExpD, mantissaD);
        break;
        
    default:
        printf("invalid input\n");
        break;
    }

    return 0;
}