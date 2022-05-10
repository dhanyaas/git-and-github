#Write a shell script that accepts two filenames as arguments, checks if the permissions for 
#these  files  are  identical  and  if  the  permissions  are  identical,  output  common  permissions 
#otherwise output each filename followed by its permissions
echo -n "File a file name1:"
read f1
if [ -e $f1 ]
then
	set -- `ls -ld $f1`
	file1permi=$1
else
	echo "file does not exit"
	exit
fi

echo -n "File a file name2:"
read f2
if [ -e $f2 ]
then
	set -- `ls -ld $f2`
	file2permi=$1
else
	echo "file does not exit"
	exit
fi

if [ $file1permi =  $file2permi ]
then 
	echo "File permission are identical"
	echo "permission is $file1permi"
else 
 	echo "File permission are not identical"
	echo " $f1 permission is $file1permi"
	echo " $f2 permission is $file2permi"
fi
