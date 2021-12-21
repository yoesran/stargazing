import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stargazing/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stargazing/models/users.dart';
import 'package:stargazing/quiz/quiz.dart';
import 'package:get/get.dart';
import 'package:stargazing/controllers/question_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stargazing/user_services.dart';

class Result extends StatelessWidget {
  const Result({Key? key, this.choices, this.level}) : super(key: key);
  final List<int>? choices;
  final int? level;

  @override
  Widget build(BuildContext context) {
    List<int> answers1 = [0, 1, 2, 3, 0, 1, 2, 3, 0, 1];
    List<int> answers2 = [1, 2, 3, 0, 1, 2, 3, 0, 1, 2];
    List<int> answers3 = [2, 3, 0, 1, 2, 3, 0, 1, 2, 3];
    Users? users;
    int sum = 0;
    for (int i = 0; i < choices!.length; i++) {
      if (level == 1) {
        if (answers1[i] == choices![i]) {
          sum += 2;
        }
      } else if (level == 2) {
        if (answers2[i] == choices![i]) {
          sum += 2;
        }
      } else if (level == 3) {
        if (answers3[i] == choices![i]) {
          sum += 2;
        }
      }
    }

    User? user = Provider.of<User?>(context);
    UserServices.getUser(user!.uid).then((value) {
      users = value;
      UserServices.updateUser(user.uid, user.email, users!.name, users!.noTelp, users!.alamat, (level == 1) ? sum : users!.level1points,
              (level == 2) ? sum : users!.level2points, (level == 3) ? sum : users!.level3points, users!.profilePicture)
          .then((value) {
        Get.offAll(() => const Home());
      });
    });
    return Container(
      color: Colors.white,
    );
  }
}
