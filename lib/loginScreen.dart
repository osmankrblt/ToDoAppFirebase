import 'package:flutter/material.dart';
import 'package:to_do_app/constants/constants.dart';

import 'MyWidgets/loginUser.dart';

class LoginScreenPage extends StatefulWidget {
  LoginScreenPage({Key? key}) : super(key: key);

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sabitler.baslik("Giriş Yap"),
      body: LoginForm(),
    );
  }
}
