import 'package:flutter/material.dart';
import 'package:flutter_book/books/bookList.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' show json;

class AddBook extends StatelessWidget {
  final TextEditingController title = TextEditingController();
  final TextEditingController author = TextEditingController();

  Future createbook(BuildContext context) async {
    var url = "http://127.0.0.1:8000/api/books";
    var response = await http.post(url, body: {
      "title": title.text,
      "author": author.text,
    });
    var data = json.decode(response.body);
    if (data != "null") {
      Fluttertoast.showToast(
        msg: '保存しました',
        fontSize: 25,
        textColor: Colors.green,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookList(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('本の登録・更新画面'),
          leading: TextButton(
            child: Text(
              '戻る',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'タイトル',
                ),
                controller: title,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: '著 者',
                ),
                controller: author,
              ),
              RaisedButton(
                child: Text(
                  '保 存',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  createbook(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
