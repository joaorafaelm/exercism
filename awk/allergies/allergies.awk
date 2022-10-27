BEGIN {FS=","}
{
    split(", cats pollen chocolate tomatoes strawberries shellfish peanuts eggs", substances, " ")
    value = 2 ^ (length(substances) - 1)
    for (i in substances) {
        allergies = ($1 >= value) ? substances[i] "," allergies : allergies
        $1 = ($1 >= value) ? $1 - value : $1
        value /= 2
    }
    sub(/,+$/, "", allergies)
}
$2 == "list" { print allergies }
$2 == "allergic_to" { print (index(allergies, $3) != 0) ? "true" : "false" }
