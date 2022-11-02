BEGIN {
    for (i=1; i<=length(num);i++) sum += substr(num, i, 1) ^ length(num)
    print sum == num ? "true" : "false"
}
