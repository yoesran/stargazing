// ignore_for_file: unnecessary_this, prefer_final_fields

import 'package:flutter/widgets.dart';
import 'package:stargazing/models/questions.dart';
import 'package:stargazing/quiz/result.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class QuestionController extends GetxController {
  QuestionController(this.level);

  final int? level;
  PageController? _pageController;
  PageController get pageController => this._pageController as PageController;

  List<Question> _questions = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            image: question['image'],
            options: question['options'],
          ))
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int? _selectedIndex;
  int? get selectedIndex => this._selectedIndex;

  List<int> _answers = [];
  List<int> get answers => this._answers;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _pageController?.dispose();
    super.onClose();
  }

  void checkedAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _selectedIndex = selectedIndex;
    update();
  }

  void nextQuestion() {
    if (_questionNumber.value != 10) {
      _isAnswered = false;
      _answers.add(_selectedIndex!);
      _selectedIndex = null;
      _questionNumber.value++;
      _pageController?.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      _answers.add(_selectedIndex!);
      // _pageController?.dispose();
      Get.offAll(() => Result(
            choices: _answers,
            level: level,
          ));
      Get.delete<QuestionController>();
    }
  }
}
