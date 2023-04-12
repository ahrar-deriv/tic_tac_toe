import 'package:flutter/material.dart';
import 'package:tic_tac_toe/flutter/theme_helper/color_helper.dart';
import 'package:tic_tac_toe/flutter/theme_helper/dimention_helper.dart';

class PlayGroundPage extends StatefulWidget {
  const PlayGroundPage({Key? key}) : super(key: key);

  @override
  State<PlayGroundPage> createState() => _PlayGroundPageState();
}

class _PlayGroundPageState extends State<PlayGroundPage> {
  String playerName = 'Player Name ';
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
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.red,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.red,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.red,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.red,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.red,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.red,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.red,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.red,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.red,
                  ),
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
