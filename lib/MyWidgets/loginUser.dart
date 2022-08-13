import 'package:flutter/material.dart';
import 'package:to_do_app/constants/constants.dart';

import '../Helper/firebaseHelper.dart';

late String? mail = null, password = null;

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: sabitler.boxDec,
              child: TextFormField(
                onSaved: (newValue) {
                  mail = newValue!;
                },
                decoration: InputDecoration(
                  label: Text("Mail"),
                  filled: true,
                  fillColor: sabitler.fillColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: sabitler.boxDec,
              child: TextFormField(
                onSaved: (newValue) {
                  password = newValue!;
                },
                validator: (value) {
                  if (value!.length < 8) {
                    return ("Password 8 ten büyük olmalı");
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  label: Text("Password"),
                  filled: true,
                  fillColor: sabitler.fillColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: ElevatedButton(
              child: Text("Giriş yap"),
              onPressed: () async {
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  await DatabaseHelper()
                          .signInWithEmailAndPassword(mail, password)
                      ? Navigator.popAndPushNamed(context, "/listNots")
                      : print("Giriş hatası");
                } else {
                  debugPrint("Parola veya Mail hatalı");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
