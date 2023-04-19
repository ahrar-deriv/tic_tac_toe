import 'package:tic_tac_toe/flutter/core/enum.dart';

class GameBoard {
  List<List<Tile>> _board = [
    [Tile.empty, Tile.empty, Tile.x],
    [Tile.empty, Tile.o, Tile.empty],
    [Tile.empty, Tile.empty, Tile.empty]
  ];
  List<List<Tile>> get board => _board;

  void resetBoard() {
    _board = [
      [Tile.empty, Tile.empty, Tile.empty],
      [Tile.empty, Tile.empty, Tile.empty],
      [Tile.empty, Tile.empty, Tile.empty]
    ];
  }

  void updateBoard(int row, int col, Tile tileValue) {
    _board[row][col] = tileValue;
  }

  /// add constructor that create singletone
}
