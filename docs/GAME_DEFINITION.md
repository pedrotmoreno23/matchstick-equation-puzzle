Matchstick Equation Puzzle — 1-Page Game Definition (Draft)
Overview
Matchstick Equation Puzzle is a logic game where the player fixes a broken math equation by moving one or more matchsticks. Each number and operator is drawn using matchsticks (like a digital/segment style). A level is solved when the displayed equation becomes mathematically true after the allowed moves.
The game is designed to be simple, fast, and addictive: quick puzzles, satisfying “aha!” moments, and lots of levels.

Core Gameplay
The screen shows a wrong equation made of matchsticks (example format: A op B = C).


The player can move matchsticks from one place to another.


After moving sticks, the player taps CHECK.


The game validates the resulting equation automatically.



Rules
The player may move 1 or more matchsticks, based on the level’s limit (“Moves Allowed”).


A move means:


picking up one stick from anywhere in the equation


placing it somewhere else that forms a valid digit or operator shape


The final equation must be valid and true.


“Easy hacks” are not allowed:


!= and <> do not count as valid operators or valid “solutions”.


The game supports:


Digits: 0–9


Operators: +, −, ×, ÷


Equals: =


Some symbols may have multiple valid visual forms (example: two variations of the digit 4).



Equation Validation (Important Design Choice)
Instead of hardcoding solutions, the game uses a general equation checker, so it can accept solutions the developer didn’t personally predict.
Validation checks:
Each “slot” in the equation must be a valid digit/operator (no broken shapes).


The expression must be parseable (ex: 7 + 2 = 9).


Evaluate left side and right side and confirm they match.


Notes:
Division rules should be clear (v1 suggestion):


Only allow divisions that result in integers (no decimals), to keep puzzles clean.


Multiplication uses standard precedence rules OR we can enforce simple format like A op B = C to avoid precedence confusion.



Visual Representation System (Slots)
The equation is made of slots laid out left-to-right.


Each slot can display a digit or operator.


A slot is segment-based, meaning it has a fixed set of possible stick positions.


Any slot must be capable of representing any digit 0–9 or any operator (+ − × ÷ =), depending on which segments are active.


This allows moving sticks between slots while keeping the UI consistent.



Level Structure
Each level defines:
Initial equation layout (which slots exist)


Allowed moves (1, 2, 3, etc.)


Optional hint text


Win condition: “equation evaluates true”


The game can include many levels because the rules are simple and reusable.

Constraints / Non-Goals (for early versions)
To keep development manageable:
No != or <>


No free-form text entry; everything is done via sticks/segments


No multiplayer, no bots


Minimal animations in early versions


Focus on correctness, clarity, and level volume first



Why This Game Works
Simple mechanic, deep puzzle variety


Short play sessions


Easy to add content (levels)


Feels “new” because multiple solutions can exist and the checker can accept them
