import 'package:flutter/material.dart';
import 'package:tic_tac_toe/flutter/theme_helper/color_helper.dart';

class UsersListItem extends StatelessWidget {
  const UsersListItem({
    Key? key,
    required this.name,
    required this.score,
    required this.medal,
    this.onTap,
  }) : super(key: key);

  final String name;
  final int score;
  final Color medal;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                name,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  score.toString(),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.grade_outlined,
                  color: medal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
