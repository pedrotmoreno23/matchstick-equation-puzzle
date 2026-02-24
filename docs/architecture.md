# Architecture Plan (V1)
Matchstick Equation Puzzle

Goal: define a clean, extensible structure before implementation.

V1 focuses on correctness, single-move levels, and a flexible segment system.

---

# 1) Core System Overview

The system consists of:

UI Layer
  ↓
Game Logic Layer
  ↓
Validation Engine

All game logic must remain independent from UI.

The validator only inspects final board state.

---

# 2) Folder Structure (Flutter)

lib/
  main.dart
  app/
    app.dart
  core/
    constants/
      slot_types.dart
      segment_ids.dart
      return_codes.dart
    utils/
      math_utils.dart
  game/
    models/
      segment.dart
      stick.dart
      slot.dart
      board.dart
      level.dart
      validation_result.dart
    logic/
      symbol_recognizer.dart
      evaluator.dart
      validator.dart
    data/
      levels_v1.dart
  ui/
    screens/
      game_screen.dart
    widgets/
      slot_widget.dart
      stick_widget.dart
      rotate_button.dart
      check_button.dart

docs/
  validator_spec.md
  architecture.md
  stick_rotation_spec.md

---

# 3) Slot System (6 Fixed Slots)

Index | Meaning
0 | Optional unary minus (empty or "-")
1 | Digit A
2 | Operator (+ − × /)
3 | Digit B
4 | Equals (=)
5 | Digit C

All V1 equations strictly follow this structure.

---

# 4) Segment Architecture

Each slot contains predefined segment positions.

## Digit Slots (7-segment)
Segments:
a, b, c, d, e, f, g

## Operator Slot (Crossed-Box Layout)

Segments:
- h  (horizontal)
- v  (vertical)
- d1 (bottom-left → top-right)  "/"
- d2 (top-left → bottom-right)  "\"

Valid operator segment combinations:

+  = {h, v}
−  = {h}
×  = {d1, d2}
÷  (division) = {d1} ONLY

Important:
Division is represented by "/".
We do NOT use "\" as division.

## Equals Slot

Segments:
- eq_top
- eq_bottom

Equals slot is fixed in V1 and should not allow removal of sticks via UI.

## Sign Slot (Slot 0)

Segments:
- sign_mid (horizontal)

Valid states:
- {} (empty)
- {sign_mid} (unary minus)

---

# 5) Stick Model (NEW — Rotation Integrated)

Each physical matchstick is an object.

Stick properties:

- orientation:
    HORIZONTAL
    VERTICAL
    DIAGONAL_FWD   ("/")
    DIAGONAL_BACK  ("\")

- headDirection:
    LEFT
    RIGHT
    TOP
    TOP_RIGHT
    TOP_LEFT

Rules:
- No downward head directions allowed.
- If orientation == HORIZONTAL, head direction is ignored.
- Head direction exists for visual realism, not equation validation.

Rotation changes orientation.
Head direction must remain valid after rotation.

Detailed behavior is defined in:
docs/stick_rotation_spec.md

---

# 6) Symbol Recognition

Symbols are recognized by exact segment combinations.

There is no fuzzy matching.

Digit slots:
- Active segments must match exactly one digit 0–9.

Operator slot:
- Must match exactly one valid operator combination.

Equals slot:
- Must always equal {eq_top, eq_bottom}

Sign slot:
- {} or {sign_mid}

Any other combination:
INVALID_SYMBOL_STATE

---

# 7) Evaluation Flow (CHECK)

When CHECK is pressed:

1) Validate symbol structure
2) Construct values:
   A = digit(slot1) (apply sign from slot0)
   B = digit(slot3)
   C = digit(slot5)
3) Evaluate:
   +, −, × normal
   / requires:
       B != 0
       A % B == 0
4) Compare result == C

Return ValidationResult.

Validator does not track move count.

---

# 8) Move & Rotation Flow

User interaction:

- Tap stick → select
- Rotate button → rotate orientation
- Drag → reposition
- Snap only to valid segment positions

Rotation may occur:
- Before placement
- Or automatically on snap (design choice)

Stick count should remain constant in V1.
No creation or deletion of sticks via UI.

---

# 9) Architecture Diagram

[GameScreen]
   ↓
[BoardWidget]
   ↓
User drags/rotates sticks
   ↓
CHECK pressed
   ↓
[Validator]
   → SymbolRecognizer
   → Evaluator
   → Compare
   → ValidationResult

---

# 10) V1 Boundaries

V1 Includes:
- 6-slot fixed equations
- Single-digit numbers
- Unary minus only in slot 0
- + − × / operators
- Single move (design rule, not enforced)
- Stick rotation
- Snap-based placement

V1 Excludes:
- Multi-digit numbers
- Variable equation length
- Enforced move counting
- Multiple move levels
- Advanced animations
- Custom symbol variations