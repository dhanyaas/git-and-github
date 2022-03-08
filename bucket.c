#include<stdio.h>
void main()
{
int incoming,outgoing,buff_size,store=0,n;
printf("Number of packet:");
scanf("%d",&n);
printf("\nOutgoing:");
scanf("%d",&outgoing);
printf("\nBuffer_size");
scanf("%d",&buff_size);
while(n!=0)
{
printf("\nIncoming packet is:");
scanf("%d",&incoming);
if(incoming<=(buff_size-store))
{
store+=incoming;
printf(" \nBucket Buffe_size %d out of %d",store,buff_size);
}
else
{
printf("\nPacket is dropped %d",(incoming-(buff_size-store)));
store=buff_size;
}
store=store-outgoing;
printf("\nStore value is%d",store);
n--;
} 
}
