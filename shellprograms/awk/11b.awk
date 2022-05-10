BEGIN { FS="|" 
printf("--------------------------------------------------------------------------\n")
printf("              EMPLOYEEE DETAILS                             \n ")
printf("\nSINO\tEMPID\tNAME\tDESING\tSALARY\tDA\tHRA\tGROSSSALARY")
printf("\n--------------------------------------------------------------------------\n")
}
{
count++;
if($4<10000)
{
da=0.45*$4
hra=0.15*$4
}
else
{
da=0.15*$4
hra=0.2*$4
}
gs=$4+hra+da
printf("\n%d\t%d\t%s\t%s\t%d\t%d\t%d\t%d",count,$1,$2,$3,$4,da,hra,gs)

tbs+=$4;
tda+=da;
thra+=hra;
tgs+=gs;
}

END {
printf("\n--------------------------------------------------------------------------\n")
printf("\nTotal basic salary is:%d\nTotal DA is :%3d\nTotal HRA is:%d\nTotal Grosssalaray is:%d\n",tbs,tda,thra,tgs)
printf("--------------------------------------------------------------------------\n")
printf("\nTotal number of employeee:%3d",count)
printf("\nDA is(tda/count):%5d",tda/count)
printf("\nHRA is(thra/count):6%d",thra/count)
printf("\nGross salary(tgs/count):4%d",tgs/count)
printf("\n--------------------------------------------------------------------------\n")
}
