{
    split("reverse,jump,close your eyes,double blink,wink", handshakes, ",")
    value = 2 ^ (length(handshakes) - 1)
    for (i in handshakes) {
        if ($1 >= value) { h = (h ~ /reverse/) ? h "," handshakes[i] : handshakes[i] "," h; $1 -= value }
        value /= 2
    }
    gsub(/reverse,*|^,+|,+$/, "", h); print h
}
