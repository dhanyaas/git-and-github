BEGIN {
printf("It is a program remove of duplicate lines\n");
}

{
file[++i]=$0
}

END {
       for(k=1;k<=i;k++) {
         flag=0;
         for(j=0;j<k;j++){
            if(file[k]==file[j]){
              flag=1
              break;
             }
          }
      if(flag==0){
      print file[k]
     }
   }
}


