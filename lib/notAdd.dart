import 'package:flutter/material.dart';
import 'package:to_do_app/constants/constants.dart';

class NotAddPage extends StatefulWidget {
  NotAddPage({Key? key}) : super(key: key);

  @override
  State<NotAddPage> createState() => _NotAddPageState();
}

class _NotAddPageState extends State<NotAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sabitler.baslik("Not Giriniz"),
    );
  }
}
