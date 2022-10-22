{
    score = 0
    $0 = toupper($0)
    for (i=1; i<=length($0);i++) {
        letter = substr($0, i, 1)
        if (letter ~ /[AEIOULNRST]/) {score += 1; continue}
        if (letter ~ /[DG]/) {score += 2; continue}
        if (letter ~ /[BCMP]/) {score += 3; continue}
        if (letter ~ /[FHVWY]/) {score += 4; continue}
        if (letter ~ /[K]/) {score += 5; continue}
        if (letter ~ /[JX]/) {score += 8; continue}
        if (letter ~ /[QZ]/) {score += 10; continue}
    }
    print $0 "," score
}
