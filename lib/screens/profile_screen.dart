// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:stargazing/models/users.dart';
import 'package:stargazing/on_boarding.dart';
import 'package:stargazing/services/auth_services.dart';
import 'package:stargazing/services/user_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Users? users;
  bool isLoaded = false, isPressed = false, isFile = false, isPressedPassword = false;
  File? profilePicture;
  String? picture = "https://drive.google.com/uc?export=view&id=1gp_gyRlf5IQD4LyRI-E1Eshc1fF4LV_3";

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    if (!isLoaded) {
      UserServices.getUser(user!.uid).then((value) {
        emailController.text = value.email;
        nameController.text = value.name;
        noTelpController.text = value.noTelp;
        alamatController.text = value.alamat;

        users = value;

        if (value.profilePicture != "") {
          picture = value.profilePicture;
        }

        isLoaded = true;

        setState(() {});
      });
    }
    return Scaffold(
      backgroundColor: const Color(0xFF312244),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ProfileWidget(
                  imagePath: picture!,
                  imageFile: profilePicture,
                  isFile: isFile,
                  onClicked: () {
                    getImage().then((value) {
                      setState(() {
                        profilePicture = value;
                        isFile = true;
                      });
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (1 / 5) - 18,
                      child: const Text(
                        "Nama",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (4 / 5) - 18,
                      child: buildNameFormField(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (1 / 5) - 18,
                      child: const Text(
                        "Email",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (4 / 5) - 18,
                      child: buildEmailFormField(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (1 / 5) - 18,
                      child: const Text(
                        "Phone",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (4 / 5) - 18,
                      child: buildNoTelpFormField(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (1 / 5) - 18,
                      child: const Text(
                        "Alamat",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (4 / 5) - 18,
                      child: buildAlamatFormField(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              (isPressed)
                  ? const SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50,
                    )
                  : Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 2,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: ElevatedButton(
                              child: const Text(
                                "Edit",
                                style: TextStyle(color: Color(0xFF7878AB), fontWeight: FontWeight.w600),
                              ),
                              onPressed: () async {
                                if (!(emailController.text.trim() != "" &&
                                    nameController.text.trim() != "" &&
                                    noTelpController.text.trim() != "" &&
                                    alamatController.text.trim() != "")) {
                                  Get.snackbar(
                                    "Pesan",
                                    "Mohon isi data yang diminta",
                                    snackPosition: SnackPosition.TOP,
                                    isDismissible: false,
                                    backgroundColor: Colors.white,
                                    duration: Duration(seconds: 3),
                                    margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                                    colorText: Colors.black,
                                    borderRadius: 0,
                                  );
                                } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(noTelpController.text)) {
                                  Get.snackbar(
                                    "Pesan",
                                    "Format no telepon tidak sesuai",
                                    snackPosition: SnackPosition.TOP,
                                    isDismissible: false,
                                    backgroundColor: Colors.white,
                                    duration: const Duration(seconds: 3),
                                    margin: const EdgeInsets.only(bottom: 0, left: 0, right: 0),
                                    colorText: Colors.black,
                                    borderRadius: 0,
                                  );
                                } else if (profilePicture == null) {
                                  setState(() {
                                    isPressed = !isPressed;
                                  });
                                  await UserServices.updateUser(
                                      user!.uid,
                                      user.email,
                                      nameController.text,
                                      noTelpController.text,
                                      alamatController.text,
                                      users!.level1points,
                                      users!.level2points,
                                      users!.level3points,
                                      users!.profilePicture);
                                  setState(() {
                                    isLoaded = false;
                                    isPressed = !isPressed;
                                  });
                                  Get.snackbar(
                                    "Pesan",
                                    "Data Berhasil Diedit",
                                    snackPosition: SnackPosition.TOP,
                                    isDismissible: false,
                                    backgroundColor: Colors.white,
                                    duration: const Duration(seconds: 3),
                                    margin: const EdgeInsets.only(bottom: 0, left: 0, right: 0),
                                    colorText: Colors.black,
                                    borderRadius: 0,
                                  );
                                } else {
                                  setState(() {
                                    isPressed = !isPressed;
                                  });
                                  String profileLink = await uploadImage(profilePicture);
                                  if (users!.profilePicture != "") {
                                    await deleteFileFromFirebaseByUrl(users!.profilePicture);
                                  }
                                  await UserServices.updateUser(user!.uid, user.email, nameController.text, noTelpController.text,
                                      alamatController.text, users!.level1points, users!.level2points, users!.level3points, profileLink);
                                  setState(() {
                                    isLoaded = false;
                                    isPressed = !isPressed;
                                  });
                                  Get.snackbar(
                                    "Pesan",
                                    "Data Berhasil Diedit",
                                    snackPosition: SnackPosition.TOP,
                                    isDismissible: false,
                                    backgroundColor: Colors.white,
                                    duration: const Duration(seconds: 3),
                                    margin: const EdgeInsets.only(bottom: 0, left: 0, right: 0),
                                    colorText: Colors.black,
                                    borderRadius: 0,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                  textStyle: const TextStyle(color: Colors.white, fontSize: 16)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 2,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: ElevatedButton(
                              child: const Text(
                                "Keluar",
                                style: TextStyle(color: Color(0xFF7878AB), fontWeight: FontWeight.w600),
                              ),
                              onPressed: () async {
                                setState(() {
                                  isPressed = !isPressed;
                                });
                                await AuthServices.signOut();
                                Get.offAll(() => const OnBoarding());
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                  textStyle: const TextStyle(color: Colors.white, fontSize: 16)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 2,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: ElevatedButton(
                              child: const Text(
                                "Hapus Akun",
                                style: TextStyle(color: Color(0xFF7878AB), fontWeight: FontWeight.w600),
                              ),
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder: (context, setState) {
                                      return AlertDialog(
                                        backgroundColor: Color(0xFF312244),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        elevation: 5,
                                        content: SizedBox(
                                          height: 225,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Masukkan Password Anda",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              buildPasswordFormField(),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              (isPressedPassword)
                                                  ? const SpinKitFadingCircle(
                                                      color: Colors.white,
                                                      size: 50,
                                                    )
                                                  : Container(
                                                      decoration: const BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            offset: Offset(1, 1),
                                                            blurRadius: 2,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                      width: double.infinity,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(5),
                                                        child: ElevatedButton(
                                                          child: const Text(
                                                            "Hapus Akun",
                                                            style: TextStyle(color: Color(0xFF7878AB), fontWeight: FontWeight.w600),
                                                          ),
                                                          onPressed: () async {
                                                            setState(() {
                                                              isPressedPassword = true;
                                                            });

                                                            SignInSignUpResult result = await AuthServices.signInEmail(
                                                                emailController.text, passwordController.text);
                                                            if (result.user == null) {
                                                              Get.snackbar(
                                                                "Pesan",
                                                                result.message,
                                                                snackPosition: SnackPosition.TOP,
                                                                isDismissible: false,
                                                                backgroundColor: Colors.white,
                                                                duration: Duration(seconds: 3),
                                                                margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                                                                colorText: Colors.black,
                                                                borderRadius: 0,
                                                              );
                                                              setState(() {
                                                                isPressedPassword = true;
                                                              });
                                                            } else {
                                                              if (picture !=
                                                                  "https://drive.google.com/uc?export=view&id=1gp_gyRlf5IQD4LyRI-E1Eshc1fF4LV_3") {
                                                                await deleteFileFromFirebaseByUrl(picture!);
                                                              }
                                                              await UserServices.deleteUser(user!.uid, user.email, passwordController.text);
                                                              Get.offAll(() => OnBoarding());
                                                            }
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                              primary: Colors.white,
                                                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                                              textStyle: const TextStyle(color: Colors.white, fontSize: 16)),
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                  textStyle: const TextStyle(color: Colors.white, fontSize: 16)),
                            ),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      controller: nameController,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: const InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        hintText: "Nama",
        hintStyle: TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        hintText: "Password",
        hintStyle: const TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.white)),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Icon(
            Icons.lock_outlined,
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: const InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }

  TextFormField buildNoTelpFormField() {
    return TextFormField(
      controller: noTelpController,
      keyboardType: TextInputType.number,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: const InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        hintText: "No. Telepon",
        hintStyle: TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }

  TextFormField buildAlamatFormField() {
    return TextFormField(
      controller: alamatController,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: const InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        hintText: "Alamat",
        hintStyle: TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}

Future<File?> getImage() async {
  try {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    return File(image!.path);
  } catch (e) {
    return null;
  }
}

//* Method to uploading image to firebase storage
Future<String> uploadImage(File? image) async {
  String fileName = basename(image!.path);

  Reference ref = FirebaseStorage.instance.ref().child(fileName);
  UploadTask task = ref.putFile(image);
  // TaskSnapshot snapshot = await task.onComplete;

  return await (await task).ref.getDownloadURL();
}

Future<void> deleteFileFromFirebaseByUrl(String urlFile) async {
  String fileName = urlFile.replaceAll("/o/", "*");
  fileName = fileName.replaceAll("?", "*");
  fileName = fileName.split("*")[1];

  Reference storageReferance = FirebaseStorage.instance.ref();
  storageReferance.child(fileName).delete();
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final File? imageFile;
  final bool isEdit;
  final bool isFile;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    this.imageFile,
    this.isFile = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: (isFile && imageFile != null)
            ? Ink.image(
                image: FileImage(imageFile!),
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(onTap: onClicked),
              )
            : Ink.image(
                image: image,
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(onTap: onClicked),
              ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
