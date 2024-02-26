import 'package:flutter/material.dart';

import '../constant.dart';

class CoverScreen extends StatelessWidget {
  const CoverScreen({
    super.key,
    required this.gameHasStarted,
  });

  final bool gameHasStarted;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, -0.5),
      child: Text(
        gameHasStarted ? '' : 'T A P  T O  P L A Y ',
        style: const TextStyle(
            color: kGreen, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
