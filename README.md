# 9-puzzle solver
 An 9-puzzle solver created with Processing 3


## General information

Given a specific configuration, the solver will find a solution (if it exists) to the game.

The solver implements the A* search algorithm and compares its execution time and visited nodes number according to two classical heuristics


1. **Heuristic 1** : considers the misplaced tiles
2. **Heuristic 2** : euclidean distance between two tiles


