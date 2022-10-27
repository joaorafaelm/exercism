$1 == "total" { print 2 ^ 64 - 1; exit }
$1 > 0 && $1 < 65 { print 2 ^ ($1 - 1); exit }
{ print "square must be between 1 and 64"; exit 1 }
