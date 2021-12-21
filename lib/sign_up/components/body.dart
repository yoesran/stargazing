import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stargazing/sign_in/sign_in_screen.dart';
import 'sign_up_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        color: const Color(0xFF312244),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Daftar",
              style: TextStyle(
                fontFamily: "NATS",
                color: Colors.white,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            SignUpForm(),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                Get.to(() => const SignInScreen());
              },
              child: const Text(
                "Sudah Punya Akun ? Klik Disini",
                style: TextStyle(fontSize: 18, color: Colors.grey, fontFamily: "NATS"),
              ),
            ),
            const Divider(
              color: Colors.white,
              endIndent: 120,
              indent: 120,
            ),
          ],
        ),
      ),
    );
  }
}
