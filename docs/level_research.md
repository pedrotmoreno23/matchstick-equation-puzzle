# Level Research
## Matchstick Equation Puzzle (V1)

This file collects candidate levels with:
- Incorrect equation
- Correct equation
- One-stick move description
- Transformation type
- Notes

---

## Level 001

**Incorrect:**  
5 + 4 = 2 !

**Correct:**  
6 - 4 = 2 

**Move:**  
Move the vertical stick from `+` to the lower-left side of the `5`. This turns `+` into `-` and `5` into `6`.

**Transformation Type:**  
Operator change + digit expansion

**Notes:**  
Good medium difficulty. Teaches that moving one stick can change two symbols.

---

## Level 002

**Incorrect:**  
2 + 7 = 6

**Correct:**  
2 + 7 = 9

**Move:**  
Move one stick within the `6` to form a `9` (reposition the lower-left segment to the upper-right position).

**Transformation Type:**  
Digit transformation (6 → 9)

**Notes:**  
Beginner friendly.

---

## Level 003

**Incorrect:**  
3 + 5 = 7

**Correct:**  
2 + 5 = 7

**Move:**  
Move the lower-right vertical stick of the `3` to the lower-left position to turn `3` into `2`.

**Transformation Type:**  
Digit transformation (3 → 2)

**Notes:**  
Very clean “single-digit change” level.

---

## Level 004

**Incorrect:**  
3 - 9 = 4

**Correct:**  
9 - 5 = 4

**Move:**  
Move the upper-left vertical stick from the `9` to the `3`. This turns `9 → 5` and `3 → 9`.

**Transformation Type:**  
Stick transfer between digits (affects two symbols)

**Notes:**  
Great example of a smart transfer move.

## Level 005

**Incorrect:**  
2 + 6 = 2

**Correct:**  
2 + 0 = 2

**Move:**  
Move the middle horizontal stick from the `6` to the top-right vertical position to turn `6 → 0`.

**Transformation Type:**  
Digit transformation (6 → 0)

**Notes:**  
Great beginner level. Clean “reposition within one digit” move.

## Level 006

**Incorrect:**  
9 + 3 = 5

**Correct:**  
9 - 3 = 6

**Move:**  
Move the vertical stick from the `+` to the left side of the `5`, turning `+` into `-` and `5` into `6`.

**Transformation Type:**  
Operator change + digit expansion

**Notes:**  
Good medium difficulty level. Teaches multi-effect stick relocation.

## Level 007

**Incorrect:**  
0 + 5 = 8

**Correct:**  
0 + 9 = 9

**Move:**  
Move the lower-left vertical stick from the `8` to the upper-right vertical position on the `5`. This turns `8 → 9` and `5 → 9`.

**Transformation Type:**  
Cross-digit stick transfer (affects two digits)

**Notes:**  
Great “8-based” level. Shows how moving one stick can change two digits and fix the math.

## Level 008

**Incorrect:**  
9 + 9 = 4

**Correct:**  
-5 + 9 = 4

**Move:**  
Move the top-right vertical stick from the first `9` to slot 0 to form a unary minus. This turns the first `9 → 5` and creates `-5`.

**Transformation Type:**  
Unary minus creation + digit simplification (9 → 5)

**Notes:**  
Excellent unary-minus level. Clean and clever.

## Level 009

**Incorrect:**  
9 - 9 = 1

**Correct:**  
9 ÷ 9 = 1

**Move:**  
Move one stick to transform the `-` operator into the `÷` operator.

**Transformation Type:**  
Operator change (− → ÷)

**Notes:**  
Great division-category level. Very clean and easy to understand.

## Level 010

**Incorrect:**  
9 - 9 = 1

**Correct:**  
9 / 9 = 1

**Move:**  
Move one stick to transform the `-` operator into the `/` operator.

**Transformation Type:**  
Operator change (− → /)

**Notes:**  
Clean division level. Digits remain unchanged.

## Level 011

**Incorrect:**  
3 / 3 = 8

**Correct:**  
3 x 3 = 9

**Move:**  
Move the lower-left vertical stick from the `8` and place it diagonally across the `/` operator. This turns `8 → 9` and `/ → x`.

**Transformation Type:**  
Digit reduction + operator upgrade (8 → 9 and / → x)

**Notes:**  
Requires diagonal stick positions to be valid in operator slots.

---

# Transformation Pattern Summary

## 1. Digit Internal Transformation
- Example: 3 → 2
- Example: 6 → 0

## 2. Operator Change
- − → /
- / → x

## 3. Operator + Digit Combo
- Moving a stick from operator to digit (or vice versa)

## 4. Cross-Digit Transfer
- One stick removed from one digit and placed into another

## 5. Unary Minus Creation
- Creating `-` in slot 0 while modifying a digit

## 6. 8-Based Transformations
- 8 → 9 via single segment removal

## 7. Composite Operator Upgrade
- Digit change + operator upgrade in one move
