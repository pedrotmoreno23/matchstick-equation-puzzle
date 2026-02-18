# Matchstick Equation Puzzle

A logic-based puzzle game where players fix incorrect math equations by moving matchsticks.

The game challenges players to transform a false equation into a correct one using a limited number of moves.

---

## 🎯 Concept

Each level presents an incorrect equation built using matchstick-style digits and operators.

Example:

6 + 4 = 4

The player must move one matchstick to make the equation mathematically correct.

The system automatically validates whether the resulting equation is true.

---

## 🧠 Core Mechanics

- Segment-based symbol system (digits and operators built from matchsticks)
- Player moves matchsticks between slots
- Equation is parsed and evaluated dynamically
- Supports multiple valid solutions
- Prevents trivial solutions like `!=` or `<>`

---

## 📐 Version 1 Scope

- Format: `A op B = C`
- Single-digit numbers only (0–9)
- Operators supported: +, −, ×, ÷
- Exactly 1 move per level
- Integer-only division results
- Fixed 5-slot equation layout

See `/docs` for full design documentation.

---

## 🏗 Architecture Goals

- Flexible slot/segment system
- General equation evaluator (not hardcoded answers)
- Easily expandable level system
- Designed to support future features without refactoring

---

## 🚀 Tech Stack

- Flutter (UI framework)
- Dart (programming language)
- Git + GitHub (version control)

---

## 🗺 Roadmap

### Week 1
Project planning and architecture design

### Week 2
Segment system + equation validator

### Week 3
Matchstick movement logic + level system

### Week 4
UI polish + testing + refinement

---

## 📌 Status

Currently in planning phase (V1 architecture definition).
