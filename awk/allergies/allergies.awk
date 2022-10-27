BEGIN {FS=","}
{
    split(", cats pollen chocolate tomatoes strawberries shellfish peanuts eggs", substances, " ")
    value = 2 ^ (length(substances) - 1)
    for (i in substances) {
        if ($1 >= value) {
            $1 = $1 - value
            allergic = substances[i] "," allergic
        }
        value /= 2
    }
    sub(/,+$/, "", allergic)
}
$2 == "list" { print allergic }
$2 == "allergic_to" { print (index(allergic, $3) != 0) ? "true" : "false" }
