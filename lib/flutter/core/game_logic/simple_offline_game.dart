import 'package:tic_tac_toe/flutter/core/enum.dart';
import 'package:tic_tac_toe/flutter/core/game_logic/game_board.dart';
import 'package:tic_tac_toe/flutter/core/game_logic/game_logic.dart';

class SimpleOfflineGame extends GameLogic {
  List<List<Tile>> board = GameBoard().board;

  @override
  bool checkTie() {
    for (var row in board) {
      for (var col in row) {
        if (col == Tile.empty) {
          return false;
        }
      }
    }
    return true;
  }

  @override
  GameRole checkUserTurn(GameRole currentRole) {
    return currentRole == GameRole.player1 ? GameRole.system : GameRole.player1;
  }

  @override
  bool checkWin() {
    for (var i = 0; i < 3; i++) {
      if (board[i][0] == Tile.x &&
          board[i][1] == Tile.x &&
          board[i][2] == Tile.x) {
        return true;
      }
      if (board[0][i] == Tile.x &&
          board[1][i] == Tile.x &&
          board[2][i] == Tile.x) {
        return true;
      }
    }
    if (board[0][0] == Tile.x &&
        board[1][1] == Tile.x &&
        board[2][2] == Tile.x) {
      return true;
    }
    if (board[0][2] == Tile.x &&
        board[1][1] == Tile.x &&
        board[2][0] == Tile.x) {
      return true;
    }
    return false;
  }
}
