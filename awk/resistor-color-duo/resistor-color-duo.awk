@include "assert"
{
    split("black brown red orange yellow green blue violet grey white", values, " ")
    for (i in values) colors[values[i]] = i - 1
    for (i=1; i<=2; i++) sum = sum colors[$i]
    sub(/^0/, "", sum)
    assert(sum != "", "invalid color")
    print sum
}
