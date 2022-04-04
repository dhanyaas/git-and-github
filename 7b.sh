#Write a shell script that accepts a list of filenames as its argument, count and report occurrence of each word that is present in the first argument file on other argument files.


for fn in $*
   do
	if [ $fn = $1 ]
	 then
		continue 
	fi
                     for w in `cat $1`
                     do
      	                 count=`grep -iwo "$w" $fn| wc -l`
     	                 echo "$w is $count times in $fn"
                     done
  done
 







