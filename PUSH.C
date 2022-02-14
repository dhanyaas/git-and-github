
 #include<stdio.h>
 #include<stdlib.h>
 #include<conio.h>
 void push(int*,int);
 int pop();

 void display(int*);
 #define MAX 3
 int top=-1;
 void main()
 {

 int stack[MAX];
 int choice,item;

 while(1)
 {
 printf("\noperation:");
 printf("\n 1.push");
 printf("\n2.pop");
 printf("\n3.display");
 printf("\n4.exit");
 printf("\nenter the choice");
 scanf("%d",&choice);
 switch(choice)
 {
 case 1:
 printf("\npush elements:");
 scanf("%d",&item);
 push(stack,item);
 break;
 case 2:
 item=pop(stack);
 if(item)
 printf("\npop item%d",item);
 break;
 case 3:
 display(stack);
 break;

 default :exit(0);
 }
 }

 }
 void push(int *stack,int item)
 {
 if(top==MAX-1)
 {
 printf("\noverflow");
 return;
 }
 stack[++top]=item;
 printf("\nElement pushed sussfully");
 if(top==MAX-1)
 printf("\n empty");
 }

 int pop(int *stack)
 {
 int item;
 if(top==-1)
 {
 printf("underflow");
 return 0;
 }
 item=stack[top--];
 if(top==-1)
 printf("\nafter pop stack is empty");
 return item;

 }
 void display(int *stack)
 {
 int temp;
 if(top==-1)
 {
 printf("\nstack is empty");
 return;
 }
 printf("\ncontents of the stack are:");
 {
 for(temp=top;temp>=0;temp--)
 printf("%d",stack[temp]);
 return;
 }
}