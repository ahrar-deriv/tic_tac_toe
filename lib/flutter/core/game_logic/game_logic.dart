import 'package:tic_tac_toe/flutter/core/enum.dart';

abstract class GameLogic {
  bool checkWin(List<List<Tile>> board, GameRole gameRole);
  bool checkTie(List<List<Tile>> board);
  GameRole checkUserTurn(GameRole currentRole);
}
