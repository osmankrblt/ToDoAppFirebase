import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/constants/constants.dart';

import 'Helper/firebaseHelper.dart';
import 'models/nots.dart';

class NotEditPage extends StatefulWidget {
  NotEditPage({Key? key}) : super(key: key);

  @override
  State<NotEditPage> createState() => _NotEditPageState();
}

var _formKey = GlobalKey<FormState>();
late int notId;
late Nots? not = null;
@override
Future initState() async {
  debugPrint("Not Id: $notId");
  not = await DatabaseHelper()
      .getNot(FirebaseAuth.instance.currentUser!.uid, notId);
}

class _NotEditPageState extends State<NotEditPage> {
  @override
  late String? title, content;
  Widget build(BuildContext context) {
    notId = ((ModalRoute.of(context)?.settings.arguments)
        as Map<String, dynamic>)["notId"];
    debugPrint("Not Id: $notId");

    return Scaffold(
      appBar: sabitler.baslik("Not düzeltiniz"),
      body: Form(
        key: _formKey,
        onChanged: () {
          _formKey.currentState!.save();
        },
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: not!.title,
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
              initialValue: not!.content,
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
                      child: Text("Güncelle"),
                      onPressed: () {
                        DatabaseHelper().updateNot(
                            FirebaseAuth.instance.currentUser!.uid,
                            Nots(
                                title: title!,
                                content: content!,
                                tarih: Timestamp.now()));
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
