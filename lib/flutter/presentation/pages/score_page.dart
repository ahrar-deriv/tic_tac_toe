import 'package:flutter/material.dart';
import 'package:tic_tac_toe/flutter/data/fake_data.dart';
import 'package:tic_tac_toe/flutter/model/player.dart';
import 'package:tic_tac_toe/flutter/presentation/widgets/users_list_item.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top Scores'), elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildTopScoreList(players),
      ),
    );
  }

  Widget _buildTopScoreList(List<Player> players) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return UsersListItem(
          name: players[index].name,
          score: players[index].score,
          medal: players[index].medal,
        );
      },
      itemCount: players.length,
    );
  }
}
