# Validator Specification (V1)

This document defines the exact behavior of the CHECK system for V1.

The validator operates strictly from final slot states.

It does not track moves.
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

---

# Step 1 — Symbol Validation

Before evaluation, all slots must be validated.

## Slot 0 (Optional Sign)
- Must be either:
  - Empty (no active segments)
  - A valid minus sign shape
- No other symbol allowed here.

## Slot 1, 3, 5 (Digits)
- Must form valid digits 0–9.
- No unary minus allowed in these slots.
- Only one visual variation per digit allowed in V1.

## Slot 2 (Operator)
Must be exactly one of:
- +
- −
- ×
- /

No other symbol allowed.

## Slot 4 (Equals)
- Must represent "=".
- This slot is fixed by structure and cannot become another symbol.

If any slot fails validation:

Return: `INVALID_SYMBOL_STATE`

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

Division must always produce an integer.

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
- Any slot containing an unsupported symbol

---

# Move Count

The validator assumes:
- Exactly 1 matchstick move per level (V1 rule)

Move tracking is handled outside this system.

---

# Not Validator Responsibility

The validator does NOT:

- Track how many sticks were moved
- Check if the initial equation was incorrect
- Validate drag interactions
- Enforce snapping rules
- Manage UI feedback

It only validates the final slot configuration.
