#include<stdio.h>
#include<stdlib.h>
int cost[5][5]={{ 0 ,99 ,99, 7,99},
		{3,0,4,99,99},
		{99,99,0,99,6},
		{99,2,5,0,99},
		{99,99,99,4,0}};
int n,p[10],d[10];


void dijik( int source)
{
int i,j,u,v,min;
int s[10];
for(i=0;i<n;i++)
{
d[i]=cost[source][i];
s[i]=0;
p[i]=source;
}
s[source]=1;
for(i=1;i<n;i++)
{
min=99;
u=-1;
for(j=0;j<n;j++)
{
if(s[j]==0)
{
if(d[j]<min)
{
min=d[j];
u=j;
}
}
}

if(u==-1)
return;
s[u]=1;
for(v=0;v<n;v++)
{
if(s[v]==0)
{
if(d[u]+cost[u][v]<d[v])
{
d[v]=d[u]+cost[u][v];
p[v]=u;
}
}
}
}
} 

void printf_path(int source,int dest)
{
int i;
i=dest;
while(i!=source)
{
printf("%d<--",i);
i=p[i];
}
printf("%d=%d",i,d[dest]);
}

void main()
{
int n,i,j,source;
printf("Enter the number of nodes:");
scanf("%d",&n);
printf("cost matix is:\n");
for(i=0;i<n;i++)
{
for(j=0;j<n;j++)
{
printf("%d\t",cost[i][j]);
}
printf("\n");

}
printf("Enter the source vertex:");
scanf("%d",&source);
dijik(source);
printf("\nThe shortest path and distance are sown below\n");
for(j=0;j<n;j++)
{
if(d[j]==99)
printf("Is not reachable form %d-->%d",source,j);
else
printf_path(source,j);
printf("\n");
}
}



