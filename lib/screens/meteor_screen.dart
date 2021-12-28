import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:stargazing/content.dart';

class MeteorScreen extends StatefulWidget {
  const MeteorScreen({Key? key}) : super(key: key);

  @override
  _MeteorScreenState createState() => _MeteorScreenState();
}

class _MeteorScreenState extends State<MeteorScreen> {
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
                          "Meteor",
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
                      child: Column(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height + MediaQuery.of(context).size.height / 2,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Card(
                                            context,
                                            "assets/images/meteor/geminids.png",
                                            "Meteor Geminids",
                                            "Hujan meteor geminids ini merupakan jenis hujan meteor yang terjadi disebabkan karna oleh meteor yang berasal dari sebuah asteroid yang disebut dengan sebutan 3200 Phaethon. Dengan melalui pengamatan yang dilakukan itu sejak 1,5 abad yang lalu, hujan meteor jenis ini terjadi pada akhir tahun ialah pada bulan Desember.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                        Card(
                                            context,
                                            "assets/images/meteor/orionid.png",
                                            "Meteor Orionid",
                                            "Hujan meteor orinoid ini adalah sebuah hujan yang terjadi tiap-tiap tahunnya yang biasa itu terjadi pada bulan Oktober. Nama Orionid ini juga diambil dari tempat bercahaya yang menjadi sebuah titik meteor yang melintas berasal yang disebut dengan sebutan konstelasi orion. Proses peristiwa atau kejadian terjadinya hujan meteor orionid tersebut dapat atau bisa terlihat dengan jelas serta biasanya meteor ini berwarna kuning dan juga hijau.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                            context,
                                            "assets/images/meteor/perseid.png",
                                            "Meteor Perseid",
                                            "Hujan meteor perseid. Seperti namanya, hujan meteor ini terjadi di atas rasi bintang perseus serta kemungkinan terjadi pada saat bumi itu melalui aliran meteor yang disebut dengan sebutan awan perseid.Melalui suatu pengamatan yang sudah pernah dilakukan itu sejak 2 abad yang lalu, terjadinya hujan meteor tersebut ialah pada pertengahan Juli hingga Agustus tiap-tiap tahunnya. Meteor Perseid ini akan bisa atau dapat terlihat dengan jelas pada belahan bumi bagian utara pada saat malam hari di musim panas yang mana pada saat itu lagit terlihat cerah.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                        Card(
                                            context,
                                            "assets/images/meteor/quadrantid.png",
                                            "Meteor Quadrantid",
                                            "Hujan meteor quandrantid, ini merupakan sebuah hujan meteor yang asalnya dari konstilasi Bootes. Dengan Melalui pengamatan hujan meteor ini terjadi pada bulan Januari, Namun tetapi pengamatan untuk meteor ini lebih sulit disebabkan karna puncaknya hanya terjadi itu dalam hitungan jam saja.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
