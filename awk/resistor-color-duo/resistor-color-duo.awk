{
    split("black brown red orange yellow green blue violet grey white", values, " ")
    for (i in values) colors[values[i]] = i - 1
    for (i=1; i<=2; i++) sum = sum ((colors[$i] == 0 && i == 1) ? "": colors[$i])
    if (sum == "") {print "invalid color"; exit 1} else print sum
}
