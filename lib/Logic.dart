import 'package:flutter/material.dart';

class Logic extends ChangeNotifier {
  int count = 0;
  bool player = true; //true means player 1 - X
  List<int> knots = [];
  List<int> crosses = [];
  List<List<int>> winningPatterns = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  Map<int, bool?> board = {
    0: null,
    1: null,
    2: null,
    3: null,
    4: null,
    5: null,
    6: null,
    7: null,
    8: null
  };

  void reset() {
    count = 0;
    player = true;
    knots.clear();
    crosses.clear();
    board = Map.fromIterable(List.generate(9, (i) => i), value: (_) => null);
    notifyListeners();
  }

  bool checkForWin() {
    List<int> toCheck = player ? knots : crosses;
    for (List<int> p in winningPatterns) {
      if (toCheck.contains(p[0]) &&
          toCheck.contains(p[1]) &&
          toCheck.contains(p[2])) {
        return true;
      }
    }
    return false;
  }

  void makeMove(int index) {
    if (board[index] == null) {
      board[index] = player;
      if (player) {
        crosses.add(index);
      } else {
        knots.add(index);
      }
      player = !player;
      count++;
      notifyListeners();
    }
  }
}
