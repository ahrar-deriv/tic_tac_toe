import 'package:flutter/material.dart';
import 'package:tic_tac_toe/flutter/core/enum.dart';
import 'package:tic_tac_toe/flutter/core/game_logic/game_board.dart';
import 'package:tic_tac_toe/flutter/core/game_logic/game_logic.dart';
import 'package:tic_tac_toe/flutter/core/game_logic/two_player_offline_game.dart';
import 'package:tic_tac_toe/flutter/theme_helper/color_helper.dart';
import 'package:tic_tac_toe/flutter/theme_helper/dimention_helper.dart';

class PlayGroundPage extends StatefulWidget {
  const PlayGroundPage({required this.gameMode, Key? key}) : super(key: key);
  final GameMode gameMode;

  @override
  State<PlayGroundPage> createState() => _PlayGroundPageState();
}

class _PlayGroundPageState extends State<PlayGroundPage> {
  String playerName = 'Player1';
  late GameLogic game;
  GameBoard gameBoard = GameBoard();
  GameRole gameRole = GameRole.player1;
  bool canContinueGame = true;

  @override
  void initState() {
    if (widget.gameMode == GameMode.twoPlayerOffline) {
      game = TwoPlayerOfflineGame();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            _buildAppBar(),
            const SizedBox(
              height: side30,
            ),
            Text(
              '$playerName Turn',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: side50,
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: [
                  _buildTile(row: 0, col: 0),
                  _buildTile(row: 0, col: 1),
                  _buildTile(row: 0, col: 2),
                  _buildTile(row: 1, col: 0),
                  _buildTile(row: 1, col: 1),
                  _buildTile(row: 1, col: 2),
                  _buildTile(row: 2, col: 0),
                  _buildTile(row: 2, col: 1),
                  _buildTile(row: 2, col: 2),
                ],
              ),
            ),
            Row(
              children: const [
                Icon(
                  Icons.close_outlined,
                  color: lightPink,
                ),
                SizedBox(
                  width: side20,
                ),
                Text(
                  'Palyer1',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(
                  Icons.circle_outlined,
                  color: lightPink,
                ),
                SizedBox(
                  width: side20,
                ),
                Text(
                  'Palyer2',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildTile({required int row, required int col}) {
    return GestureDetector(
      onTap: () {
        if (canContinueGame && gameBoard.board[row][col] == Tile.empty) {
          setState(() {
            gameBoard.updateBoard(
              row,
              col,
              gameRole == GameRole.player1 ? Tile.x : Tile.o,
            );
            playerName = gameRole == GameRole.player1 ? 'Player2' : 'Player1';
            bool isWin = game.checkWin(gameBoard.board, gameRole);
            bool isTie = game.checkTie(gameBoard.board);
            canContinueGame = !(isWin || isTie);

            if (isWin) {
              _showWinDialog(gameRole);
              resetGame();
            }
            if (isTie && !isWin) {
              _showTieDialog();
              resetGame();
            }
          });
          gameRole = game.checkUserTurn(gameRole);
        }
      },
      child: Container(
        width: 30,
        height: 30,
        color: Colors.red,
        child: Center(
          child: gameBoard.board[row][col] == Tile.empty
              ? const SizedBox.shrink()
              : Icon(
                  gameBoard.board[row][col] == Tile.x
                      ? Icons.close
                      : Icons.circle_outlined,
                ),
        ),
      ),
    );
  }

  void _showWinDialog(GameRole currentPlayer) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: darkGrey,
            title: const Text('🥳 Congratsss 🥳'),
            content: Container(
              padding: const EdgeInsets.all(16),
              child: Text('$playerName Win'),
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Play again'),
              )
            ],
          );
        });
  }

  void _showTieDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: darkGrey,
            title: const Text(' Tie '),
            content: Container(
              padding: const EdgeInsets.all(16),
              child: const Text('This game had no winner!'),
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Play again'),
              )
            ],
          );
        });
  }

  void resetGame() {
    gameBoard.resetBoard();
    gameRole = GameRole.player1;
    playerName = 'Player1';
    canContinueGame = true;
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: lightPink,
              size: 24,
            )),
        IconButton(
          onPressed: () {
            setState(() {
              resetGame();
            });
          },
          icon: const Icon(
            Icons.replay,
            color: lightPink,
            size: 24,
          ),
        )
      ],
    );
  }
}
