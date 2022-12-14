import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/constants/constants.dart';

import 'Helper/firebaseHelper.dart';
import 'models/nots.dart';

class NotAddPage extends StatefulWidget {
  NotAddPage({Key? key}) : super(key: key);

  @override
  State<NotAddPage> createState() => _NotAddPageState();
}

var _formKey = GlobalKey<FormState>();

class _NotAddPageState extends State<NotAddPage> {
  @override
  late String? title, content;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sabitler.baslik("Not Giriniz"),
      body: Form(
        key: _formKey,
        onChanged: () {
          _formKey.currentState!.save();
        },
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onSaved: (value) {
                title = value!;
              },
              decoration: InputDecoration(
                label: Text("Başlık"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onSaved: (value) {
                content = value!;
              },
              decoration: InputDecoration(
                label: Text("İçerik giriniz"),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text("Geri"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text("Ekle"),
                      onPressed: () {
                        DatabaseHelper().addNot(
                          FirebaseAuth.instance.currentUser!.uid,
                          Nots(
                              title: title!,
                              content: content!,
                              tarih: Timestamp.now()),
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
