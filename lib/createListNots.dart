import 'package:flutter/material.dart';

import 'package:to_do_app/constants/constants.dart';
import 'package:to_do_app/models/list.dart';

import 'Helper/notsHelper.dart';
import 'models/nots.dart';

class NotList extends StatelessWidget {
  late Function onDissmiss;
  NotList({Key? key, required this.onDissmiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Nots> notList = NotHelper().notList;
    return notList.length > 0
        ? ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (a) {
                  onDissmiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListObject(
                    title: notList[index].title,
                    content: notList[index].content,
                    tarih: notList[index].tarih,
                  ),
                ),
              );
            },
            itemCount: notList.length,
          )
        : Container(
            child: Center(
              child: Text("Ders ekleyin"),
            ),
          );
  }
}
