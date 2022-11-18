BEGIN {
    for(i=start ? start : verse; i > (stop ? stop : verse) - 1 ; i--) {
        if (i == 0) {
            print "No more bottles of beer on the wall, no more bottles of beer."
            print "Go to the store and buy some more, 99 bottles of beer on the wall."
            exit
        }
        printf i (i == 1 ? " bottle" : " bottles")
        printf " of beer on the wall, " i (i == 1 ? " bottle" : " bottles") " of beer.\n"
        printf "Take " (i == 1 ? "it" : "one") " down and pass it around, " (i > 1 ? i - 1: "no more" )
        printf (i == 2 ? " bottle" : " bottles") " of beer on the wall.\n"
    }
}
