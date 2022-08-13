import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/constants/constants.dart';
import 'package:to_do_app/firebase_options.dart';
import 'package:to_do_app/listNots.dart';
import 'package:to_do_app/loginScreen.dart';
import 'package:to_do_app/registerScreen.dart';

import 'mainScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
// Ideal time to initialize
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/registerScreen': (context) => RegisterScreenPage(),
        '/loginScreen': (context) => LoginScreenPage(),
        '/listNots': (context) => ListNots(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: sabitler.mainColor,
      ),
      home: MainPage(),
    );
  }
}
