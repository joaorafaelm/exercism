@load "ordchr"

{
    for (i=1; i<=length($0);i++) {
        letter = substr($0, i, 1)
        n = ord(letter) + distance
        if (letter ~ /[a-z]/) n = n > 122 ? n - 26 : n
        else if (letter ~ /[A-Z]/) n = n > 90 ? n - 26 : n
        else n = ord(letter)
        printf chr(n)
    }
}

