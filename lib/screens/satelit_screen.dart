import 'package:flutter/material.dart';
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
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TabBar(
                                unselectedLabelColor: Colors.white,
                                enableFeedback: false,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicator: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white.withOpacity(0.25)),
                                tabs: const [
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Alam", style: TextStyle(fontSize: 13)),
                                    ),
                                  ),
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Buatan", style: TextStyle(fontSize: 13)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: TabBarView(
                                children: [
                                  SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Card(
                                                  context,
                                                  "assets/images/satelit/moon.png",
                                                  "Bulan",
                                                  "Bulan adalah satelit alami Bumi satu-satunya dan merupakan satelit terbesar kelima dalam Tata Surya. Bulan juga merupakan satelit alami terbesar di Tata Surya menurut ukuran planet yang diorbitnya, dengan diameter 27%, kepadatan 60%, dan massa ​1⁄81 (1.23%) dari Bumi. Di antara satelit alami lainnya, Bulan adalah satelit terpadat kedua setelah Io, satelit Jupiter.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                              Card(
                                                  context,
                                                  "assets/images/satelit/titan.png",
                                                  "Titan",
                                                  "Titan (atau Saturnus VI) adalah satelit alami elipsoidal keenam sekaligus terbesar dari Saturnus. Satelit ini merupakan satu-satunya satelit alami yang memiliki atmosfer padat, dan satu-satunya objek selain Bumi yang terbukti memiliki cairan di permukaan.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Card(
                                                  context,
                                                  "assets/images/satelit/ganymede.png",
                                                  "Ganymede",
                                                  "Ganimede adalah satelit alami planet Jupiter dan merupakan satelit alami terbesar di Tata Surya. Ganimede adalah satelit terbesar ketujuh di Tata Surya dan satelit Galileo ketiga dari Jupiter. Satelit ini mengitari planetnya selama tujuh hari. Ganimede turut serta dalam resonansi orbit 1:2:4 dengan satelit Europa dan Io. Satelit ini lebih besar diameternya dibanding planet Merkurius, namun massanya hanya sekitar setengahnya.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Card(
                                                  context,
                                                  "assets/images/satelit/nimbus.png",
                                                  "Nimbus",
                                                  "Satelit Nimbus adalah pesawat ruang angkasa robot generasi kedua US yang digunakan untuk penelitian meteorologi dan pengembangan. Pesawat ruang angkasa yang dirancang untuk melayani sebagai stabil, platform Bumi berorientasi untuk pengujian sistem canggih untuk merasakan dan mengumpulkan data sains atmosfer. Tujuh Nimbus pesawat ruang angkasa telah diluncurkan ke dekat-polar, orbit matahari-sinkron dimulai dengan Nimbus 1 pada tanggal 28 Agustus 1964 Di papan satelit Nimbus berbagai instrumentasi untuk pencitraan, terdengar, dan penelitian lain di daerah spektral yang berbeda. Nimbus satelit diluncurkan kapal roket Thor-Agena (Nimbus 1-4) dan Delta roket (Nimbus 5-7).",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                              Card(
                                                  context,
                                                  "assets/images/satelit/vanguard.png",
                                                  "Vanguard 1",
                                                  "Proyek Vanguard adalah sebuah program yang dikelola oleh United States Naval Research Laboratory (NRL), yang dimaksudkan untuk meluncurkan satelit buatan pertama ke orbit Bumi dengan menggunakan roket Vanguard sebagai kendaraan peluncuran dari Cape Canaveral Missile Annex, Florida.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Card(
                                                  context,
                                                  "assets/images/satelit/noaa19.png",
                                                  "NOAA-19",
                                                  "NOAA-19, yang ditunjuk NOAA-N '(NOAA-N Prime) sebelum diluncurkan, adalah serangkaian satelit cuaca yang terakhir dari Amerika Serikat National Oceanic and Atmospheric Administration POES (yang dijadwalkan akan digantikan oleh berikutnya-seri NPOESS generasi sebelum proyek NPOESS dibatalkan). NOAA-19 diluncurkan pada 6 Februari 2009.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
