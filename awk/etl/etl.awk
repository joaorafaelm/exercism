BEGIN {
    FPAT = "[[:alpha:]]|[[:digit:]]{1,2}"
    PROCINFO["sorted_in"] = "@ind_str_asc"
}
{ for (i = 2; i <= NF; i++) points[tolower($i)] = $1 }
END {
    for (letter in points) print letter "," points[letter]
}
