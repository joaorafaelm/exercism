BEGIN {
    if (num % 3 == 0) out = out "Pling";
    if (num % 5 == 0) out = out "Plang";
    if (num % 7 == 0) out = out "Plong";
    print ( out ? out : num )
}
