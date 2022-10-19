# These variables are initialized on the command line (using '-v'):
# - num

BEGIN {
    no_factor = 0
    if (num == 1) { print 1; exit }
    if (num % 3 == 0) {printf "Pling" ; no_factor = 1}
    if (num % 5 == 0) {printf "Plang" ; no_factor = 1}
    if (num % 7 == 0) {printf "Plong" ; no_factor = 1}
    if(no_factor == 0) printf num

}
