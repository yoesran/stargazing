import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:stargazing/Screens/komet_screen.dart';
import 'package:stargazing/Screens/meteor_screen.dart';
import 'package:stargazing/Screens/planet_screen.dart';
import 'package:stargazing/Screens/satelit_screen.dart';
import 'package:stargazing/Screens/star_screen.dart';
import 'package:stargazing/sign_in/sign_in_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF312244),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFF312244),
            child: Stack(
              children: [
                Lottie.asset("assets/lotties/roket.json", width: 100),
                Align(alignment: Alignment.centerRight, child: Lottie.asset("assets/lotties/astronot.json", width: 100)),
                Lottie.asset("assets/lotties/sky.json"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Beranda",
                      style: TextStyle(
                        fontFamily: "NATS",
                        color: Colors.white,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: StarScreen(),
                              withNavBar: true,
                              pageTransitionAnimation: PageTransitionAnimation.fade,
                            );
                          },
                          child: Category(
                            lottie: "assets/lotties/star-blast.json",
                            tittle: "Bintang",
                            isRepeat: true,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: PlanetScreen(),
                              withNavBar: true,
                              pageTransitionAnimation: PageTransitionAnimation.fade,
                            );
                          },
                          child: Category(
                            lottie: "assets/lotties/planets.json",
                            tittle: "Planet",
                            isRepeat: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: KometScreen(),
                              withNavBar: true,
                              pageTransitionAnimation: PageTransitionAnimation.fade,
                            );
                          },
                          child: Category(
                            lottie: "assets/lotties/comet.json",
                            tittle: "Komet",
                            isRepeat: false,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: MeteorScreen(),
                              withNavBar: true,
                              pageTransitionAnimation: PageTransitionAnimation.fade,
                            );
                          },
                          child: Category(
                            lottie: "assets/lotties/meteors.json",
                            tittle: "Meteor",
                            isRepeat: false,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: SatelitScreen(),
                          withNavBar: true,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: Category(
                        lottie: "assets/lotties/satellite.json",
                        tittle: "Satelit",
                        isRepeat: true,
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

class Category extends StatelessWidget {
  const Category({Key? key, this.lottie, this.tittle, this.isRepeat}) : super(key: key);

  final String? lottie;
  final String? tittle;
  final bool? isRepeat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
          child: ClipRRect(borderRadius: BorderRadius.circular(30), child: Lottie.asset(lottie!, fit: BoxFit.contain, repeat: isRepeat)),
        ),
        Text(
          tittle!,
          style: const TextStyle(
            fontFamily: "NATS",
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
