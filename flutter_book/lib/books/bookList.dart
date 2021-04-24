import 'package:flutter/material.dart';
import 'package:flutter_book/main.dart';
import 'package:flutter_book/models/book.dart';
import 'addBook.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'dart:convert' show utf8;

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  Map data;
  List useData;
  List title;
  Future getData() async {
    http.Response response = await http.get("http://127.0.0.1:8000/api/books");
    var data = json.decode(utf8.decode(response.bodyBytes));
    setState(() {
      useData = data["data"];
    });
  }

  Future<List<Book>> testdata() async {
    http.Response response = await http.get("http://127.0.0.1:8000/api/books");
    var data = json.decode(utf8.decode(response.bodyBytes));
    setState(() {
      var test = data["title"];
      print(test);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    testdata();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('本一覧画面'),
          actions: [
            TextButton(
              child: Text(
                'ログアウト',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: title == null ? 0 : title.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("$title"),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddBook(),
              ),
            );
          },
        ),
      ),
    );
  }
}
