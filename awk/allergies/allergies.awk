BEGIN {FS=","}
{
    score = $1
    action = $2
    substance = $3
    split(", cats pollen chocolate tomatoes strawberries shellfish peanuts eggs", substances, " ")
    value = 2 ^ (length(substances) - 1)
    for (i in substances) {
        if (score >= value) {
            score = score - value
            allergic = substances[i] "," allergic
        }
        value /= 2
    }
    sub(/,+$/, "", allergic)
    if (action == "list") {
        print allergic
        exit
    }
    print (index(allergic, substance) != 0) ? "true" : "false"
}
