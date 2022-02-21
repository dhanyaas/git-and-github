if [ -e $1 ]
 then
  	set -- `ls -ld $1`
	echo "Permission are :$1" 
	echo "File links count is: $2"
	echo "User name is :$3"
	echo "Group name is: $4"
	echo "File Size is: $5"
	echo "Modification is done $6 $7 at $8"
 else 
	echo "File does not exit"
fi

