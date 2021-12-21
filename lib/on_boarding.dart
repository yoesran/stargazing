import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:stargazing/sign_up/sign_up_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF312244),
      body: Stack(
        children: [
          // Lottie.asset(
          //   "assets/lotties/star-blast.json",
          // ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Lottie.asset(
          //     "assets/lotties/star-blast.json",
          //   ),
          // ),
          Container(
            padding: const EdgeInsets.all(35),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/onboarding.png"),
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Selamat Datang",
                  style: TextStyle(
                    fontFamily: "NATS",
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Flexible(
                  child: Text(
                    "Sudah siap menjelajahi luar angkasa? Di Stargazing kamu akan belajar seputar benda-benda angkasa seperti planet, meteor, satelit, dan masih banyak lagi",
                    style: TextStyle(
                      fontFamily: "NATS",
                      color: Colors.white,
                      fontSize: 20,
                      height: 1.15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: ElevatedButton(
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          Get.to(() => SignUpScreen());
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFAD6C80),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            textStyle: const TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
