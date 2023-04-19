import 'package:flutter/material.dart';
import 'package:tic_tac_toe/flutter/core/enum.dart';
import 'package:tic_tac_toe/flutter/core/game_logic/game_board.dart';
import 'package:tic_tac_toe/flutter/core/game_logic/game_logic.dart';
import 'package:tic_tac_toe/flutter/core/game_logic/simple_offline_game.dart';
import 'package:tic_tac_toe/flutter/theme_helper/color_helper.dart';
import 'package:tic_tac_toe/flutter/theme_helper/dimention_helper.dart';

class PlayGroundPage extends StatefulWidget {
  const PlayGroundPage({required this.gameMode, Key? key}) : super(key: key);
  final GameMode gameMode;

  @override
  State<PlayGroundPage> createState() => _PlayGroundPageState();
}

class _PlayGroundPageState extends State<PlayGroundPage> {
  String playerName = 'Player Name ';
  late GameLogic game;
  GameBoard gameBoard = GameBoard();

  @override
  void initState() {
    if (widget.gameMode == GameMode.simpleOffline) {
      game = SimpleOfflineGame();
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
                  Icons.circle_outlined,
                  color: lightPink,
                ),
                SizedBox(
                  width: side20,
                ),
                Text(
                  'Palyer 1',
                  style: TextStyle(fontSize: 18),
                ),
              ],
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
                  'Palyer 2',
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
        setState(() {
          gameBoard.updateBoard(row, col, Tile.o);
          game.checkWin();
          game.checkTie();
        });
      },
      child: Container(
        width: 30,
        height: 30,
        color: Colors.red,
        child: Center(
          child: gameBoard.board[row][col] == Tile.empty
              ? const SizedBox.shrink()
              : Icon(
                  gameBoard.board[0][0] == Tile.x
                      ? Icons.close
                      : Icons.circle_outlined,
                ),
        ),
      ),
    );
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
          onPressed: () {},
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
