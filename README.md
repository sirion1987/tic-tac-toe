# Tic-Tac-Toe

Design a Tic-Tac-Toe game for two players in Ruby in a terminal.

## Assumptions
* To be valid, a move needs to be within the grid boundaries and must be placed on an empty block.
* Once a winning condition is reached, no more moves are allowed.
* A player who succeeds in placing 3 of their marks in a horizontal, vertical, or diagonal row wins the game.

## Objectives
* Your code should be tested by automated tests as much as possible.
* Quality matters. Focus on separation of responsibilities, readability, and modularity.

## Step 1 - Gameplay setup

The game is played on a 3x3 grid. A grid looks like this:

```
 X | O | O
--- --- ---
   | X |
--- --- ---
   |   | X
```

Your first task is to set the game up:

* Each player is assigned with a symbol between `X` and `O`.
* Players are asked in turn to mark one grid cell with their symbol.
* A symbol can't be placed out of bounds nor on the same space as another symbol.
* If a symbol is placed in an invalid space, the game offers a retry.
* After each player's move, the game must print the grid to the terminal.
* The winner is the player who places 3 consecutives symbols first.
