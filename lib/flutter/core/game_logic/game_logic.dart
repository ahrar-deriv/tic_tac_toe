import 'package:tic_tac_toe/flutter/core/enum.dart';

abstract class GameLogic {
  bool checkWin();
  bool checkTie();
  GameRole checkUserTurn(GameRole currentRole);
}
