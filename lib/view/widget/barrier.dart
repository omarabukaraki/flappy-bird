import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  const Barrier({
    super.key,
    required this.size,
    this.image,
  });
  final double size;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image ?? 'assets/images/pipe.png'),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
