$1 ~ /Earth/ { printf "%.2f", $2/60/60/24/365.25; exit }
$1 ~ /Mercury/ { printf "%.2f", $2/60/60/24/365.25/0.2408467; exit }
$1 ~ /Venus/ { printf "%.2f", $2/60/60/24/365.25/0.61519726; exit }
$1 ~ /Mars/ { printf "%.2f", $2/60/60/24/365.25/1.8808158; exit}
$1 ~ /Jupiter/ { printf "%.2f", $2/60/60/24/365.25/11.862615; exit}
$1 ~ /Saturn/ { printf "%.2f", $2/60/60/24/365.25/29.447498; exit}
$1 ~ /Uranus/ { printf "%.2f", $2/60/60/24/365.25/84.016846; exit}
$1 ~ /Neptune/ { printf "%.2f", $2/60/60/24/365.25/164.79132; exit}
{ print "not a planet"; exit 1}
