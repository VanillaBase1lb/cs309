#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
#include<stdbool.h>

// 01000000001000000000000000000000

bool isInteger(float N)
{
    int X = N;
    float temp2 = N - X;
    if (temp2 > 0) {
        return false;
    }
    return true;
}

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

int convertint(int in){
    char binary[64] = "0";
    int length;
    short negative = 0;
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
            //printf("%d\n", in);
        
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

}

int convertfloat(float fl){
    char binary[64] = "0";
    int length;
    short negative = 0;
    int biasValue;
    int i;
    if (fl < 0)
            binary[0] = '1';
        length = sizeof(float);
        biasValue = 127;

        int temp = abs((int)fl);
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

        printf("%c%s%s\n", binary[0], biasExpF, mantissaF);
        //printf("%f\n", fl);
}

int main(){
    char bNum1[33],bNum2[33];
    char mantissa[25];
    char mantissa1[25];
    char type1,type2;
    int takeupto;
    printf("The input should be a 32 bit binary nimber.\n");
    printf("Enter the type of 1st number and 2nd number: ");
    scanf("%c %c", &type1,&type2);
    printf("Enter first number: ");
    scanf("%s", bNum1);
    printf("Enter second number: ");
    scanf("%s", bNum2);
    int calInt1=0;
    int calInt2=0;
    float fNum1=0;
    int iNum2=0;
    float fNum2=0;
    int exp=0;
    int k;
    if(type1=='i' && bNum1[0]=='0'){
        for(int i=1;i<32;i++){      
            (bNum1[i]=='0') ? (calInt1+=0) : (calInt1+=pow(2,(31-i)));
        }
        printf("Decimal Equivalent of 1st Input: %d\n", calInt1);
    }
    if(type1=='i' && bNum1[0]=='1'){
        calInt1=(-1)*pow(2,31);
        for(int i=1;i<=31;i++){
            (bNum1[i]=='0') ? (calInt1+=0) : (calInt1+=pow(2,31-i));
        }
        printf("Decimal Equivalent of 1st Input: %d\n", calInt1);
    }
    if(type1=='f'){
            for(int i=1;i<=8;i++){
                (bNum1[i]=='0') ? (exp+=0) : (exp+=pow(2,8-i));     // 10001001
            }
            mantissa[0]='1';
            for(int j=9;j<32;j++){
                mantissa[j-8]=bNum1[j];
            }
            takeupto=exp-127+1;             //E-127  // 10011101011.0010000000000    //11
            for(int i=0;i<takeupto;i++){
                (mantissa[i]=='0') ? (fNum1+=0) : (fNum1+=pow(2,takeupto-i-1));
            }
            for(int i=takeupto,j=1;i<23;i++,j++){
                (mantissa[i]=='0') ? (fNum1+=0) : (fNum1+=pow(2,-j));
            }
            (bNum1[0]=='0') ? (fNum1=fNum1*1) : (fNum1=(-1)*fNum1);
            mantissa[24]='\0';
            printf("Decimal Equivalent of 1st Input: %f\n", fNum1);
    }
    if(type2=='i' && bNum2[0]=='0'){
        for(int i=1;i<32;i++){
            (bNum2[i]=='0') ? (calInt2+=0) : (calInt2+=pow(2,(31-i)));
        }
        printf("Decimal Equivalent of 2nd Input: %d\n", calInt2);
    }
    if(type2=='i' && bNum2[0]=='1'){
        calInt2=(-1)*pow(2,31);
        for(int j=1;j<=31;j++){
            (bNum2[j]=='0') ? (calInt2+=0) : (calInt2+=pow(2,31-j));
        }
        printf("Decimal Equivalent of 2nd Input: %d\n", calInt2);
    }
    if(type2=='f'){
        exp=0;
            for(int i=1;i<=8;i++){
                (bNum2[i]=='0') ? (exp+=0) : (exp+=pow(2,8-i));
            }
            mantissa[0]='1';
            for(int j=9;j<32;j++){
                mantissa[j-8]=bNum2[j];
            }
            takeupto=exp-127+1;
            for(int i=0;i<takeupto;i++){
                (mantissa[i]=='0') ? (fNum2+=0) : (fNum2+=pow(2,takeupto-i-1));
            }
            for(int i=takeupto,j=1;i<23;i++,j++){
                (mantissa[i]=='0') ? (fNum2+=0) : (fNum2+=pow(2,-j));
            }
            (bNum2[0]=='0') ? (fNum2=fNum2*1) : (fNum2=(-1)*fNum2);
            mantissa[24]='\0';
            printf("Decimal Equivalent of 2nd Input: %f\n", fNum2);
    }
    int isum=0;
    int convertedflsum;
    int convertedflmul;
    float fsum=0;
    int imulti=0;
    float fmulti=0;
    if(type1=='i' & type2=='i'){
        isum+=calInt1+calInt2;
        imulti+=calInt1*calInt2;
        convertint(isum);
        convertint(imulti);
    } else if(type1=='i' && type2=='f'){
        fsum+=calInt1+fNum2;
        fmulti+=calInt1*fNum2;
        if(isInteger(fsum)){
            convertedflsum=floor(fsum);
            convertint(convertedflsum);
        }
        else{
            convertfloat(fsum);
        }
        if(isInteger(fmulti)){
            convertedflmul=floor(fmulti);
            convertint(convertedflmul);
        } else {
            convertfloat(fmulti);
        }
    } else if(type1=='f' && type2=='i'){
        fsum+=fNum1+calInt2;
        fmulti+=fNum1*calInt2;
        if(isInteger(fsum)){
            convertedflsum=floor(fsum);
            convertint(convertedflsum);
        }
        else{
            convertfloat(fsum);
        }
        if(isInteger(fmulti)){
            convertedflmul=floor(fmulti);
            convertint(convertedflmul);
        } else {
            convertfloat(fmulti);
        }
    } else if(type1=='f' && type2=='f'){
        fsum+=fNum1+fNum2;
        fmulti+=fNum1*fNum2;
        if(isInteger(fsum)){
            convertedflsum=floor(fsum);
            convertint(convertedflsum);
        }
        else{
            convertfloat(fsum);
        }
        if(isInteger(fmulti)){
            convertedflmul=floor(fsum);
            convertint(convertedflmul);
        } else {
            convertfloat(fmulti);
        }
    }
    
}