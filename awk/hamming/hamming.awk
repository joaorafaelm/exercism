@include "assert"

NR == 1 { split($0, first, "") }
NR > 1 {
    split($0, second, "")
    assert(length(first) == length(second), "strands must be of equal length")
    distance = 0
    for (i in first) {
        if (first[i] != second[i]) distance++
    }
    print(distance)
}
