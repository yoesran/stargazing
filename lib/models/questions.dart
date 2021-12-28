// ignore_for_file: file_names, constant_identifier_names

class Question {
  final int? id;
  final String? question;
  final String? image;
  final List<String>? options;

  Question({this.id, this.question, this.image, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Apa nama planet dibawah ini?",
    "image": "assets/images/saturnquiz.jpg",
    "options": [
      'Jupiter',
      'Saturnus',
      'Uranus',
      'Neptunus',
    ],
  },
  {
    "id": 2,
    "question": "Berikut yang merupakan satelit alami bumi ialah?",
    "options": [
      'Larrisa',
      'Proteus',
      'Bulan',
      'Prion',
    ],
  },
  {
    "id": 3,
    "question": "Ada berapa banyak planet yang ada di tatasurya kita (milkyway/bimasakti)?",
    "options": [
      '5',
      '9',
      '7',
      '8',
    ],
  },
  {
    "id": 4,
    "question": "Berapa tahun sekali komet Halley dapat terlihat dari bumi?",
    "options": [
      '75',
      '50',
      '100',
      '61',
    ],
  },
  {
    "id": 5,
    "question": "Apa unsur utama pembentuk bintang?",
    "options": [
      'Carbon & oksigen',
      'Hidrogen & helium',
      'Hidrogen & oksigen',
      'Helium & oksigen',
    ],
  },
  {
    "id": 6,
    "question": "Bentuk bintang sebenarnya ialah?",
    "options": [
      'Bulat',
      'Segitiga',
      'Segilima',
      'Persegi',
    ],
  },
  {
    "id": 7,
    "question": "Satelit alami yang bernama Larissa adalah satelit dari planet?",
    "options": [
      'Merkurius',
      'Uranus',
      'Jupiter',
      'Neptunus',
    ],
  },
  {
    "id": 8,
    "question": "Planet yang mempunyai cincin selain saturnus ialah?",
    "options": [
      'Jupiter',
      'Saturnus',
      'Uranus',
      'Neptunus',
    ],
  },
  {
    "id": 9,
    "question": "Siapa yang menemukan komet West?",
    "options": [
      'Luboš Kohoutek',
      'Yuji H.',
      'Richard M.B.',
      'Richard M.B.',
    ],
  },
  {
    "id": 10,
    "question": "Apa nama satelit buatan yang pertama kali diluncurkan ke luar amgkasa?",
    "options": [
      'Palapa',
      'Orion',
      'SEASAT',
      'Sputnik 1',
    ],
  },
  {
    "id": 1,
    "question": "Apa nama planet dibawah ini?",
    "image": "assets/images/saturnquiz.jpg",
    "options": [
      'Jupiter',
      'Saturnus',
      'Uranus',
      'Neptunus',
    ],
  },
  {
    "id": 2,
    "question": "Berikut yang merupakan satelit alami bumi ialah?",
    "options": [
      'Larrisa',
      'Proteus',
      'Bulan',
      'Prion',
    ],
  },
  {
    "id": 3,
    "question": "Ada berapa banyak planet yang ada di tatasurya kita (milkyway/bimasakti)?",
    "options": [
      '5',
      '9',
      '7',
      '8',
    ],
  },
  {
    "id": 4,
    "question": "Berapa tahun sekali komet Halley dapat terlihat dari bumi?",
    "options": [
      '75',
      '50',
      '100',
      '61',
    ],
  },
  {
    "id": 5,
    "question": "Apa unsur utama pembentuk bintang?",
    "options": [
      'Carbon & oksigen',
      'Hidrogen & helium',
      'Hidrogen & oksigen',
      'Helium & oksigen',
    ],
  },
  {
    "id": 6,
    "question": "Bentuk bintang sebenarnya ialah?",
    "options": [
      'Bulat',
      'Segitiga',
      'Segilima',
      'Persegi',
    ],
  },
  {
    "id": 7,
    "question": "Satelit alami yang bernama Larissa adalah satelit dari planet?",
    "options": [
      'Merkurius',
      'Uranus',
      'Jupiter',
      'Neptunus',
    ],
  },
  {
    "id": 8,
    "question": "Planet yang mempunyai cincin selain saturnus ialah?",
    "options": [
      'Jupiter',
      'Saturnus',
      'Uranus',
      'Neptunus',
    ],
  },
  {
    "id": 9,
    "question": "Siapa yang menemukan komet West?",
    "options": [
      'Luboš Kohoutek',
      'Yuji H.',
      'Richard M.B.',
      'Richard M.B.',
    ],
  },
  {
    "id": 10,
    "question": "Apa nama satelit buatan yang pertama kali diluncurkan ke luar amgkasa?",
    "options": [
      'Palapa',
      'Orion',
      'SEASAT',
      'Sputnik 1',
    ],
  },
  {
    "id": 1,
    "question": "Apa nama planet dibawah ini?",
    "image": "assets/images/saturnquiz.jpg",
    "options": [
      'Jupiter',
      'Saturnus',
      'Uranus',
      'Neptunus',
    ],
  },
  {
    "id": 2,
    "question": "Berikut yang merupakan satelit alami bumi ialah?",
    "options": [
      'Larrisa',
      'Proteus',
      'Bulan',
      'Prion',
    ],
  },
  {
    "id": 3,
    "question": "Ada berapa banyak planet yang ada di tatasurya kita (milkyway/bimasakti)?",
    "options": [
      '5',
      '9',
      '7',
      '8',
    ],
  },
  {
    "id": 4,
    "question": "Berapa tahun sekali komet Halley dapat terlihat dari bumi?",
    "options": [
      '75',
      '50',
      '100',
      '61',
    ],
  },
  {
    "id": 5,
    "question": "Apa unsur utama pembentuk bintang?",
    "options": [
      'Carbon & oksigen',
      'Hidrogen & helium',
      'Hidrogen & oksigen',
      'Helium & oksigen',
    ],
  },
  {
    "id": 6,
    "question": "Bentuk bintang sebenarnya ialah?",
    "options": [
      'Bulat',
      'Segitiga',
      'Segilima',
      'Persegi',
    ],
  },
  {
    "id": 7,
    "question": "Satelit alami yang bernama Larissa adalah satelit dari planet?",
    "options": [
      'Merkurius',
      'Uranus',
      'Jupiter',
      'Neptunus',
    ],
  },
  {
    "id": 8,
    "question": "Planet yang mempunyai cincin selain saturnus ialah?",
    "options": [
      'Jupiter',
      'Saturnus',
      'Uranus',
      'Neptunus',
    ],
  },
  {
    "id": 9,
    "question": "Siapa yang menemukan komet West?",
    "options": [
      'Luboš Kohoutek',
      'Yuji H.',
      'Richard M.B.',
      'Richard M.B.',
    ],
  },
  {
    "id": 10,
    "question": "Apa nama satelit buatan yang pertama kali diluncurkan ke luar amgkasa?",
    "options": [
      'Palapa',
      'Orion',
      'SEASAT',
      'Sputnik 1',
    ],
  },
];
