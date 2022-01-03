import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:stargazing/content.dart';

class PlanetScreen extends StatefulWidget {
  const PlanetScreen({Key? key}) : super(key: key);

  @override
  _PlanetScreenState createState() => _PlanetScreenState();
}

class _PlanetScreenState extends State<PlanetScreen> {
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
                          "Planet",
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
                                            "assets/images/planet/mercury.png",
                                            "Merkurius",
                                            "Merkurius (0,4 SA dari Matahari) adalah planet terdekat dari Matahari serta juga terkecil (0,055 massa bumi). Merkurius tidak memiliki satelit alami dan ciri geologisnya di samping kawah meteorid yang diketahui adalah lobed ridges atau rupes, kemungkinan terjadi karena pengerutan pada perioda awal sejarahnya. Atmosfer Merkurius yang hampir bisa diabaikan terdiri dari atom-atom yang terlepas dari permukaannya karena semburan angin surya. Besarnya inti besi dan tipisnya kerak Merkurius masih belum bisa dapat diterangkan. Menurut dugaan hipotesis lapisan luar planet ini terlepas setelah terjadi tabrakan raksasa, dan perkembangan ('akresi') penuhnya terhambat oleh energi awal Matahari.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                        Card(
                                            context,
                                            "assets/images/planet/venus.png",
                                            "Venus",
                                            "Venus (0,7 SA dari Matahari) berukuran mirip bumi (0,815 massa bumi). Dan seperti bumi, planet ini memiliki selimut kulit silikat yang tebal dan berinti besi, atmosfernya juga tebal dan memiliki aktivitas geologi. Akan tetapi planet ini lebih kering dari bumi dan atmosfernya sembilan kali lebih padat dari bumi. Venus tidak memiliki satelit. Venus adalah planet terpanas dengan suhu permukaan mencapai 400 °C, kemungkinan besar disebabkan jumlah gas rumah kaca yang terkandung di dalam atmosfer. Sejauh ini aktivitas geologis Venus belum dideteksi, tetapi karena planet ini tidak memiliki medan magnet yang bisa mencegah habisnya atmosfer, diduga sumber atmosfer Venus berasal dari gunung berapi.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                            context,
                                            "assets/images/planet/bumi.png",
                                            "Bumi",
                                            "Bumi (1 SA dari Matahari) adalah planet bagian dalam yang terbesar dan terpadat, satu-satunya yang diketahui memiliki aktivitas geologi dan satu-satunya planet yang diketahui memiliki mahluk hidup. 70% bagian bumi ditutup oleh air sedangkan 30%bumi ditutupi oleh daratan. Hidrosfernya yang cair adalah khas di antara planet-planet kebumian dan juga merupakan satu-satunya planet yang diamati memiliki lempeng tektonik. Atmosfer bumi sangat berbeda dibandingkan planet-planet lainnya, karena dipengaruhi oleh keberadaan mahluk hidup yang menghasilkan 21% oksigen. Bumi memiliki satu satelit, bulan, satu-satunya satelit besar dari planet kebumian di dalam Tata Surya.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                        Card(
                                            context,
                                            "assets/images/planet/mars.png",
                                            "Mars",
                                            "Mars (1,5 SA dari Matahari) berukuran lebih kecil dari bumi dan Venus (0,107 massa bumi). Planet ini memiliki atmosfer tipis yang kandungan utamanya adalah karbon dioksida. Permukaan Mars yang dipenuhi gunung berapi raksasa seperti Olympus Mons dan lembah retakan seperti Valles marineris, menunjukan aktivitas geologis yang terus terjadi sampai baru belakangan ini. Warna merahnya berasal dari warna karat tanahnya yang kaya besi. Mars mempunyai dua satelit alami kecil (Deimos dan Fobos) yang diduga merupakan asteroid yang terjebak gravitasi Mars.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                            context,
                                            "assets/images/planet/jupiter.png",
                                            "Jupiter",
                                            "Jupiter (5,2 SA), dengan 318 kali massa bumi, adalah 2,5 kali massa dari gabungan seluruh planet lainnya. Kandungan utamanya adalah hidrogen dan helium. Sumber panas di dalam Jupiter menyebabkan timbulnya beberapa ciri semi-permanen pada atmosfernya, sebagai contoh pita pita awan dan Bintik Merah Raksasa. Sejauh yang diketahui Jupiter memiliki 63 satelit. Empat yang terbesar, Ganimede, Kalisto, Io, dan Europa menampakan kemiripan dengan planet kebumian, seperti gunung berapi dan inti yang panas. Ganimede, yang merupakan satelit terbesar di Tata Surya, berukuran lebih besar dari Merkurius.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                        Card(
                                            context,
                                            "assets/images/planet/saturn.png",
                                            "Saturnus",
                                            "Saturnus (9,5 SA) yang dikenal dengan sistem cincinnya, memiliki beberapa kesamaan dengan Jupiter, sebagai contoh komposisi atmosfernya. Meskipun Saturnus sebesar 60% volume Jupiter, planet ini hanya memiliki massa kurang dari sepertiga Jupiter atau 95 kali massa bumi, membuat planet ini sebuah planet yang paling tidak padat di Tata Surya. Saturnus memiliki 60 satelit yang diketahui sejauh ini (dan 3 yang belum dipastikan) dua di antaranya Titan dan Enceladus, menunjukan aktivitas geologis, meski hampir terdiri hanya dari es saja. Titan berukuran lebih besar dari Merkurius dan merupakan satu-satunya satelit di Tata Surya yang memiliki atmosfer yang cukup berarti.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                            context,
                                            "assets/images/planet/uranus.png",
                                            "Uranus",
                                            "Uranus (19,6 SA) yang memiliki 14 kali massa bumi, adalah planet yang paling ringan di antara planet-planet luar. Planet ini memiliki kelainan ciri orbit. Uranus mengedari Matahari dengan bujkuran poros 90 derajat pada ekliptika. Planet ini memiliki inti yang sangat dingin dibandingkan gas raksasa lainnya dan hanya sedikit memancarkan energi panas. Uranus memiliki 27 satelit yang diketahui, yang terbesar adalah Titania, Oberon, Umbriel, Ariel dan Miranda.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                        Card(
                                            context,
                                            "assets/images/planet/neptune.png",
                                            "Neptunus",
                                            "Neptunus (30 SA) meskipun sedikit lebih kecil dari Uranus, memiliki 17 kali massa bumi, sehingga membuatnya lebih padat. Planet ini memancarkan panas dari dalam tetapi tidak sebanyak Jupiter atau Saturnus. Neptunus memiliki 13 satelit yang diketahui. Yang terbesar, Triton, geologinya aktif, dan memiliki geyser nitrogen cair. Triton adalah satu-satunya satelit besar yang orbitnya terbalik arah (retrograde). Neptunus juga didampingi beberapa planet minor pada orbitnya, yang disebut Trojan Neptunus. Benda-benda ini memiliki resonansi 1:1 dengan Neptunus.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
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
