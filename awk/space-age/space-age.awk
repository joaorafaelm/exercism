{
    split("Earth Mercury Venus Mars Jupiter Saturn Uranus Neptune", planets, " ")
    split("1.0 0.2408467 0.61519726 1.8808158 11.862615 29.447498 84.016846 164.79132", period, " ")
    for(i in planets) map[planets[i]] = period[i]
    if ($1 in map) printf "%.2f", $2/60/60/24/365.25/map[$1]
    else { print "not a planet"; exit 1 }
}
