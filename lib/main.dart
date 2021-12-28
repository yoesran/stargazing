import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stargazing/home.dart';
import 'package:stargazing/on_boarding.dart';
import 'package:stargazing/quiz/quiz.dart';
import 'package:stargazing/services/auth_services.dart';
import 'package:stargazing/sign_in/sign_in_screen.dart';
import 'package:stargazing/sign_up/sign_up_screen.dart';
import 'package:stargazing/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: GetMaterialApp(
        title: "Stargazing",
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
