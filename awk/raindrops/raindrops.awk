BEGIN {
    if (num % 3 == 0) o = o "Pling";
    if (num % 5 == 0) o = o "Plang";
    if (num % 7 == 0) o = o "Plong";
    print o ? o : num
}
