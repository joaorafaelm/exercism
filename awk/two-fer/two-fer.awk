BEGIN {
    name = ($1=="") ? "you" : $1;
    printf "One for %s, one for me.", name;
}
