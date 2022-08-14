import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:to_do_app/createListNots.dart';





class StreamList extends StatelessWidget {
  late Function onDissmiss;
  StreamList({Key? key, required this.onDissmiss});
  final Stream<QuerySnapshot> _stream = FirebaseFirestore.instance
      .collection("todos/${FirebaseAuth.instance.currentUser!.uid}/nots")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: _stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: Text("Ders ekleyin lütfen"),
            ),
          );
        } else {
          return NotList(
            snapshot: snapshot,
            onDissmiss: (index) {
              onDissmiss(index);
            },
          );
        }
      },
    );
  }
}
