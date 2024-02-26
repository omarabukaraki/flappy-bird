import 'dart:async';
import 'package:flappy_bird/view/widget/barrier.dart';
import 'package:flappy_bird/view/widget/bird.dart';
import 'package:flappy_bird/view/widget/cover_screen.dart';
import 'package:flappy_bird/view/widget/custom_alert_dialog.dart';
import 'package:flappy_bird/view/widget/score_board.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdY = 0;
  double initialPos = birdY;
  double height = 0;
  double time = 0;
  double gravity = -4; // how strong the gravity is
  double velocity = 2.5; // how strong the jump is
  double birdWidth = 0.1;
  double birdHeight = 0.1;
  static double barrierXOne = 1;
  double barrierXTwo = barrierXOne + 1.5;
  //game settings
  bool gameHasStarted = false;
  int score = 0;
  int best = 0;

  static List<double> barrierX = [1.1, 1 + barrierXOne + 1.5];
  static double barrierWidth = 0.5;
  List<List<double>> barrierHeight = [
    [0.6, 0.4],
    [0.4, 0.4]
  ];

  void startGame() {
    gameHasStarted = true;

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        birdY = initialPos - height;
      });

      setState(() {
        if (barrierXOne < -2) {
          score = score + 1;
          barrierXOne += 3.5;
        } else {
          barrierXOne -= 0.05;
        }
      });
      setState(() {
        if (barrierXTwo < -2) {
          score = score + 1;
          barrierXTwo += 3.5;
        } else {
          barrierXTwo -= 0.05;
        }
      });

      if (birdIsDead()) {
        timer.cancel();
        _showDialog();
      }

      time += 0.05;
    });
  }

  void jump() {
    setState(() {
      time = 0;
      initialPos = birdY;
    });
  }

  bool birdIsDead() {
    if (birdY < -1 || birdY > 1) {
      return true;
    }

    for (int i = 0; i < barrierX.length; i++) {
      if (barrierXOne <= birdWidth &&
          barrierXOne + barrierWidth >= -birdWidth &&
          (birdY <= -1.1 + barrierHeight[i][0] ||
              birdY + birdHeight >= 1.1 - barrierHeight[i][1])) {
        return true;
      }
    }
    for (int i = 0; i < barrierX.length; i++) {
      if (barrierXTwo <= birdWidth &&
          barrierXTwo + barrierWidth >= -birdWidth &&
          (birdY <= -1 + barrierHeight[i][0] ||
              birdY + birdHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }

    return false;
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      birdY = 0;
      gameHasStarted = false;
      time = 0;
      initialPos = birdY;
      barrierXOne = 1;
      barrierXTwo = barrierXOne + 1.5;
      best = score;
      score = 0;
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xffffc686),
          title: const CustomAlertDialog(),
          actions: [
            GestureDetector(
              onTap: resetGame,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/Capture.PNG'),
                              fit: BoxFit.fill)),
                      child: const Center(
                        child: Text(
                          'PLAY AGAIN',
                          style: TextStyle(
                              color: kGreen,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/sky.PNG'),
                      fit: BoxFit.fill)),
              // color: const Color.fromARGB(255, 54, 127, 255),
              child: Center(
                  child: Stack(
                children: [
                  Bird(
                      birdY: birdY,
                      birdHeight: birdHeight,
                      birdWidth: birdHeight),
                  CoverScreen(gameHasStarted: gameHasStarted),
                  AnimatedContainer(
                      alignment: Alignment(barrierXOne, 1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const Barrier(
                        size: 170,
                      )),
                  AnimatedContainer(
                      alignment: Alignment(barrierXOne, -1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const Barrier(
                        image: 'assets/images/pipetwo.png',
                        size: 170,
                      )),
                  AnimatedContainer(
                      alignment: Alignment(barrierXTwo, 1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const Barrier(
                        size: 150,
                      )),
                  AnimatedContainer(
                      alignment: Alignment(barrierXTwo, -1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const Barrier(
                        image: 'assets/images/pipetwo.png',
                        size: 230,
                      )),
                ],
              )),
            ),
          ),
          Expanded(
            child: ScoreBoard(score: score, best: best),
          ),
        ]),
      ),
    );
  }
}
