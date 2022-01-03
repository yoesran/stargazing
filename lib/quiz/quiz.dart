import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:stargazing/controllers/question_controller.dart';
import 'package:stargazing/quiz/question_card.dart';
import 'package:get/get.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key, this.level}) : super(key: key);

  final int? level;

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late AudioPlayer _audioPlayer;

  void _init() async {
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setAsset("assets/audios/quiz.mp3");
    _audioPlayer.play();
  }

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  void dispose() {
    super.dispose();

    _audioPlayer.dispose();
    Get.delete<QuestionController>();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    QuestionController _questionController = Get.put(
      QuestionController(
        (widget.level == 1)
            ? 1
            : (widget.level == 2)
                ? 2
                : (widget.level == 3)
                    ? 3
                    : 1,
      ),
    );

    List<int> questionsIndex = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    questionsIndex.shuffle();

    return Scaffold(
      backgroundColor: const Color(0xFF312244),
      body: SafeArea(
        child: PageView.builder(
          controller: _questionController.pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Lottie.asset("assets/lotties/sky.json"),
                Align(alignment: Alignment.topRight, child: Lottie.asset("assets/lotties/astronot.json", width: 100)),
                QuestionCard(
                  size: size,
                  questionController: _questionController,
                  question: (widget.level == 1)
                      ? _questionController.questions[questionsIndex[index]]
                      : (widget.level == 2)
                          ? _questionController.questions[questionsIndex[index] + 10]
                          : _questionController.questions[questionsIndex[index] + 20],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
