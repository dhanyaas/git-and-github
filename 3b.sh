

echo "enter the password"
stty -echo
read p1

echo "confirm the password"
stty -echo
read p2
while [ $p1 != $p2 ]
do 
echo -n "password doesnt match.reenter the password:"
stty -echo
read p3
done
clear
echo "------Terminal Locked------"
echo "enter the password to unlock"
stty -echo
read p3
while [ $p1 != $p3 ]
do
echo "------Terminal Locked------"
echo -n "password doesnt match.reenter the password:"
stty -echo
read p3
done
clear
echo "-----Terminal unlock------"
