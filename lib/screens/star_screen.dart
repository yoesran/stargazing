import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:stargazing/content.dart';

class StarScreen extends StatefulWidget {
  const StarScreen({Key? key}) : super(key: key);

  @override
  _StarScreenState createState() => _StarScreenState();
}

class _StarScreenState extends State<StarScreen> {
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
                          "Bintang",
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
                                      child: Text("Berdasarkan Ukuran", style: TextStyle(fontSize: 13)),
                                    ),
                                  ),
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Berdasarkan Temperatur", style: TextStyle(fontSize: 13)),
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
                                      height: MediaQuery.of(context).size.height + MediaQuery.of(context).size.height / 5,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Card(
                                                  context,
                                                  "assets/images/bintang/raksasa.png",
                                                  "Bintang Raksasa",
                                                  "Bintang raksasa adalah bintang dengan jari jari dan luminositas yang jauh lebih besar daripada bintang deret utama (atau katai) pada suhu permukaan yang sama. Mereka terletak di atas urutan utama (kelas luminositas V dalam klasifikasi spektrum Yerkes) pada diagram Hertzsprung-Russell dan sesuai dengan kelas luminositas II dan III. Istilah raksasa dan katai diciptakan oleh Ejnar Hertzsprung pada tahun 1905 untuk bintang-bintang dengan luminositas yang sangat berbeda meskipun suhu atau tipe spektrum serupa. Bintang raksasa memiliki radius beberapa ratus kali Matahari dan luminositas antara 10 hingga beberapa ribu kali Matahari. Namun, Ada pula bintang Kelas Spektrum yang lebih cemerlang dari raksasa yang disebut sebagai super raksasa dan Hiper raksasa. Bintang deret utama dengan suhu sangat panas dan sangat bercahaya juga dapat disebut sebagai raksasa, tetapi hampir semua bintang deret utama lebih tepatnya disebut Katai, tidak peduli seberapa besar radius dan Lumunositasnya",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                              Card(
                                                  context,
                                                  "assets/images/bintang/superraksasa.png",
                                                  "Bintang Super Raksasa",
                                                  "Super raksasa atau Maharaksasa adalah bintang yang sangat masif di luar sana, berkisar antara 10 hingga 70 massa matahari, dan berdiameter lebih dari 100 kali dan dapat berkisar dari 30.000 hingga ratusan ribu kali lipat radiasi matahari. Mereka menempati wilayah teratas dari diagram Hertzsprung-Russel. Super raksasa memiliki magnitudo visual absolut antara -3 hingga -8. Mereka sangat bervariasi dalam hal radius , biasanya dari 30 hingga 500, atau bahkan lebih dari 1000 jari-jari Matahari. Mereka biasanya diamati dalam struktur kosmik muda seperti gugus terbuka, dengan galaksi spiral, dan galaksi tidak teratur. Juga tidak seperti bintang bermassa rendah super raksasa cukup besar untuk meleburkan unsur yang lebih berat dari helium, dan karenanya mereka tidak membubarkan atmosfer mereka sebagai nebula planet, sebaliknya, mereka terus membakar elemen yang lebih berat di inti mereka runtuh. Dengan demikian, mereka tidak bisa kehilangan cukup massa untuk mencapai katai putih, karena itu, mereka akan meninggalkan bintang neutron atau sisa lubang hitam, biasanya setelah ledakan supernova inti-runtuh. Mereka memiliki rentang hidup yang sangat singkat, hidup dari 30 juta hingga hanya beberapa ratus ribu tahun. Super raksasa tampaknya selalu meledak sebagai Supernova Tipe II di akhir kehidupan mereka, dan selalu menghasilkan GRB jangka panjang.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Card(
                                                  context,
                                                  "assets/images/bintang/katai.png",
                                                  "Bintang Katai",
                                                  "Istilah bintang katai sendiri umumnya merujuk pada bintang-bintang deret utama Diagram Hertzsprung-Russel, dengan kelas luminositas V. Istilah ini diperkenalkan oleh Eijnar Hertzsprung untuk membedakannya dengan kelompok populasi bintang berluminositas lebih besar yang disebut sebagai bintang raksasa",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                              Card(
                                                  context,
                                                  "assets/images/bintang/neutron.png",
                                                  "Bintang Neutron",
                                                  "Bintang neutron adalah inti Bintang yang telah runtuh dari bintang super raksasa masif, yang memiliki massa total antara 10 hingga 25 massa matahari, namun massanya bisa lebih jika bintang tersebut Kaya logam. Bintang neutron adalah objek bintang terkecil dan terpadat di Alam Semesta, tidak termasuk lubang hitam, lubang putih hipotetis, bintang quark, dan Strange star. Bintang neutron memiliki radius sekitar 10 kilometer (6,2 mil) dan bermassa sekitar 1,4 massa matahari. Mereka dihasilkan dari ledakan supernova dari bintang masif, dikombinasikan dengan keruntuhan gravitasi, yang memampatkan inti melewati kerapatan bintang katai putih ke inti atom.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Card(
                                                  context,
                                                  "assets/images/bintang/pulsar.png",
                                                  "Bintang Pulsar",
                                                  "Pulsar (lakuran dari Pulsating Radio Sources) adalah bintang neutron yang berotasi dengan cepat, yang merupakan sisa yang tertinggal dari kematian sebuah bintang masif. para astronom telah mengkatalogkan sekitar 1.800 pulsar. Kebanyakan diataranya memancarkan denyut dalam gelombang radio namun ada juga yang melepaskan energi dalam bentuk lain seperti cahaya kasatmata dan sinar-x. Pulsar bisa menangkap elektron yang terlepas ketika inti bintang runtuh. Elektron menghasilkan gelombang radio yang tersalur keluar oleh medan magnet bintang menjadi pancaran radiasi.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                              Card(
                                                  context,
                                                  "assets/images/bintang/magnetar.png",
                                                  "Bintang Magnetar",
                                                  "Magnetar adalah sebuah tipe bintang neutron dengan medan magnet yang sangat kuat (∼109 sampai 1011 T, ∼1013 sampai 1015 G). Peluruhan medan magnet mempengaruhi emisi energi-tinggi radiasi elektromagnetik, terutama sinar-X dan sinar gamma. Teori tentang objek ini diusulkan oleh Robert Duncan dan Christopher Thompson pada tahun 1992, tetapi semburan sinar gamma yang pertama kali tercatat berasal dari sebuah magnetar telah terdeteksi pada 5 Maret 1979. Selama dekade berikutnya, hipotesis magnetar diterima secara luas sebagai penjelasan yang mungkin untuk pengulangan gamma lembut (SGRs) dan anomali pulsar sinar-X (AXPs).",
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
                                      height: MediaQuery.of(context).size.height + MediaQuery.of(context).size.height / 2,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Card(
                                                  context,
                                                  "assets/images/bintang/tipeo.png",
                                                  "Bintang Tipe O",
                                                  "Bintang O, atau Bintang tipe O atau Bintang kelas O, adalah bintang biru masif bercahaya tipe spektrum O. Bintang O memiliki suhu permukaan 30.000 °C - 50.000 °C dan massa 10 - 100 kali masssa matahari. Spektrumnya didominasi oleh garis emisi helium terionisasi tunggal (garis-garis ini membentuk apa yang disebut sebagai deret Pickering), dan merupakan garis spektrum terlemah dari bintang tipe lainnya. Sebagian besar garis lain berasal dari setidaknya unsur terionisasi ganda, meskipun garis H dan He I juga ada.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                              Card(
                                                  context,
                                                  "assets/images/bintang/tipeb.png",
                                                  "Bintang Tipe B",
                                                  "Bintang deret utama tipe B (B V) adalah sebuah bintang deret utama (pembakaran hidrogen) dengan spektrum tipe B dan kelas luminositas V. Bintang-bintang tersebut memiliki 2 hingga 16 kali massa Matahari dan suhu permukaan antara 10.000 dan 30.000 K.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Card(
                                                  context,
                                                  "assets/images/bintang/tipea.png",
                                                  "Bintang Tipe A",
                                                  "Bintang deret utama tipe A (A V) atau bintang katai A adalah sebuah bintang deret utama (pembakaran hidrogen) bertipe spektrum A dan kelas luminositas V. Bintang-bintang tersebut memiliki spektrum yang ditentukan oleh garis absorpsi hidrogen Balmer.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                              Card(
                                                  context,
                                                  "assets/images/bintang/tipef.png",
                                                  "Bintang Tipe F",
                                                  "Bintang deret utama tipe F (F V) adalah sebuah bintang kompak deret utama dengan hidroden lebur berjenis spektrum F dan kelas luminositas V. Bintang-bintang tersebut memiliki 1,0 sampai 1,4 kali massa Matahari dan suhu permukaan antara 6.000 dan 7.600 K.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Card(
                                                  context,
                                                  "assets/images/bintang/tipeg.png",
                                                  "Bintang Tipe G",
                                                  "Bintang deret utama tipe-G (tipe spektrum: GV), sering disebut Katai Kuning, atau bintang katai G, adalah bintang deret utama (luminositas kelas V) dari tipe spektrum G. bintang tersebut memiliki massa 0,84-1,15 matahari dan suhu permukaan berkisar 5.300 hingga 6.000 K. Seperti bintang deret utama lainnya, bintang deret utama tipe G meleburkan unsur hidrogen menjadi helium di intinya melalui fusi nuklir. Matahari, bintang yang mengikat gravitasi Bumi di Tata Surya, adalah contoh bintang deret utama tipe-G (tipe G2V). Setiap detik, Matahari menggabungkan sekitar 600 juta ton hidrogen menjadi helium dalam proses yang dikenal sebagai rantai proton-proton (4 hidrogen membentuk 1 helium), proses yang mengubah sekitar 4 juta ton materi menjadi energi. Selain Matahari, contoh terkenal lainnya dari bintang deret utama tipe-G adalah Alpha Centauri A, Tau Ceti, dan 51 Pegasi.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                              Card(
                                                  context,
                                                  "assets/images/bintang/tipek.png",
                                                  "Bintang Tipe K",
                                                  "Katai oranye atau bintang K V adalah bintang deret utama dengan kelas spektrum K dan kelas kilauan V. Mereka memiliki massa 0.5 hingga 0.8 kali massa matahari dan suhu permukaan sekitar 3.900 hingga 5.200 K. Contoh katai oranye meliputi Alpha Centauri B dan Epsilon Indi. Bintang ini menarik pencarian kehidupan ekstraterestrial karena kestabilan katai oranye, sehingga dapat menciptakan kesempatan kehidupan berevolusi pada planet terestrial yang mengorbit katai oranye.",
                                                  MediaQuery.of(context).size.width / 2 - 40,
                                                  MediaQuery.of(context).size.height / 5),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Card(
                                                  context,
                                                  "assets/images/bintang/tipem.png",
                                                  "Bintang Tipe M",
                                                  "Bintang kelas M adalah bintang dengan populasi paling banyak. Bintang ini berwarna merah dengan temperatur permukaan lebih rendah daripada 3500 Kelvin. Semua katai merah adalah bintang kelas ini. Proxima Centauri adalah salah satu contoh bintang deret utama kelas M. Kebanyakan bintang yang berada dalam fase raksasa dan maharaksasa, seperti Antares dan Betelgeuse merupakan kelas ini. Garis-garis serapan di dalam spektrum bintang kelas M terutama berasal dari logam netral. Garis-garis Balmer hampir tidak tampak. Garis-garis molekul Titanium Oksida (TiO) sangat jelas terlihat. Bintang kelas M adalah sekitar 78% dari seluruh populasi bintang deret utama.",
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
