import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stargazing/home.dart';
import 'package:stargazing/models/users.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stargazing/services/user_services.dart';

class Result extends StatefulWidget {
  const Result({Key? key, this.choices, this.level}) : super(key: key);
  final List<bool>? choices;
  final int? level;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    Users? users;
    int sum = 0;
    for (int i = 0; i < widget.choices!.length; i++) {
      if (widget.level == 1) {
        if (widget.choices![i]) {
          sum += 2;
        }
      } else if (widget.level == 2) {
        if (widget.choices![i]) {
          sum += 2;
        }
      } else if (widget.level == 3) {
        if (widget.choices![i]) {
          sum += 2;
        }
      }
    }

    User? user = Provider.of<User?>(context);
    UserServices.getUser(user!.uid).then(
      (value) {
        users = value;
        if (widget.level == 1) {
          if (sum > users!.level1points) {
            UserServices.updateUser(
                user.uid,
                user.email,
                users!.name,
                users!.noTelp,
                users!.alamat,
                (widget.level == 1) ? sum : users!.level1points,
                (widget.level == 2) ? sum : users!.level2points,
                (widget.level == 3) ? sum : users!.level3points,
                users!.profilePicture);
          }
        } else if (widget.level == 2) {
          if (sum > users!.level2points) {
            UserServices.updateUser(
                user.uid,
                user.email,
                users!.name,
                users!.noTelp,
                users!.alamat,
                (widget.level == 1) ? sum : users!.level1points,
                (widget.level == 2) ? sum : users!.level2points,
                (widget.level == 3) ? sum : users!.level3points,
                users!.profilePicture);
          }
        } else if (widget.level == 3) {
          if (sum > users!.level3points) {
            UserServices.updateUser(
                user.uid,
                user.email,
                users!.name,
                users!.noTelp,
                users!.alamat,
                (widget.level == 1) ? sum : users!.level1points,
                (widget.level == 2) ? sum : users!.level2points,
                (widget.level == 3) ? sum : users!.level3points,
                users!.profilePicture);
          }
        }
      },
    );

    return Scaffold(
      backgroundColor: const Color(0xFF312244),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFF312244),
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Lottie.asset("assets/lotties/sky.json"),
                Align(alignment: Alignment.topRight, child: Lottie.asset("assets/lotties/astronot.json", width: 100)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Lottie.asset("assets/lotties/blob.json", width: MediaQuery.of(context).size.width / 1.5),
                        Lottie.asset("assets/lotties/astronot-bintang.json", width: MediaQuery.of(context).size.width / 1.5)
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(28.0),
                      padding: const EdgeInsets.all(18.0),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3C2D4E),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (sum >= 4)
                                  ? Image.asset(
                                      "assets/images/star.png",
                                      width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                    )
                                  : (sum >= 2)
                                      ? Image.asset(
                                          "assets/images/halfstar.png",
                                          width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                        )
                                      : (sum < 2)
                                          ? Image.asset(
                                              "assets/images/blackstar.png",
                                              width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                            )
                                          : const SizedBox(),
                              (sum >= 8)
                                  ? Image.asset(
                                      "assets/images/star.png",
                                      width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                    )
                                  : (sum >= 6)
                                      ? Image.asset(
                                          "assets/images/halfstar.png",
                                          width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                        )
                                      : (sum < 6)
                                          ? Image.asset(
                                              "assets/images/blackstar.png",
                                              width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                            )
                                          : const SizedBox(),
                              (sum >= 12)
                                  ? Image.asset(
                                      "assets/images/star.png",
                                      width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                    )
                                  : (sum >= 10)
                                      ? Image.asset(
                                          "assets/images/halfstar.png",
                                          width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                        )
                                      : (sum < 10)
                                          ? Image.asset(
                                              "assets/images/blackstar.png",
                                              width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                            )
                                          : const SizedBox(),
                              (sum >= 16)
                                  ? Image.asset(
                                      "assets/images/star.png",
                                      width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                    )
                                  : (sum >= 14)
                                      ? Image.asset(
                                          "assets/images/halfstar.png",
                                          width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                        )
                                      : (sum < 14)
                                          ? Image.asset(
                                              "assets/images/blackstar.png",
                                              width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                            )
                                          : const SizedBox(),
                              (sum >= 20)
                                  ? Image.asset(
                                      "assets/images/star.png",
                                      width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                    )
                                  : (sum >= 18)
                                      ? Image.asset(
                                          "assets/images/halfstar.png",
                                          width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                        )
                                      : (sum < 18)
                                          ? Image.asset(
                                              "assets/images/blackstar.png",
                                              width: (MediaQuery.of(context).size.width / 2 - 75) / 5,
                                            )
                                          : const SizedBox(),
                            ],
                          ),
                          Text(
                            (sum == 20)
                                ? "PERFECT!\n Yeay! Kamu berhasil menjawab semua pertanyaan di level ini dengan benar. Kamu sudah siap untuk lanjut ke level selanjutnya :)"
                                : "Yahhh, jangan putus asa, silahkan lihat kembali materi yang ada, lalu coba kembali kuis ini, semoga berhasil. Ingat, sebelum kamu melanjutkan kuis ke level selanjutnya, anda harus menyelesaikan level ini dulu ya",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 2,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: ElevatedButton(
                          child: const Text(
                            "Ke Halaman Kuis",
                            style: TextStyle(color: Color(0xFF7878AB), fontWeight: FontWeight.w600),
                          ),
                          onPressed: () async {
                            Get.off(
                              () => const Home(
                                index: 1,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              textStyle: const TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
