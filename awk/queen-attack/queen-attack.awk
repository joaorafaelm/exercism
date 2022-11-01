$1$2 !~ /^[0-7]+$/ || $1$2 == $3$4 { print "invalid"; exit 1 }
$1-$2 == $3-$4 || $1+$2 == $3+$4 || $1 == $3 || $2 == $4 { print "true"; exit }
{ print "false" }
