# 9-puzzle game solver
 A 9-puzzle game solver created with Processing 3


## Description

Given a specific configuration, the solver will find the cheapest solution (if it exists) to the game.

The solver implements the A* search algorithm and compares its execution time and visited nodes number according to two classical heuristics

1. **Heuristic 1 :** considers the misplaced tiles
2. **Heuristic 2 :** euclidean distance between two tiles

![Game_execution_exemple](/taquin.png)

## Prerequisites

*  Processing 3.5.*
*  ControlP5 library for Processing


