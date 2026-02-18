# Matchstick Equation Puzzle  
## Game Definition

---

## Overview

**Matchstick Equation Puzzle** is a logic game where the player fixes a broken math equation by moving one or more matchsticks.

Each number and operator is drawn using matchsticks (segment-style).  
A level is solved when the displayed equation becomes mathematically true after the allowed moves.

The game is designed to be:
- Simple
- Fast
- Addictive
- Focused on satisfying “aha!” moments

---

## Core Gameplay

- The screen shows an incorrect equation (format: `A op B = C`)
- The player moves matchsticks
- The player taps **CHECK**
- The system validates the equation automatically

---

## Rules

### Move Rules

- The player may move **1 or more matchsticks**, depending on the level.
- A move consists of:
  - Removing one stick from any symbol
  - Placing it in a valid segment position

### Valid Solution Requirements

- The final equation must be mathematically true.
- All slots must form valid digits/operators.
- Trivial comparison hacks are NOT allowed:
  - `!=`
  - `<>`

---

## Supported Symbols

### Digits
- 0–9

### Operators
- `+`
- `−`
- `×`
- `÷`

### Equality
- `=`

Some symbols may have multiple visual variations (example: alternate forms of 4).

---

## Equation Validation (Key Design Decision)

The game uses a **general equation validator** rather than hardcoded answers.

Validation must ensure:

1. Each slot represents a valid digit or operator
2. The equation is syntactically valid
3. Left-hand side equals right-hand side
4. Division results must be integers (no decimals)

---

## Visual Representation System (Slots)

- The equation consists of left-to-right **slots**
- Each slot is segment-based
- Each slot must be capable of representing:
  - Any digit (0–9)
  - Any operator (+ − × ÷)
  - Equals (=)

This allows sticks to move between slots dynamically.

---

## Level Structure

Each level defines:

- Initial equation layout
- Allowed number of moves
- Optional hint text
- Win condition (equation evaluates true)

---

## Constraints / Early Non-Goals

- No `!=` or `<>`
- No free-form input
- No multiplayer
- Minimal animations
- Focus on correctness and architecture first

---

## Why This Game Works

- Simple mechanic
- High puzzle depth
- Short play sessions
- Multiple valid solutions possible
- Easily expandable