import 'package:flutter/material.dart';
import 'package:tic_tac_toe/flutter/core/enum.dart';
import 'package:tic_tac_toe/flutter/data/fake_data.dart';
import 'package:tic_tac_toe/flutter/model/player.dart';
import 'package:tic_tac_toe/flutter/presentation/pages/play_ground_page.dart';
import 'package:tic_tac_toe/flutter/presentation/widgets/users_list_item.dart';
import 'package:tic_tac_toe/flutter/theme_helper/dimention_helper.dart';

class SelectCompetitorPage extends StatelessWidget {
  const SelectCompetitorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: side20,
                ),
                const Text(
                  'Select your competitor',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: side20,
                ),
                _buildUsersList(players),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUsersList(List<Player> players) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return UsersListItem(
          name: players[index].name,
          score: players[index].score,
          medal: players[index].medal,
          onTap: (() {
            /// Todo : should send this data to server that who user choose to play
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: ((context) => const PlayGroundPage(
                      gameMode: GameMode.online,
                    )),
              ),
            );
          }),
        );
      },
      itemCount: players.length,
    );
  }
}
