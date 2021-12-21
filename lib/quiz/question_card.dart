import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:stargazing/controllers/question_controller.dart';
import 'package:stargazing/models/questions.dart';
import 'package:stargazing/quiz/option.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.size,
    required QuestionController questionController,
    required this.question,
  })  : _questionController = questionController,
        super(key: key);

  final Size size;
  final QuestionController _questionController;
  final Question question;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          //progress circle
          Container(
            width: (size.height < 700) ? 125 : 180,
            height: (size.height < 700) ? 65 : 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            // child: LinearPercentIndicator(percent: _questionController.questionNumber.value / 10, )
            child: CircularPercentIndicator(
              radius: (size.height < 700) ? 60.0 : 70.0,
              lineWidth: 7.0,
              // animationDuration: 1000,
              percent: _questionController.questionNumber.value / 10,
              // animateFromLastPercent: true,
              // restartAnimation: false,
              // animation: true,
              backgroundColor: Colors.white,
              progressColor: Colors.blue.shade900,
              circularStrokeCap: CircularStrokeCap.round,
              center: Obx(
                () => Text(
                  "${_questionController.questionNumber.value}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.blue.shade900),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "${question.question}",
              // maxLines: 3,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          (question.image == null)
              ? const SizedBox(
                  height: 157,
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      question.image as String,
                      height: 157,
                    ),
                  ),
                ),

          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                question.options!.length - 2,
                (index) => Option(
                  index: index,
                  text: question.options![index],
                  press: () => _questionController.checkedAns(question, index),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              ...List.generate(
                question.options!.length - 2,
                (index) => Option(
                  index: index + 2,
                  text: question.options![index + 2],
                  press: () => _questionController.checkedAns(question, index + 2),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GetBuilder<QuestionController>(
                  init: QuestionController(null),
                  builder: (qnController) {
                    return (qnController.isAnswered)
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shadowColor: Colors.white.withOpacity(0.25),
                              elevation: 1,
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () {
                              qnController.nextQuestion();
                            },
                            child: const Text("Selanjutnya"),
                          )
                        : const SizedBox();
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
