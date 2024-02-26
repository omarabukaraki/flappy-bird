import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  const Bird(
      {super.key,
      required this.birdY,
      required this.birdWidth,
      required this.birdHeight});
  final double birdY;
  final double birdWidth;
  final double birdHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, birdY),
      child: SizedBox(
        width: 50,
        height: 50,
        child: Image.asset(
          'assets/images/bird_two.png',
          width: 90,
          height: 90,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
