class Book {
  String title;
  String author;

  Book({this.title, this.author});

  Book.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    author = json["author"];
  }
}
