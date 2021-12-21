import 'package:flutter/material.dart';
import 'package:stargazing/controllers/question_controller.dart';
import 'package:stargazing/quiz/question_card.dart';
import 'package:get/get.dart';

class Quiz extends StatelessWidget {
  const Quiz({Key? key, this.level}) : super(key: key);

  final int? level;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    QuestionController _questionController = Get.put(
      QuestionController((level == 1)
          ? 1
          : (level == 2)
              ? 2
              : (level == 3)
                  ? 3
                  : 1),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF312244),
      body: SafeArea(
        child: PageView.builder(
          controller: _questionController.pageController,
          physics: const NeverScrollableScrollPhysics(),

          // onPageChanged: _questionController.updateTheQnNum,
          itemCount: 10,
          itemBuilder: (context, index) => QuestionCard(
            size: size,
            questionController: _questionController,
            question: (level == 1)
                ? _questionController.questions[index]
                : (level == 2)
                    ? _questionController.questions[index + 10]
                    : (level == 3)
                        ? _questionController.questions[index + 20]
                        : _questionController.questions[index],
          ),
        ),
      ),
    );
  }
}

// class Screening extends StatefulWidget {
//   const Screening({Key? key}) : super(key: key);

//   @override
//   _ScreeningState createState() => _ScreeningState();
// }

// class _ScreeningState extends State<Screening> {
//   final _stepsText = ["", "", ""];

//   final _stepCircleRadius = 12.5;

//   final _stepProgressViewHeight = 150.0;

//   Color _activeColor = Colors.blue;

//   Color _inactiveColor = Colors.white;

//   Size? _safeAreaSize;

//   int _curPage = 1;

//   StepProgressView _getStepProgress() {
//     return StepProgressView(
//       _stepsText,
//       _curPage,
//       _stepProgressViewHeight,
//       _safeAreaSize!.width,
//       _stepCircleRadius,
//       _activeColor,
//       _inactiveColor,
//       lineHeight: 10,
//       decoration: BoxDecoration(color: Colors.transparent),
//       padding: EdgeInsets.only(
//         top: 48.0,
//         left: 24.0,
//         right: 24.0,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     _safeAreaSize = MediaQuery.of(context).size;
//     QuestionController _questionController = Get.put(QuestionController());

//     return Scaffold(
//       backgroundColor: const Color(0xFF312244),
//       body: Stack(
//         children: [
//           // background ungu
//           Container(height: 150.0, child: _getStepProgress()),
//           //card pertanyaan
//           PageView.builder(
//             controller: _questionController.pageController,
//             physics: NeverScrollableScrollPhysics(),
//             onPageChanged: (i) {
//               setState(() {
//                 _curPage = i + 1;
//               });
//             },
//             itemCount: _questionController.questions.length,
//             itemBuilder: (context, index) => QuestionCard(
//               size: MediaQuery.of(context).size,
//               questionController: _questionController,
//               question: _questionController.questions[index],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class StepProgressView extends StatelessWidget {
//   const StepProgressView(
//     List<String> stepsText,
//     int curStep,
//     double height,
//     double width,
//     double dotRadius,
//     Color activeColor,
//     Color inactiveColor, {
//     required this.decoration,
//     required this.padding,
//     this.lineHeight = 2.0,
//   })  : _stepsText = stepsText,
//         _curStep = curStep,
//         _height = height,
//         _width = width,
//         _dotRadius = dotRadius,
//         _activeColor = activeColor,
//         _inactiveColor = inactiveColor,
//         assert(curStep > 0 == true && curStep <= stepsText.length),
//         assert(width > 0),
//         assert(height >= 2 * dotRadius),
//         assert(width >= dotRadius * 2 * stepsText.length);

//   //height of the container
//   final double _height;
//   //width of the container
//   final double _width;
//   //container decoration
//   final BoxDecoration decoration;
//   //list of texts to be shown for each step
//   final List<String> _stepsText;
//   //cur step identifier
//   final int _curStep;
//   //active color
//   final Color _activeColor;
//   //in-active color
//   final Color _inactiveColor;
//   //dot radius
//   final double _dotRadius;
//   //container padding
//   final EdgeInsets padding;
//   //line height
//   final double lineHeight;

//   List<Widget> _buildDots() {
//     var wids = <Widget>[];
//     _stepsText.asMap().forEach((i, text) {
//       var circleColor = (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;

//       var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;

//       wids.add(CircleAvatar(
//         radius: _dotRadius,
//         backgroundColor: circleColor,
//         child: Text(
//           _curStep.toString(),
//           style: TextStyle(color: Colors.black),
//         ),
//       ));

//       if (i != _stepsText.length - 1) {
//         wids.add(
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(color: lineColor, borderRadius: BorderRadius.circular(10)),
//               height: lineHeight,
//             ),
//           ),
//         );
//       }
//     });

//     return wids;
//   }

//   Widget build(BuildContext context) {
//     return Container(
//       padding: padding,
//       height: this._height,
//       width: this._width,
//       decoration: this.decoration,
//       child: Column(
//         children: [
//           Row(
//             children: _buildDots(),
//           ),
//         ],
//       ),
//     );
//   }
// }
