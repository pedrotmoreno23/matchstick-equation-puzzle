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

All equations follow this fixed format:

S A op B = C

Where:

- `S` (slot 0) is an optional sign slot: **empty** or unary minus (`-`)
- `A`, `B`, and `C` are single digits (0–9)
- `op` is one operator (+, −, ×, ÷)
- `=` is fixed and required

### Total Slots: 6

0. Optional sign (empty or `-` only)
1. Digit
2. Operator
3. Digit
4. Equals
5. Digit

### Important Rules

- Unary minus is allowed **only in slot 0**.
- Negative `B` and negative `C` are **not allowed** in V1.
- No other slot may contain a unary minus.
- All equations must remain in single-digit format (excluding the optional sign).

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

1. Each slot must represent a valid symbol.
2. The equation must be syntactically valid.
3. Unary minus (`-`) is only valid in slot 0.
4. Left-hand side must evaluate numerically equal to the right-hand side.
5. Division must result in integers only.
6. Not allowed:
   - `!=`
   - `<>`
   - Custom comparison operators
   - Negative `B` or `C`

Standard arithmetic precedence applies (× and ÷ before + and −).

---

## Slot & Segment Requirements

- Every slot is segment-based.
- Must support:
  - Any digit (0–9)
  - Any operator (+ − × ÷)
  - Equals (=)
- Only one visual variation per digit in V1.
- Slot 0 must allow either:
  - No active segments (empty)
  - A valid minus sign shape

Segments must allow dynamic activation/deactivation.

---

## Level Constraints (V1)

- Fixed 6-slot equations
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
- Unary minus works only in slot 0
- Adding levels requires no refactoring
