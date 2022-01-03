// ignore_for_file: file_names, constant_identifier_names

class Question {
  final int? id;
  final String? question;
  final String? image;
  final int? answer;
  final List<String>? options;

  Question({this.id, this.question, this.image, this.answer, this.options});
}

const List question_data = [
  {
    "id": 1,
    "question": "Komet yang terlihat setiap 75-76 tahun sekali adalah komet",
    "answer": 0,
    "options": [
      'Halley',
      'Encke',
      'Hayakutake',
      'Ikeya-Seki',
    ],
  },
  {
    "id": 2,
    "question": "Berapa jumlah planet yang ada di tata surya kita",
    "answer": 2,
    "options": [
      '7',
      '6',
      '8',
      '9',
    ],
  },
  {
    "id": 3,
    "question": "Apa nama planet di bawah ini",
    "answer": 0,
    "image": "assets/images/saturnquiz.jpg",
    "options": [
      'Saturnus',
      'Uranus',
      'Mars',
      'Neptunus',
    ],
  },
  {
    "id": 4,
    "question": "Apa nama satelit alami dari bumi",
    "answer": 1,
    "options": [
      'Larissa',
      'Bulan',
      'Mars',
      'Prion',
    ],
  },
  {
    "id": 5,
    "question": "Hujan meteor yang terjadi setiap tahun pada bulan oktober ialah",
    "answer": 0,
    "options": [
      'Hujan meteor Orionid',
      'Hujan meteor Perseid',
      'Hujan meteor Geminids',
      'Hujan meteor Quadratid',
    ],
  },
  {
    "id": 6,
    "question": "Unsur apa pembentuk bintang",
    "answer": 0,
    "options": [
      'Hidrogen & helium',
      'CO2 & oksigen',
      'Hidrogen & oksigen',
      'Natrium & klorin',
    ],
  },
  {
    "id": 7,
    "question": "Apa nama planet terpanas di tatasurya kita",
    "answer": 1,
    "options": [
      'Mars',
      'Venus',
      'Merkurius',
      'Uranus',
    ],
  },
  {
    "id": 8,
    "question": "Kapan hujan meteor geminids terjadi",
    "answer": 0,
    "options": [
      'Desember',
      'Januari',
      'Agustus',
      'Oktober',
    ],
  },
  {
    "id": 9,
    "question": "Planet apa yang mempunyai cincin",
    "answer": 2,
    "options": [
      'Bumi',
      'Merkurius',
      'Saturnus',
      'Uranus',
    ],
  },
  {
    "id": 10,
    "question": "Planet yang tidak memiliki satelit adalah",
    "answer": 3,
    "options": [
      'Bumi',
      'Mars',
      'Jupiter',
      'Venus',
    ],
  },
  {
    "id": 11,
    "question": "Planet dinamakan dewi cinta & kecantikan dalam mitologi romawi ialah",
    "answer": 2,
    "options": [
      'Jupiter',
      'Saturnus',
      'Venus',
      'Mars',
    ],
  },
  {
    "id": 12,
    "question": "Kumpulan dari matahari, planet dan benda langit lainnya disebut",
    "answer": 0,
    "options": [
      'Tata Surya',
      'Galaksi',
      'Bimasakti',
      'Satelit',
    ],
  },
  {
    "id": 13,
    "question": "Pusat tata surya adalah",
    "answer": 2,
    "options": [
      'Planet',
      'Bulan',
      'Matahari',
      'Asteroid',
    ],
  },
  {
    "id": 14,
    "question": "Benda langit yang mengeliling matahari adalah",
    "answer": 1,
    "options": [
      'Meteor',
      'Planet',
      'Pelangi',
      'Asteroid',
    ],
  },
  {
    "id": 15,
    "question": "Benda langit yang terlihat berkelip memancarkan cahaya pada malam hari adalah",
    "answer": 2,
    "options": [
      'Planet',
      'Satelit',
      'Bintang',
      'Komet',
    ],
  },
  {
    "id": 16,
    "question": "Phobos dan Deimos adalah satelit yang dimiliki planet",
    "answer": 2,
    "options": [
      'Merkurius',
      'Jupiter',
      'Mars',
      'Saturnus',
    ],
  },
  {
    "id": 17,
    "question": "Berikut ini adalah planet-planet yang termasuk anggota planet dalam adalah",
    "answer": 2,
    "options": [
      'Merkurius, Saturnus dan  Mars',
      'Merkurius, Venus dan Mars',
      'Merkurius, Venus dan Bumi',
      'Merkurus dan Venus',
    ],
  },
  {
    "id": 18,
    "question": "Atmosfer merkurius terdiri dari gas natrium dan kalium sehingga",
    "answer": 1,
    "options": [
      'Banyak hewan hidup di atasnya',
      'Tidak ada makhluk hidup di atasnya',
      'Sedikit tumbuhan yang hidup',
      'Ada banyak jenis hewan luar angkasa',
    ],
  },
  {
    "id": 19,
    "question": "Ganymede, Lo, Europe dan calisto adalah satelit yang dimiliki",
    "answer": 0,
    "options": [
      'Jupiter',
      'Saturnus',
      'Mars',
      'Merkurius',
    ],
  },
  {
    "id": 20,
    "question": "Bumi Mengeliling matahari selama",
    "answer": 0,
    "options": [
      '365 hari',
      '366 hari',
      '377 hari',
      '300 hari',
    ],
  },
  {
    "id": 21,
    "question": "Pada tahun 2006 pluto tidak lagi dimasukan ke dalam kategori planet di tata surya karena",
    "answer": 0,
    "options": [
      'Ukurannya yang terlalu kecil',
      'Tidak memiliki satelit',
      'Tidak memiliki atsmosfer',
      'Tidak mempunyai cahaya',
    ],
  },
  {
    "id": 22,
    "question": "Meteor yang jatuh sampai ke permukaan bumi disebut",
    "answer": 2,
    "options": [
      'Meteoroid',
      'Meteor jatuh',
      'Meteorit',
      'Bintang jatuh',
    ],
  },
  {
    "id": 23,
    "question": "Planet tempat manusia berkembang biak adalah planet",
    "answer": 2,
    "options": [
      'Merkuris',
      'Venus',
      'Bumi',
      'Mars',
    ],
  },
  {
    "id": 24,
    "question": "Cincin yang dimiliki saturnus terdiri dari",
    "answer": 0,
    "options": [
      'Debu halus, kerikil dan butiran es',
      'Besi , perak dan emas',
      'Es , debu kasar dan alumunium',
      'Gas, perak dan kerikil',
    ],
  },
  {
    "id": 25,
    "question": "Satu-satunya planet di tata surya yang dapat dihuni manusia adalah",
    "answer": 2,
    "options": [
      'Merkurius',
      'Venus',
      'Bumi',
      'Mars',
    ],
  },
  {
    "id": 26,
    "question": "Dua satelit saturnus yang terbesar adalah",
    "answer": 1,
    "options": [
      'Ganymede dan Europe',
      'Titan dan Phoebe',
      'Phobos dan Deimos',
      'Bulan dan Komet',
    ],
  },
  {
    "id": 27,
    "question": "Garis edar yang dimiliki setiap planet disebut",
    "answer": 2,
    "options": [
      'Satelit',
      'Planet',
      'Orbit',
      'Meteorit',
    ],
  },
  {
    "id": 28,
    "question": "Planet yang memiliki ukuran paling besar adalah",
    "answer": 3,
    "options": [
      'Mars',
      'Bumi',
      'Saturnus',
      'Jupiter',
    ],
  },
  {
    "id": 29,
    "question": "Merkurius membutuhkan waktu mengeliling matahari sebanyak",
    "answer": 2,
    "options": [
      '100 hari',
      '365 hari',
      '88 hari',
      '99 hari',
    ],
  },
  {
    "id": 30,
    "question": "Benda langit yang mempunyai garis edar antara lintasan mars dan jupiter adalah",
    "answer": 1,
    "options": [
      'Komet',
      'Asteroid',
      'Planet',
      'Satelit',
    ],
  },
];
