NR == 1 { split($0, first, "") }
NR > 1 {
    split($0, second, "")
    if (length(first) != length(second)) {print "strands must be of equal length"; exit 1}
    for (i in first) if (first[i] != second[i]) distance++
    print(int(distance))
}
