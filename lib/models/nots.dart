class Nots {
  late String title, content;
  late String tarih;
  static late int id = 0;
  Nots({
    required this.title,
    required this.content,
  }) {
    id += 1;
    tarih = DateTime.now().toString();
  }
  bool NotUpdate(title, content) {
    this.title = title;
    this.content = content;
    this.tarih = DateTime.now.toString();
    return false;
  }
}
