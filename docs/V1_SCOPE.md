# V1 Scope Definition  
## Matchstick Equation Puzzle

---

## Purpose of V1

Version 1 (V1) defines the smallest complete and technically solid playable version.

Goals:

- Deliver a working puzzle system
- Implement flexible slot/segment architecture
- Build a general equation validator
- Avoid architectural refactoring later

V1 prioritizes correctness and structure over visuals.

---

## Equation Structure (V1)

All equations follow this format:

A op B = C


Where:

- A, B, C → single digits (0–9)
- op → one operator
- = → required

### Total Slots: 5

1. Digit
2. Operator
3. Digit
4. Equals
5. Digit

No multi-digit numbers in V1.

---

## Supported Symbols (System-Level)

The system must support:

### Digits
0–9

### Operators
- Addition (+)
- Subtraction (−)
- Multiplication (×)
- Division (÷)

### Equality
- Equals (=)

Even if early levels focus on + and −, all four operators must be supported architecturally.

---

## Move Rules (V1)

- Exactly **1 matchstick move per level**
- A move consists of:
  - Removing one stick
  - Placing it in a valid segment position

After the move:

- All slots must form valid symbols
- The equation must evaluate to true

---

## Validation Rules

When CHECK is pressed:

1. Each slot must represent a valid symbol
2. Equation must be syntactically valid
3. LHS must equal RHS
4. Division must result in integers only
5. Not allowed:
   - `!=`
   - `<>`
   - Custom operators

Standard precedence applies, though format prevents ambiguity.

---

## Slot & Segment Requirements

- Every slot is segment-based
- Must support:
  - Any digit (0–9)
  - Any operator (+ − × ÷)
  - Equals (=)
- Only one visual variation per digit in V1

Segments must allow dynamic activation/deactivation.

---

## Level Constraints (V1)

- Fixed 5-slot equations
- Exactly 1 valid move
- No timers
- No scoring system
- Minimal UI only

---

## Out of Scope (Not in V1)

- Multi-digit numbers
- Variable equation lengths
- Multiple allowed moves
- Alternative digit variations
- Exponents
- Level editor
- Hints
- Sound
- Advanced animations

---

## V1 Completion Criteria

V1 is complete when:

- Multiple levels are playable
- Matchstick movement works reliably
- Equation validation is fully correct
- All digits and operators are supported
- Adding levels requires no refactoring
