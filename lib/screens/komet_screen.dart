import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:stargazing/content.dart';

class KometScreen extends StatefulWidget {
  const KometScreen({Key? key}) : super(key: key);

  @override
  _KometScreenState createState() => _KometScreenState();
}

class _KometScreenState extends State<KometScreen> {
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
                          "Komet",
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
                                            "assets/images/komet/encke.png",
                                            "Komet Encke",
                                            "Komet Encke (secara resmi dinamai 2P/Encke) adalah sebuah komet periodik dengan periode 3,3 tahun, dinamai menurut Johan Franz Encke, yang melalui studi kerasnya pada orbit komet tersebut dan melalui banyak perhitungan dapat menghubungkan pengamatan terdahulu pada 1786 (2P/1786 B1), 1795 (2P/1795 V1), 1805 (2P/1805 U1) dan 1818 (2P/1818 W1) pada satu obyek yang sama. Pada 1819 ia menerbitkan kesimpulannya pada jurnalCorrespondance astronomique, dan memprediksi dengan tepat kemunculan sang komet pada 1822 (2P/1822 L1). Dari penyebutan nama resminnya, dapat diketahui bahwa Encke adalah komet periodik kedua yang ditemukan setelah Komet Halley (yang dikenal juga sebagai 1P/Halley). Tidak seperti biasanya, komet Encke dinamai berdasarkan orang yang berhasil menghitung orbitnya dan bukan yang menemukannya.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                        Card(
                                            context,
                                            "assets/images/komet/halebopp.png",
                                            "Komet Hale-Bopp",
                                            "Komet Hale-Bopp ditemukan pada tanggal 23 Juli tahun 1955 pada jarak yang cukup jauh dari matahari. Komet Hale-Bopp atau disebut juga komet C/1995 O1 adalah salah satu komet yang masih diperdebatkan di abad ke dua puluh ini. Hale Bopp merupakan salah satu komet terterang atau tercerah yang dapat terlihat selama beberapa dekade ini. Komet ini dapat terlihat oleh mata telanjang selama 18 bulan. Dua kali lipat komet 1811.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                            context,
                                            "assets/images/komet/halley.png",
                                            "Komet Halley",
                                            "Komet Halley adalah suatu komet yang terlihat dari bumi setiap 75-76 tahun. Secara resmi diberi nama 1P/Halley, nama umumnya diberikan menurut nama Edmund Halley. Komet ini merupakan komet paling terkenal di antara komet-komet periodik lainnya. Walaupun pada setiap abad banyak komet berperiode panjang yang muncul dengan lebih terang dan dahsyat, Halley adalah satu-satunya komet dengan periode pendek yang tampak dengan mata telanjang, dan karenanya merupakan komet yang tampak dengan mata telanjang yang pasti kembali dalam rentang umur manusia. Kemunculannya sepanjang sejarah memiliki pengaruh yang besar terhadap sejarah manusia, walaupun penampakannya tidak dikenali sebagai obyek yang sama sampai abad ke-17. Komet Halley terakhir muncul di tata surya pada tahun 1986, dan akan muncul kembali pada pertengahan 2061.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                        Card(
                                            context,
                                            "assets/images/komet/hyakutake.png",
                                            "Komet Hyakutake",
                                            "Komet Hyakutake (kode resmi: C/1996 B2) adalah sebuah komet yang ditemukan pada 30 Januari 1996 oleh seorang pengamat astronomi amatir asal Jepang, Yuji Hyakutake. Komet ini melintasi bumi dalam jarak yang sangat dekat pada Maret tahun tersebut (paling dekat pada 25 Maret), salah satu lintasan komet yang terdekat dalam 200 tahun, sehingga tampak terang dan dapat dilihat oleh banyak orang di sepanjang dunia.. Selain itu, Hyakutake adalah komet dengan ekor terpanjang yang diketahui hingga kini. Hyakutake adalah sebuah komet periode panjang. Sebelum perjalanannya melewati tata surya, periode orbitnya mencapai sekitar 15.000 tahun, namun pengaruh gravitasi dari planet-planet raksasa (atau “raksasa gas,” yang terdiri dari Jupiter, Saturnus,  Uranus, dan Neptunus) telah meningkatkannya hingga 72.000 tahun.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                            context,
                                            "assets/images/komet/ikeyaseki.png",
                                            "Komet Ikeya-Seki",
                                            "Komet Ikeya-Seki, secara resmi ditunjuk C/1965 S1, 1965 VIII, dan 1965f, adalah komet ditemukan secara independen oleh Kaoru Ikeya danTsutomu Seki . Pertama diamati sebagai objek teleskopik samar pada tanggal 18 September 1965,, perhitungan pertama orbitnya menyarankan agar pada tanggal 21 Oktober itu akan berlalu hanya 450.000 km di atas Ming permukaan ', dan mungkin akan menjadi sangat terang.Komet dapat menentang semua prediksi, tapi Ikeya-Seki dilakukan seperti yang diharapkan. Saat mendekati perihelion pengamat melaporkan bahwa itu jelas terlihat di langit siang hari di samping Matahari. Di Jepang , di mana mencapai perihelion pada tengah hari setempat, terlihat bersinar padabesarnya -10. Hal ini terbukti menjadi salah satu komet paling terang terlihat di tahun-tahun terakhir ribu, dan kadang-kadang dikenal sebagaiKomet Besar tahun 1965.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                        Card(
                                            context,
                                            "assets/images/komet/kohoutek.png",
                                            "Komet Kohoutek",
                                            "Comet Kohoutek, secara resmi ditunjuk E1 C/1973, 1973 XII, dan 1973f, pertama kali terlihat pada tanggal 7 Maret 1973 oleh Ceko astronom Luboš Kohoutek. Ini dicapai perihelion pada tanggal 28 Desember tahun yang sama. Komet Kohoutek adalah komet periode panjang ; penampakan sebelumnya adalah sekitar 150.000 tahun yang lalu, dan penampakan berikutnya akan berada di sekitar 75.000 tahun. Pada kemunculannya pada tahun 1973 itu memiliki lintasan hiperbolik ( e > 1) karena gangguan gravitasi dari planet raksasa . Sebelum pendekatan dekatnya, Kohoutek adalah hyped oleh media sebagai komet 'abad'. Namun, yang menampilkan Kohoutek dianggap sebagai-dikecewakan, mengakibatkan beberapa untuk nama panggilan itu 'Comet Watergate'. Namun, meskipun gagal untuk mencerahkan ke tingkat yang diharapkan, itu masih merupakan objek mata telanjang.",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                            context,
                                            "assets/images/komet/shoemakerlevy.png",
                                            "Komet Shoemaker-levy",
                                            "Komet Shoemaker-Levy 9 (SL9, secara resmi disebut D/1993 F2) adalah komet yang bertabrakan dengan planet Yupiter tahun 1994.[1]Komet ini diulas pada media-media populer, dan komet SL9 diamati oleh astronom di seluruh dunia",
                                            MediaQuery.of(context).size.width / 2 - 40,
                                            MediaQuery.of(context).size.height / 5),
                                        Card(
                                            context,
                                            "assets/images/komet/west.png",
                                            "Komet West",
                                            "Komet West ditemukan fotografis oleh Richard M. Barat , dari Observatorium Eropa Selatan , pada tanggal 10 Agustus 1975, dan mencapai puncak kecerahan pada Maret 1976 mencapai suatu kecerahan dari -3 pada perihelion. Selama puncak kecerahan, pengamat melaporkan bahwa cukup cerdas untuk belajar di siang hari penuh. Meskipun penampilan spektakuler, Comet Barat sebagian besar dilaporkan di media populer. Hal ini sebagian disebabkan oleh mengecewakan menampilkan relatif dari Comet Kohoutek pada tahun 1973, yang telah secara luas diperkirakan akan menjadi sangat terkemuka: ilmuwan mewaspadai membuat prediksi yang mungkin meningkatkan ekspektasi masyarakat. komet yang memiliki periode orbit diperkirakan 558.000 tahun .",
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
