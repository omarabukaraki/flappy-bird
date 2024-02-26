import 'package:flutter/material.dart';

import '../constant.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Screenshot_1691769461.png'),
              fit: BoxFit.fill)),
      child: const Center(
        child: Text(
          'G A M E O V E R',
          style: TextStyle(
            color: kGreen,
          ),
        ),
      ),
    );
  }
}
