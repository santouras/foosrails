# Ratings Calculations


## Overall Calculation

`P = KG ( W - We)`

 * `K` = Weight index regarding the tournament of the match
 * `G` = A number from the index of goal differences
 * `W` = The result of the match
 * `W` = The expected result
 * `P` = Points Change

## K Calculations

 * WC
 `K = 60`
 * Tournaments
 `K = 30`
 * Friendlies
 `K = 10`

## G Calculations

  * Draw or won by 1 goal
  `G = 1`

  * Won by two goals
  `G = 3/2`

  * Won by three or more goals
  `G = (11 + N) / 8`

## N = Goal difference

### Examples

`0 = 1`
`+1 = 1`
`+2 = 1.5`
`+3 = 1.75`
`+4 = 1.875`
`+5 = 2`
`+6 = 2.125`
`+7 = 2.25`
`+8 = 2.375`
`+9 = 2.5`
`+10 = 2.625`

## Result of Match (W)

`1 = Win`
`.5 = Draw`
`0 = Loss`

## Expected Result (We)

`We = 1 / ( 10 ^(-dr/400) + 1 )`

`dr = difference in ratings`

## Examples

    Team  Points
      A    630
      B    500
      C    480


### Example 1

**Team A versus Team B (Team A stronger than Team B)**

              Team A - Team B | Team A - Team B | Team A - Team B
    Score          3 : 1      |      1 : 3      |      2 : 2
    K         20              | 20              | 20
    G         1.5             | 1.5             | 1
    W         1      - 0      | 0      - 1      | 0.5    - 0.5
    We        0.679  - 0.321  | 0.679  - 0.321  | 0.679  - 0.321
    Total (P) +9.63  - -9.63  | -20.37 - +20.37 | -3.58  - +3.58


### Example 2

**Team B versus Team C (both teams approximately the same strength)**

When the difference in strength between the two teams is less, so also will be
the difference in points allocation. The following table illustrates how the
points would be divided following the same results as above, but with two
roughly equally ranked teams, B and C, being involved:

              Team B - Team C | Team B - Team C | Team B - Team C
    Score          3 : 1      |      1 : 3      |      2 : 2
    K         20              | 20              | 20
    G         1.5             | 1.5             | 1
    W         1      - 0      | 0      - 1      | 0.5    - 0.5
    We        0.529  - 0.471  | 0.529  - 0.471  | 0.529  - 0.471
    Total (P) +14.13 - -14.13 | -15.87 - +15.87 | -0.58  - +0.58
