// ignore_for_file: file_names

class Users {
  final String id;
  final String name;
  final String email;
  final String noTelp;
  final String alamat;
  final int level1points;
  final int level2points;
  final int level3points;
  final String profilePicture;

  Users(
    this.id,
    this.email, {
    required this.name,
    required this.noTelp,
    required this.alamat,
    required this.level1points,
    required this.level2points,
    required this.level3points,
    required this.profilePicture,
  });
}
