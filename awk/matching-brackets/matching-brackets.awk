{
    for (i=1; i<=length($0);i++) {
        letter = substr($0, i, 1)
        if (letter ~ /\[|\(|\{/) opened = opened letter
        else if (letter ~ /\]|\)|\}/) {
            last_opened = substr(opened, length(opened), 1)
            if (last_opened letter ~ /\[\]|\{\}|\(\)/) opened = substr(opened, 0, length(opened) - 1)
            else { print "false"; exit }
        }
    }
    print (!opened) ? "true": "false"
}
