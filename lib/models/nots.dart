import 'package:cloud_firestore/cloud_firestore.dart';

class Nots {
  late String title, content;
  late Timestamp tarih;
  static late int id = 0;
  Nots({
    required this.title,
    required this.content,
    required this.tarih,
  });

  int getterId() {
    return id;
  }

  void addId() {
    id += 1;
  }

  void minusId() {
    id -= 1;
  }
}
