import 'package:flutter/material.dart';
import 'package:to_do_app/constants/constants.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

class UserBilgi extends StatelessWidget {
  final Function onReturnData;

  static late String? name = null, surname = null;

  UserBilgi({required this.onReturnData, Key? key}) : super(key: key);

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      onChanged: () {
        _formKey.currentState!.save();
        if (_formKey.currentState!.validate()) {
          onReturnData(name!.trim(), surname!.trim(), true);
        } else {
          Container(
            width: 50,
            height: 500,
            color: Colors.red,
          );
        }
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: sabitler.boxDec,
              child: TextFormField(
                initialValue: name == null ? " " : name,
                onSaved: (newValue) {
                  name = newValue!;
                },
                validator: (value) {
                  if (value!.length < 5) {
                    return ("İsim 5 ten büyük olmalı");
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  label: Text("Name"),
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
                initialValue: surname == null ? " " : surname,
                onSaved: (newValue) {
                  surname = newValue!;
                },
                validator: (value) {
                  if (value!.length < 5) {
                    return ("Soyad 5 ten büyük olmalı");
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  label: Text("Surname"),
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
