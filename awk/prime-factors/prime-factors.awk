{
    for (i=2;$1 > 1; i++) {
        if ($1 % i == 0) { factors ? factors = factors " " i : factors = i; $1 /= i-- }
    }
    print factors
}
