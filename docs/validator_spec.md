# Validator Specification (V1)

This document defines the exact behavior of the CHECK system for Version 1.

The validator operates strictly from the final slot states.

It does not track stick movements.
It does not manage animations.
It only validates the final equation state.

---

# Slot Structure (Fixed – 6 Slots)

Index | Meaning
0 | Optional unary minus (empty or "-")
1 | Digit A (0–9)
2 | Operator (+ − × /)
3 | Digit B (0–9)
4 | Equals (=) — fixed slot
5 | Digit C (0–9)

All V1 equations strictly follow this structure.

---

# Operator Slot Architecture (Crossed-Box System)

Slot 2 (Operator) uses a crossed-box segment layout.

The operator slot must support the following segment positions:

- Horizontal segment
- Vertical segment
- Diagonal segment (top-left → bottom-right)
- Diagonal segment (bottom-left → top-right)

These four possible segment positions allow representation of:

+  → horizontal + vertical  
−  → horizontal only  
×  → both diagonals  
/  → exactly one diagonal  

Only the following exact segment combinations are valid in V1:

+  = horizontal + vertical  
−  = horizontal only  
×  = diagonal_1 + diagonal_2  
/  = exactly one diagonal  

Any other segment combination in slot 2 is invalid.

This ensures flexible operator transformations while maintaining strict validation.

---

# Step 1 — Symbol Validation

Before evaluation, all slots must be validated.

## Slot 0 (Optional Sign)
- Must be either:
  - Empty (no active segments)
  - A valid minus sign shape
- No other symbol allowed.

## Slot 1, 3, 5 (Digits)
- Must form valid digits 0–9.
- No unary minus allowed in these slots.
- Only one visual variation per digit allowed in V1.

## Slot 2 (Operator)
Must match one of:
- +
- −
- ×
- /

## Slot 4 (Equals)
- Must represent "=".
- This slot is fixed by structure.
- It cannot represent any other symbol.

If any slot fails validation:

Return: INVALID_SYMBOL_STATE

---

# Step 2 — Construct Numerical Values

If Slot 0 is empty:
    A = digit(slot1)
Else:
    A = -digit(slot1)

B = digit(slot3)
C = digit(slot5)
OP = operator(slot2)

Rules:
- B must never be negative.
- C must never be negative.
- Only slot 0 may contain unary minus.

---

# Step 3 — Evaluate Left Side

Since V1 only allows one operator, evaluation is straightforward.

If OP == "+"
    result = A + B

If OP == "−"
    result = A - B

If OP == "×"
    result = A * B

If OP == "/"
    If B == 0
        return INVALID_DIVISION
    If A % B != 0
        return INVALID_DIVISION
    result = A / B

Division must always produce an integer result.

---

# Step 4 — Compare

If result == C
    return VALID_SOLUTION
Else
    return INCORRECT_EQUATION

---

# Explicit Rejections

The validator must reject:

- Invalid symbol shapes
- Negative B
- Negative C
- Division by zero
- Non-integer division
- Missing operator
- Missing equals
- Any unsupported symbol configuration

---

# Move Count

V1 levels are designed to require exactly one stick move.

The validator does not track how many sticks were moved.

Future versions may support multiple moves, adding sticks, or removing sticks.
Move tracking is outside the validator’s responsibility.

---

# Not Validator Responsibility

The validator does NOT:

- Track stick movement history
- Enforce move count
- Validate drag interactions
- Enforce snapping logic
- Check if the initial equation was incorrect
- Manage UI feedback

It only validates the final slot configuration.
