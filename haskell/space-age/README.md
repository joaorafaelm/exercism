# Space Age

Welcome to Space Age on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Given an age in seconds, calculate how old someone would be on:

- Mercury: orbital period 0.2408467 Earth years
- Venus: orbital period 0.61519726 Earth years
- Earth: orbital period 1.0 Earth years, 365.25 Earth days, or 31557600 seconds
- Mars: orbital period 1.8808158 Earth years
- Jupiter: orbital period 11.862615 Earth years
- Saturn: orbital period 29.447498 Earth years
- Uranus: orbital period 84.016846 Earth years
- Neptune: orbital period 164.79132 Earth years

So if you were told someone were 1,000,000,000 seconds old, you should
be able to say that they're 31.69 Earth-years old.

If you're wondering why Pluto didn't make the cut, go watch [this YouTube video][pluto-video].

Note: The actual length of one complete orbit of the Earth around the sun is closer to 365.256 days (1 sidereal year).
The Gregorian calendar has, on average, 365.2425 days.
While not entirely accurate, 365.25 is the value used in this exercise.
See [Year on Wikipedia][year] for more ways to measure a year.

[pluto-video]: https://www.youtube.com/watch?v=Z_2gbGXzFbs
[year]: https://en.wikipedia.org/wiki/Year#Summary

In this exercise, we provided the definition of the
[algebraic data type](https://learnyouahaskell.github.io/making-our-own-types-and-typeclasses)
named `Planet`.
You need to implement the `ageOn` function, that calculates how many
years old someone would be on a `Planet`, given an age in seconds.

You can use the provided signature if you are unsure about the types, but
don't let it restrict your creativity:

```haskell
ageOn :: Planet -> Float -> Float
```

## Source

### Created by

- @etrepum

### Contributed to by

- @iHiD
- @joshgoebel
- @kytrinyx
- @mttakai
- @petertseng
- @ppartarr
- @rbasso
- @sharno
- @sshine
- @tejasbubane

### Based on

Partially inspired by Chapter 1 in Chris Pine's online Learn to Program tutorial. - https://pine.fm/LearnToProgram/?Chapter=01
