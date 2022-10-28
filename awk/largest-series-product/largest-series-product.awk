BEGIN { FS="," }
$1 ~ /[a-z]/ { print "input must only contain digits"; exit 1}
$2 < 0 { print "span must not be negative"; exit 1}
length($1) < $2 { print "span must be smaller than string length"; exit 1}
{
    largest_product = !length($1) && $2 == 0 ? 1 : 0
    for(i=1; i + $2 <= length($1) + 1; i++) {
        split(substr($1, i, $2), digits, "")
        product = 1
        for (d in digits) product = product * digits[d]
        largest_product = (product > largest_product) ? product : largest_product
    }
    print largest_product
}
