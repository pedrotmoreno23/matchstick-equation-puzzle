# Stick Rotation + Match Head Spec (V1)

This document defines how matchsticks can be rotated and how the match head direction is represented.

This is needed because some moves require turning a stick (changing its orientation) before placing it.

---

## 1) Stick Orientations (Allowed)

A stick can be placed in one of these orientations:

1) Horizontal:  "-"
2) Vertical:    "|"
3) Diagonal / : "/"
4) Diagonal \ : "\"

Important:
- The division operator symbol is always "/".
- "\" is not a division symbol by itself.
- "\" may still be used as a diagonal orientation for other symbols (example: "x" uses both diagonals).

---

## 2) Match Head Direction (Allowed)

Each stick has a head direction that can face only these 5 directions:

- LEFT
- RIGHT
- TOP
- TOP_RIGHT
- TOP_LEFT

Not allowed:
- Any direction pointing downward (no BOTTOM / BOTTOM_LEFT / BOTTOM_RIGHT)

Special rule:
- If the stick is horizontal ("-"), head direction does NOT matter.
  We treat both head-left and head-right as equivalent.

---

## 3) Rotation Rules

Rotation means changing the stick’s orientation (and potentially its head direction).

Allowed rotation cycle for orientation:
- "-" -> "/" -> "|" -> "\" -> "-"  (example cycle; actual UI may choose different order)

Head direction rules during rotation:
- For non-horizontal orientations, head direction matters and must remain one of:
  LEFT, RIGHT, TOP, TOP_RIGHT, TOP_LEFT
- If rotation would result in a downward head direction, clamp/convert it to a valid upward direction.

---

## 4) UI Interaction (V1)

We need a simple way for the user to rotate a selected stick.

V1 recommended behavior:

- Tap a stick to select it (highlight)
- Press a "Rotate" button to rotate 90 degrees / next orientation
- Optional: long-press to show a tiny radial picker (not required in V1)

Minimum requirement:
- A "Rotate" button exists while a stick is selected.

---

## 5) Data Model Requirements

Each stick instance must store:

- orientation: { HORIZONTAL, VERTICAL, DIAGONAL_FWD, DIAGONAL_BACK }
  where:
  - DIAGONAL_FWD  = "/" direction (bottom-left -> top-right)
  - DIAGONAL_BACK = "\" direction (top-left -> bottom-right)

- headDirection: { LEFT, RIGHT, TOP, TOP_RIGHT, TOP_LEFT }
  Note:
  - If orientation == HORIZONTAL, headDirection is ignored.

---

## 6) Placement + Snapping

Segment snap points must define what orientations they accept.

Examples:
- Digit slots accept only the orientations needed by 7-seg segments (mostly horizontal/vertical).
- Operator slot accepts:
  - horizontal (for "-" and "+")
  - vertical (for "+")
  - diagonals (for "x" and "/")

When snapping a stick:
- If the segment requires a different orientation than the current stick orientation,
  either:
  A) auto-rotate to match (recommended for usability), OR
  B) reject snap and require the player to rotate manually (simpler logic)

Pick one behavior and keep it consistent.

---

## 7) Notes for Future Versions

Future versions may add:
- multiple stick moves
- adding/removing sticks

Rotation remains valid in all versions because it is a property of a stick before placement.