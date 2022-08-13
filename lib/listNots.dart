import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Helper/firebaseHelper.dart';
import 'package:to_do_app/constants/constants.dart';
import 'package:to_do_app/createListNots.dart';

import 'Helper/notsHelper.dart';
import 'MyWidgets/drawer.dart';

class ListNots extends StatefulWidget {
  ListNots({Key? key}) : super(key: key);

  @override
  State<ListNots> createState() => _ListNotsState();
}

class _ListNotsState extends State<ListNots> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: sabitler.mainColor.withOpacity(0.9),
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            " HOK To Do App",
            style: sabitler.textStyle(25, FontWeight.bold, sabitler.mainColor),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: DrawerMy(),
      body: Column(
        children: [
          Expanded(
            child: NotList(onDissmiss: (index) {
              NotHelper().notList.removeAt(index);
              debugPrint("ELEMAN ÇIKARILDI $index");
            }),
          ),
        ],
      ),
    );
  }
}
