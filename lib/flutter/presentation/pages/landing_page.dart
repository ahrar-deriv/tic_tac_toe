import 'package:flutter/material.dart';
import 'package:tic_tac_toe/flutter/presentation/pages/score_page.dart';
import 'package:tic_tac_toe/flutter/presentation/pages/select_competitor_page.dart';
import 'package:tic_tac_toe/flutter/presentation/widgets/offline_level_dialog.dart';
import 'package:tic_tac_toe/flutter/theme_helper/color_helper.dart';
import 'package:tic_tac_toe/flutter/theme_helper/dimention_helper.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: side40,
              ),
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'asset/images/logo.png',
                  width: 128,
                  height: 128,
                ),
              ),
              const SizedBox(
                height: side10,
              ),
              const Text('Deriv BeSquare'),
              const SizedBox(
                height: side80,
              ),
              _buildTopScoreTitle(),
              const SizedBox(
                height: side10,
              ),
              _buildTopScoreList(),
              _buildbottomButtons()
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildbottomButtons() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const SelectCompetitorPage()),
                    ),
                  );

                  /// Todo: Check shardPreference that user registered previously or not, if no show this dialog
                  /// else choose next player randomly
                  // showDialog(
                  //   context: context,
                  //   builder: ((_) => Dialog(
                  //         child: loginDialog(context),
                  //         backgroundColor:
                  //             Theme.of(context).scaffoldBackgroundColor,
                  //       )),
                  // );
                },
                child: const Text(
                  'Online',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: ((_) => Dialog(
                          child: offlineLevelDialog(context),
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        )),
                  );
                },
                child: const Text(
                  'Offline',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: side10,
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScorePage(),
                  ));
                },
                child: const Text(
                  'Scores',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopScoreTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Top Scores',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  List<String> topScore = ['zohreh', 'ahrar', 'weng'];
  List<Color> medal = [Colors.yellow, Colors.grey, Colors.brown];
  List<int> score = [100, 80, 60];

  Widget _buildTopScoreList() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: darkGrey,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  topScore[index].toString(),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    score[index].toString(),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.grade_outlined,
                    color: medal[index],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: topScore.length,
    );
  }
}
