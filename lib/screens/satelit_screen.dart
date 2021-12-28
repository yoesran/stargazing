import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:stargazing/content.dart';

class SatelitScreen extends StatefulWidget {
  const SatelitScreen({Key? key}) : super(key: key);

  @override
  _SatelitScreenState createState() => _SatelitScreenState();
}

class _SatelitScreenState extends State<SatelitScreen> {
  String lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
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
                Align(alignment: Alignment.centerRight, child: Lottie.asset("assets/lotties/astronot.json", width: 100)),
                Lottie.asset("assets/lotties/sky.json"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(),
                        const Text(
                          "Satelit",
                          style: TextStyle(fontFamily: "NATS", color: Colors.white, fontSize: 28, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(),
                        const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height + MediaQuery.of(context).size.height / 5,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Card(context, "assets/images/bintang/raksasa.png", "Bintang Raksasa", lorem,
                                              MediaQuery.of(context).size.width / 2 - 40, MediaQuery.of(context).size.height / 5),
                                          Card(context, "assets/images/bintang/superraksasa.png", "Bintang Super Raksasa", lorem,
                                              MediaQuery.of(context).size.width / 2 - 40, MediaQuery.of(context).size.height / 5),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Card(context, "assets/images/bintang/katai.png", "Bintang Katai", lorem,
                                              MediaQuery.of(context).size.width / 2 - 40, MediaQuery.of(context).size.height / 5),
                                          Card(context, "assets/images/bintang/neutron.png", "Bintang Neutron", lorem,
                                              MediaQuery.of(context).size.width / 2 - 40, MediaQuery.of(context).size.height / 5),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Card(context, "assets/images/bintang/pulsar.png", "Bintang Pulsar", lorem,
                                              MediaQuery.of(context).size.width / 2 - 40, MediaQuery.of(context).size.height / 5),
                                          Card(context, "assets/images/bintang/magnetar.png", "Bintang Magnetar", lorem,
                                              MediaQuery.of(context).size.width / 2 - 40, MediaQuery.of(context).size.height / 5),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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

  GestureDetector Card(BuildContext context, String image, String title, String content, double width, double height) {
    return GestureDetector(
      onTap: () {
        pushNewScreen(
          context,
          screen: Content(
            image: image,
            title: title,
            content: content,
          ),
          pageTransitionAnimation: PageTransitionAnimation.fade,
        );
      },
      child: Category(
        image: image,
        title: title,
        widthSize: width,
        heightSize: height,
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({Key? key, this.image, this.title, this.widthSize, this.heightSize}) : super(key: key);

  final String? image;
  final String? title;
  final double? widthSize;
  final double? heightSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          width: widthSize,
          height: heightSize,
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
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                image!,
                fit: BoxFit.cover,
              )),
        ),
        Text(
          title!,
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