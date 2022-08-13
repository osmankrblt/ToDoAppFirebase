import 'package:flutter/material.dart';
import 'package:to_do_app/constants/constants.dart';

class ListObject extends StatelessWidget {
  late String title, content, tarih;
  ListObject({
    Key? key,
    required this.title,
    required this.content,
    required this.tarih,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: sabitler.boxDecNot,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: sabitler.titleStyle(15, FontWeight.bold, Colors.black),
              ),
              SizedBox(
                width: 6,
                height: 6,
              ),
              Text(
                content,
                style:
                    sabitler.contentStyle(13, FontWeight.normal, Colors.black),
              ),
              SizedBox(
                width: 6,
                height: 6,
              ),
              Text(
                tarih,
                style:
                    sabitler.contentStyle(10, FontWeight.normal, Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
