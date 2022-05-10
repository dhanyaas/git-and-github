BEGIN { 
printf("SINO\tDEPARTMENT\tNOOFBOOKSOLD")
}

{
book[$1]+=$2
total+=$2
}

END { 
for(i in book){
SN++;
printf("\n%d\t%-20s\t%d",SN,i,book[i])
}
printf("\nTotal number of books:%d",total)
}
