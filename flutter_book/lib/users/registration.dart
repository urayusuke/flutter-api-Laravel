import 'package:flutter/material.dart';
import 'package:flutter_book/books/bookList.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('新規登録'),
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
                  hintText: '名 前',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'メールアドレス',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'パスワード',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'パスワード確認',
                ),
              ),
              RaisedButton(
                child: Text(
                  '新規登録',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
