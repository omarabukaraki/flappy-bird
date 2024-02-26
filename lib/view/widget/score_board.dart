import 'package:flutter/material.dart';
import '../constant.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    super.key,
    required this.score,
    required this.best,
  });

  final int score;
  final int best;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/Capture.PNG'), fit: BoxFit.fill),
        color: kPrimary,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              score.toString(),
              style: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'S C O R E',
              style: TextStyle(
                  color: kGreen, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
        Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              best.toString(),
              style: const TextStyle(
                  color: kGreen, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'L A S T  S C O R E',
              style: TextStyle(
                  color: kGreen, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ]),
    );
  }
}
