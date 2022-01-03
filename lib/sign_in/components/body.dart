// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'sign_in_form.dart';

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
              "Masuk",
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
            SignInForm(),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Lupa Password ?",
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
