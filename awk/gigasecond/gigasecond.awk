BEGIN { FS = "T" }
{
    gsub(/[^[:digit:]]/, " ", $0)
    print strftime("%FT%T", mktime($1 " " ($2 ? $2 : "00 00 00"), 1) + 1e9, 1)
}
