import 'package:flutter/material.dart';
import 'package:tic_tac_toe/flutter/core/enum.dart';
import 'package:tic_tac_toe/flutter/presentation/pages/play_ground_page.dart';
import 'package:tic_tac_toe/flutter/theme_helper/color_helper.dart';

Widget offlineLevelDialog(BuildContext context) {
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          _gameLevelTile(
            context: context,
            title: '2 Player',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      const PlayGroundPage(gameMode: GameMode.twoPlayerOffline),
                ),
              );
            },
          ),
          _gameLevelTile(
            context: context,
            title: 'Easy',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      const PlayGroundPage(gameMode: GameMode.simpleOffline),
                ),
              );
            },
          ),
          _gameLevelTile(
            context: context,
            title: 'Diffcult',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PlayGroundPage(
                    gameMode: GameMode.difficultOffline,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

Container _gameLevelTile(
    {required BuildContext context,
    required String title,
    required VoidCallback onTap}) {
  return Container(
    margin: const EdgeInsets.all(4),
    padding: const EdgeInsets.all(8),
    decoration:
        BoxDecoration(color: darkGrey, borderRadius: BorderRadius.circular(8)),
    width: double.infinity,
    child: TextButton(
      onPressed: onTap,
      child: Text(title),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          lightPink,
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 20, fontFamily: 'Alkatra'),
        ),
      ),
    ),
  );
}
