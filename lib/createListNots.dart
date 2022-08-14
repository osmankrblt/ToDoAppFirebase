import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:to_do_app/constants/constants.dart';
import 'package:to_do_app/models/list.dart';

import 'models/nots.dart';

class NotList extends StatelessWidget {
  late Function onDissmiss;
  late var snapshot;
  NotList({Key? key, required this.onDissmiss, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Map<String, dynamic> data =
            snapshot.data.docs[index].data() as Map<String, dynamic>;

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              "/editNots",
              arguments: {"notId": data["notId"]},
            );
          },
          child: Dismissible(
            direction: DismissDirection.startToEnd,
            key: UniqueKey(),
            onDismissed: (a) {
              onDissmiss(data["notId"]);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListObject(
                not: Nots(
                  title: data["title"],
                  content: data["content"],
                  tarih: Timestamp.now(),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: snapshot.data.docs.length,
    );
  }
}
