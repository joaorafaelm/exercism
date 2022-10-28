!length($0) { print "series cannot be empty"; exit 1 }
len < 1 || length($0) < len { print "invalid length"; exit 1 }
{
    n = length($0) - len + 1
    for (i=1; i<=n; i++) printf substr($0, i, len) ((i==n) ? "" : " ");
}
