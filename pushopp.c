 #include<stdio.h>
#include<stdlib.h>
int stack[20],i,n,top=-1,num;
void push(int n) 
{
	if(top==n-1)
	printf("\n Stack is Full");
	else
	{
		printf("\n Enter the Elements to Push: \n");
		scanf("%d",&num);
		stack[++top]=num;
	}
}
void pop()
{
	if(top==-1)
	printf("\n Stack is Empty \n");
	else
	{
		printf("\n %d is Poped",stack[top]);
		top--;
	}
}
void display()
{

	if(top==-1)
	{
	printf("\n Stack is Empty \n");
}


	  else
	{
		printf("\n Stack Elements are:");
		for(i=top;i>=0;i--)
		printf(" %d ",stack[i]);
	}
}
void main()
{
	int ch;
	printf("enter the size of stack");
	scanf("%d",&n);
	while(1)
	{
		printf("\n 1.PUSH 2.POP 3.DISPLAY 4.EXIT \n Enter your choice");
		scanf("%d",&ch);
		switch(ch)	
		{
			case 1:push(n);
			break;
			case 2:pop();
			break;
			case 3: display();
			break;
			case 4: exit(0);
			default:
			printf("\n Invalid choic");
			break;
		}
	}
}
 
