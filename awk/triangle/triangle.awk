$1 + $2 < $3 || $2 + $3 < $1 || $1 + $3 < $2 || $1$2$3 ~ /^0+$/ { print "false"; exit }
$0 !~ "[^" $1 " ]" && type ~ /equilateral/ { print "true"; exit}
$1 != $2 && $2 != $3 && $3 != $1 && type ~ /scalene/ {print "true"; exit}
($1 == $2 || $2 == $3 || $1 == $3) && type ~ /isosceles/ {print "true"; exit}
{ print "false" }
