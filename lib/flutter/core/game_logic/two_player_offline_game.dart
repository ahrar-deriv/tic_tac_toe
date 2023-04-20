import 'package:tic_tac_toe/flutter/core/enum.dart';
import 'package:tic_tac_toe/flutter/core/game_logic/game_logic.dart';

class TwoPlayerOfflineGame extends GameLogic {
  @override
  bool checkTie(List<List<Tile>> board) {
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
    return currentRole == GameRole.player1
        ? GameRole.player2
        : GameRole.player1;
  }

  @override
  bool checkWin(List<List<Tile>> board, GameRole gameRole) {
    Tile currentTile = gameRole == GameRole.player1 ? Tile.x : Tile.o;
    for (var i = 0; i < 3; i++) {
      if (board[i][0] == currentTile &&
          board[i][1] == currentTile &&
          board[i][2] == currentTile) {
        return true;
      }
      if (board[0][i] == currentTile &&
          board[1][i] == currentTile &&
          board[2][i] == currentTile) {
        return true;
      }
    }
    if (board[0][0] == currentTile &&
        board[1][1] == currentTile &&
        board[2][2] == currentTile) {
      return true;
    }
    if (board[0][2] == currentTile &&
        board[1][1] == currentTile &&
        board[2][0] == currentTile) {
      return true;
    }
    return false;
  }
}
