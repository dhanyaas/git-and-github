#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<ctype.h>
char postfix[30];
int top=-1;
int stack[30];

void push(int symbol)
{
stack[++top]=symbol;
}

int pop()
{
int symbol;
symbol=stack[top--];
return symbol;
}

int eval_postfix()
{
int symbol;
int i=0,op1,op2;
while((symbol=postfix[i++])!='\0')
{
if(isalnum(symbol))
{
push(symbol-'0');
}
else
{
op2=pop();
op1=pop();
switch(symbol)
{
case '+': push(op1+op2);
           break;
case '-': push(op1-op2);
	   break;
case '*': push(op1*op2);
	   break;
case '/':  if(op2!=0)
	   { 
	   push(op1/op2);
           break;
	 }
	 else 
	{
         printf("Invalid choice");
	exit(0);
              }
case '^': push(pow(op1,op2));
	  break;
}
}
}
return(pop());
}




void main()
{ 
int val;
printf("Enter postfix expression:");

scanf("%s",postfix);
val=eval_postfix();
printf("Result is:%d\n",val);
}
