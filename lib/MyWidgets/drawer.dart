import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerMy extends StatelessWidget {
  const DrawerMy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName:
                Text(FirebaseAuth.instance.currentUser!.displayName.toString()),
            accountEmail: Text(
              FirebaseAuth.instance.currentUser!.email.toString(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();

              FirebaseAuth.instance.authStateChanges().listen((User? user) {
                user = null;
                Navigator.of(context).popUntil((route) => route.isFirst);
              });
            },
            child: Text("Çıkış yap"),
          ),
        ],
      ),
    );
  }
}
