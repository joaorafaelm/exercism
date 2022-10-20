END {
    if (length($0) == 0) exit;
    if ($0 ~ /[^GCTAU]/ ) { print "Invalid nucleotide detected."; exit 1 }
    for (i=1;i<=length($0);i++) {
        letter = substr($0, i, 1)
        if (letter ~ /A/) { gsub("A", "U", letter); printf letter; continue}
        if (letter ~ /G/) { gsub("G", "C", letter);printf letter;  continue}
        if (letter ~ /C/) { gsub("C", "G", letter);printf letter;  continue}
        if (letter ~ /T/) { gsub("T", "A", letter);printf letter;  continue}
    }
}
