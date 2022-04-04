#Write a shell script that accepts the filename, starting and ending line number as an argument and display all the lines between the given line number.

if [ $# -eq 3 ]
then
    if [ -f $1 ]
      then 
        l=`cat $1 | wc -l`
        if [ $2 -gt $3 -a $2 -gt $l -a $3 -gt $2 ]
          then
           head -n $1 $3 | tail -n  +$2
           else 
               echo "Enter avalid arguments"
           fi
        else
          echo "File does not exits"
         fi
 else
  echo "Enter the no of arguments"
 fi     

