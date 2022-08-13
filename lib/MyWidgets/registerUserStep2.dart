import 'package:flutter/material.dart';
import 'package:to_do_app/constants/constants.dart';
import 'package:email_validator/email_validator.dart';

class LoginUserSecurity extends StatelessWidget {
  final Function onReturnData;
  static late String? mail = null, password = null, controlPassword = null;

  LoginUserSecurity({required this.onReturnData, Key? key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      onChanged: () {
        _formKey.currentState!.save();
        if (_formKey.currentState!.validate()) {
          onReturnData(mail!.trim(), password!.trim(), true);
        } else {
          debugPrint("Mail veya Parola hatalı ");
        }
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: sabitler.boxDec,
              child: TextFormField(
                initialValue: mail == null ? " " : mail,
                onSaved: (newValue) {
                  mail = newValue!;
                },
                validator: (value) {
                  if (value!.length < 5) {
                    if (EmailValidator.validate(value)) {
                      return ("Email hatalı");
                    }
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  label: Text("Mail"),
                  filled: true,
                  fillColor: sabitler.fillColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              decoration: sabitler.boxDec,
              child: TextFormField(
                initialValue: password == null ? " " : password,
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
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              decoration: sabitler.boxDec,
              child: TextFormField(
                onSaved: (newValue) {
                  controlPassword = newValue!;
                },
                validator: (value) {
                  if (ParolaKontrol(password, controlPassword)) {
                    return "Parolalar eşleşmiyor";
                  } else if (value!.length < 8) {
                    return ("Password tekrar giriniz");
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  label: Text("Password Control"),
                  filled: true,
                  fillColor: sabitler.fillColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

bool ParolaKontrol(password, controlPassword) {
  if (password == controlPassword) {
    return true;
  }
  return false;
}
