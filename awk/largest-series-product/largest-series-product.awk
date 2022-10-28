BEGIN { FS="," }
$1 ~ /^0+$/ { print "0"; exit }
$1 ~ /[a-z]/ { print "input must only contain digits"; exit 1}
$2 < 0 { print "span must not be negative"; exit 1}
length($1) < $2 { print "span must be smaller than string length"; exit 1}
!length($1) && $2 == 0 {print "1"; exit}
{
    largest_product = 0
    for(i=1; i<=length($1); i++) {
        sequence = substr($1, i, $2)
        if (length(sequence) < $2) continue
        split(sequence, digits, "")
        product = (index(sequence, "0") != 0) ? 0 : 1
        for (d in digits) product = product * digits[d]
        largest_product = (product > largest_product) ? product : largest_product
    }
    print largest_product
}
