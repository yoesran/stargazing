import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stargazing/quiz/quiz.dart';

import 'models/users.dart';
import 'user_services.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Users? users;
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    if (!isLoaded) {
      UserServices.getUser(user!.uid).then((value) {
        users = value;

        isLoaded = true;

        setState(() {});
      });
    }
    return Scaffold(
      backgroundColor: const Color(0xFF312244),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/quiz.png",
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                QuizCard(
                  users: users,
                  level: 1,
                  levelString: "Level 1",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    QuizCard(
                      users: users,
                      level: 2,
                      levelString: "Level 2",
                    ),
                  ],
                ),
                QuizCard(
                  users: users,
                  level: 3,
                  levelString: "Level 3",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  const QuizCard({
    Key? key,
    required this.users,
    required this.levelString,
    required this.level,
  }) : super(key: key);

  final Users? users;
  final String? levelString;
  final int? level;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => Quiz(
              level: level,
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        width: MediaQuery.of(context).size.width / 2 - 40,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFF3C2D4E),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 1),
              blurRadius: 1,
              color: Colors.white.withOpacity(0.5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (users == null)
                      ? Image.asset(
                          "assets/images/blackstar.png",
                          width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                        )
                      : (((level == 1)
                                  ? users!.level1points
                                  : (level == 2)
                                      ? users!.level2points
                                      : users!.level3points) >=
                              4)
                          ? Image.asset(
                              "assets/images/star.png",
                              width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                            )
                          : (((level == 1)
                                      ? users!.level1points
                                      : (level == 2)
                                          ? users!.level2points
                                          : users!.level3points) >=
                                  2)
                              ? Image.asset(
                                  "assets/images/halfstar.png",
                                  width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                )
                              : (((level == 1)
                                          ? users!.level1points
                                          : (level == 2)
                                              ? users!.level2points
                                              : users!.level3points) <
                                      2)
                                  ? Image.asset(
                                      "assets/images/blackstar.png",
                                      width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                    )
                                  : const SizedBox(),
                  (users == null)
                      ? Image.asset(
                          "assets/images/blackstar.png",
                          width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                        )
                      : (((level == 1)
                                  ? users!.level1points
                                  : (level == 2)
                                      ? users!.level2points
                                      : users!.level3points) >=
                              8)
                          ? Image.asset(
                              "assets/images/star.png",
                              width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                            )
                          : (((level == 1)
                                      ? users!.level1points
                                      : (level == 2)
                                          ? users!.level2points
                                          : users!.level3points) >=
                                  6)
                              ? Image.asset(
                                  "assets/images/halfstar.png",
                                  width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                )
                              : (((level == 1)
                                          ? users!.level1points
                                          : (level == 2)
                                              ? users!.level2points
                                              : users!.level3points) <
                                      6)
                                  ? Image.asset(
                                      "assets/images/blackstar.png",
                                      width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                    )
                                  : const SizedBox(),
                  (users == null)
                      ? Image.asset(
                          "assets/images/blackstar.png",
                          width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                        )
                      : (((level == 1)
                                  ? users!.level1points
                                  : (level == 2)
                                      ? users!.level2points
                                      : users!.level3points) >=
                              12)
                          ? Image.asset(
                              "assets/images/star.png",
                              width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                            )
                          : (((level == 1)
                                      ? users!.level1points
                                      : (level == 2)
                                          ? users!.level2points
                                          : users!.level3points) >=
                                  10)
                              ? Image.asset(
                                  "assets/images/halfstar.png",
                                  width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                )
                              : (((level == 1)
                                          ? users!.level1points
                                          : (level == 2)
                                              ? users!.level2points
                                              : users!.level3points) <
                                      10)
                                  ? Image.asset(
                                      "assets/images/blackstar.png",
                                      width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                    )
                                  : const SizedBox(),
                  (users == null)
                      ? Image.asset(
                          "assets/images/blackstar.png",
                          width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                        )
                      : (((level == 1)
                                  ? users!.level1points
                                  : (level == 2)
                                      ? users!.level2points
                                      : users!.level3points) >=
                              16)
                          ? Image.asset(
                              "assets/images/star.png",
                              width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                            )
                          : (((level == 1)
                                      ? users!.level1points
                                      : (level == 2)
                                          ? users!.level2points
                                          : users!.level3points) >=
                                  14)
                              ? Image.asset(
                                  "assets/images/halfstar.png",
                                  width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                )
                              : (((level == 1)
                                          ? users!.level1points
                                          : (level == 2)
                                              ? users!.level2points
                                              : users!.level3points) <
                                      14)
                                  ? Image.asset(
                                      "assets/images/blackstar.png",
                                      width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                    )
                                  : const SizedBox(),
                  (users == null)
                      ? Image.asset(
                          "assets/images/blackstar.png",
                          width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                        )
                      : (((level == 1)
                                  ? users!.level1points
                                  : (level == 2)
                                      ? users!.level2points
                                      : users!.level3points) >=
                              20)
                          ? Image.asset(
                              "assets/images/star.png",
                              width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                            )
                          : (((level == 1)
                                      ? users!.level1points
                                      : (level == 2)
                                          ? users!.level2points
                                          : users!.level3points) >=
                                  18)
                              ? Image.asset(
                                  "assets/images/halfstar.png",
                                  width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                )
                              : (((level == 1)
                                          ? users!.level1points
                                          : (level == 2)
                                              ? users!.level2points
                                              : users!.level3points) <
                                      18)
                                  ? Image.asset(
                                      "assets/images/blackstar.png",
                                      width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                    )
                                  : const SizedBox(),
                ],
              ),
            ),
            Text(
              levelString as String,
              style: const TextStyle(
                fontFamily: "NATS",
                color: Colors.white,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
