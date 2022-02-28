#include<stdio.h>
void main()
{
int data[7],rec[7],i,c1,c2,c3,c;
printf("Enter the bits:");
scanf("%d%d%d%d",&data[0],&data[1],&data[2],&data[4]);
data[6]=data[4]^data[2]^data[0];
data[5]=data[4]^data[1]^data[0];
data[3]=data[2]^data[1]^data[0];
printf("Encoded bits are:");
for(i=0;i<7;i++)
{
printf("%d\t",data[i]);
}
printf("\nEnter encoded bits:");
for(i=0;i<7;i++)
{
scanf("%d",&rec[i]);
}
c1=rec[6]^rec[4]^rec[2]^rec[0];
c2=rec[5]^rec[4]^rec[1]^rec[0];
c3=rec[3]^rec[2]^rec[1]^rec[0];
c=c3*4+c2*2+c1;
if(c==0)
{
printf("There is no error and the bits are:");
}
else
{
printf("There is an error in %dlocation\nCorrected bits are:",c);
}
if(rec[7-c]==0)
rec[7-c]=1;
else
rec[7-c]=0;
for(i=0;i<7;i++)
{
printf("%d\t",rec[i]);
}
}
