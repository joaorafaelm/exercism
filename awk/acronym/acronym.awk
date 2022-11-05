{
    gsub(/'/,""); gsub(/[^[:alnum:][:space:]]/," ")
    for (i=1; i<=NF;i++) printf(toupper(substr($i, 1, 1)))
}
