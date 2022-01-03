// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:stargazing/home.dart';
import 'package:stargazing/services/auth_services.dart';
import 'package:stargazing/sign_up/sign_up_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPressed = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          const SizedBox(height: 15),
          buildPasswordFormField(),
          const SizedBox(height: 100),
          (isPressed)
              ? SpinKitFadingCircle(
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
                        "Masuk",
                        style: TextStyle(color: Color(0xFF7878AB), fontWeight: FontWeight.w600),
                      ),
                      onPressed: () async {
                        setState(() {
                          isPressed = !isPressed;
                        });
                        SignInSignUpResult result = await AuthServices.signInEmail(emailController.text, passwordController.text);

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
                            isPressed = !isPressed;
                          });
                        } else {
                          Get.offAll(() => Home());
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
            height: 20,
          ),
          Container(
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
                  "Daftar",
                  style: TextStyle(color: Color(0xFF7878AB), fontWeight: FontWeight.w600),
                ),
                onPressed: () async {
                  Get.off(() => SignUpScreen());
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
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        hintText: "Email",
        hintStyle: const TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.white)),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Icon(
            Icons.mail_outline,
            size: 24,
            color: Colors.white,
          ),
        ),
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
}
