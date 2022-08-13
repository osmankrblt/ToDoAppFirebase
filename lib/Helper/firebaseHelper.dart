import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
}
