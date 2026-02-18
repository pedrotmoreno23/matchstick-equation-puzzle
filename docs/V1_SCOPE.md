V1 Scope Definition
Matchstick Equation Puzzle

Purpose of V1
Version 1 (V1) defines the smallest complete, playable, and technically solid version of the game.
The goal of V1 is to:
Deliver a fully working puzzle system


Implement a flexible slot/segment architecture


Build a general equation validator


Prove technical completeness before adding complexity


V1 is focused on correctness and system design, not advanced visuals or extended mechanics.

Equation Structure (V1)
All equations in V1 follow a fixed structure:
A op B = C

Where:
A, B, and C are single digits (0–9)


op is one operator


= is fixed and required


Total slots: 5
Digit


Operator


Digit


Equals sign


Digit


No multi-digit numbers in V1.

Supported Symbols (System-Level Support)
The slot system must be capable of representing:
Digits
0–9
Operators
Addition (+)


Subtraction (−)


Multiplication (×)


Division (÷)


Equality
Equals (=)


Even if early levels focus on + and −, the system must technically support all four operators from the start to avoid architectural refactoring later.

Move Rules (V1)
The player may move exactly 1 matchstick per level.


A move consists of:


Removing one stick from any symbol


Placing it into any valid segment position


After the move:
All slots must form valid digits/operators


The equation must evaluate to true



Equation Validation Rules
When the player presses CHECK:
Each slot must correspond to a valid digit or operator.


The equation must be syntactically valid.


The left-hand side must evaluate numerically equal to the right-hand side.


Division must result in an integer (no decimals allowed).


The following are NOT allowed:


!=


<>


Any custom comparison operators


Standard arithmetic precedence applies:
× and ÷ before + and −


However, due to fixed structure A op B = C, precedence does not create ambiguity in V1.

Slot & Segment System Requirements
Every slot is segment-based.


A slot must be capable of representing:


Any digit 0–9


Any operator (+ − × ÷)


Equals (=)


Only one visual variation per digit is supported in V1 (e.g., only one version of 4).


The system must allow dynamic transformation via segment activation/deactivation.

Level Design Constraints (V1)
Fixed 5-slot equations only.


Exactly 1 valid move required to solve.


No time limits.


No scoring system.


No animations required (minimal UI acceptable).



Explicitly Out of Scope (Not in V1)
Multi-digit numbers


Variable-length equations


Multiple allowed moves per level


Alternative digit visual forms


Exponents


Adding/removing sticks beyond the single-move rule


Level editor


Hints system


Sound effects


Advanced animations



Success Criteria for V1
V1 is considered complete when:
The player can play multiple levels


Matchstick movement works correctly


Equation validation is fully reliable


The game can handle all 0–9 and all four operators


No refactoring is required to add more levels
