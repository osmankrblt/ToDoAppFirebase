import 'package:flutter/material.dart';
import 'package:to_do_app/constants/constants.dart';

import 'nots.dart';

class ListObject extends StatelessWidget {
  late Nots not;
  ListObject({Key? key, required this.not});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          decoration: sabitler.boxDecNot,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  not.title,
                  style: sabitler.titleStyle(15, FontWeight.bold, Colors.black),
                ),
                SizedBox(
                  width: 6,
                  height: 6,
                ),
                Text(
                  not.title,
                  style: sabitler.contentStyle(
                      13, FontWeight.normal, Colors.black),
                ),
                SizedBox(
                  width: 6,
                  height: 6,
                ),
                Text(
                  not.tarih.toString(),
                  style: sabitler.contentStyle(
                      10, FontWeight.normal, Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
