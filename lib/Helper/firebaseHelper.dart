import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_app/models/nots.dart';
import '../firebase_options.dart';

class DatabaseHelper {
  DatabaseHelper() {}
  Future<bool> createUserEmailAndPassword(name, mail, password) async {
    try {
      var _userCredential = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: mail, password: password))
          .user;
      _userCredential!.updateProfile(displayName: name);
      return true;
    } catch (e) {
      print("Böyle bir mail yok Firebase Hatası");
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword(mail, password) async {
    try {
      var _userCredential =
          (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail!.trim(),
        password: password!.trim(),
      ))
              .user;

      return true;
    } catch (e) {
      print("Böyle bir mail yok Firebase Hatası - Giriş hatası");
      return false;
    }
  }

  Future<bool> deleteUser() async {
    try {
      if (FirebaseAuth.instance.currentUser! != null) {
        var _userCredential =
            (await FirebaseAuth.instance.currentUser!.delete());
      }
      print("Hesap yok");
      return true;
    } catch (e) {
      print("Böyle bir mail yok Firebase Hatası - Silme hatası");
      return false;
    }
  }

  void addNot(String userId, Nots not) async {
    var result = await FirebaseFirestore.instance
        .doc("todos/$userId/nots/${not.getterId()}")
        .set({
      "notId": not.getterId(),
      "user_id": userId,
      "title": not.title,
      "content": not.content,
      "time": not.tarih,
      "createdAt": FieldValue.serverTimestamp()
    }, SetOptions(merge: true));
    not.addId();
  }

  Future<Nots> getNot(String userId, int notId) async {
    var result = await FirebaseFirestore.instance
        .doc("todos/$userId/nots/${notId}")
        .get() as Map<String, dynamic>;
    debugPrint("Get Not çalıştı");
    return await Nots(
      title: result["title"],
      content: result["content"],
      tarih: Timestamp.now(),
    );
  }

  void updateNot(String userId, Nots not) async {
    var result = await FirebaseFirestore.instance
        .doc("todos/$userId/nots/${not.getterId()}")
        .update(
      {
        "user_id": userId,
        "title": not.title,
        "content": not.content,
        "time": not.tarih,
        "createdAt": FieldValue.serverTimestamp()
      },
    );
  }
}
/*

rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if
          request.time < timestamp.date(2022, 9, 13);
    }
  }
}
 */