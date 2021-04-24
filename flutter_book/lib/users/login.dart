import 'package:flutter/material.dart';
import 'package:flutter_book/books/bookList.dart';
import 'package:flutter_book/users/password_reset.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' show json;

class Login extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future userlogin(BuildContext context) async {
    var url = "http://127.0.0.1:8000/api/login";
    var response = await http.post(url, body: {
      "email": email.text,
      "password": password.text,
    });
    var data = json.decode(response.body);
    if (data != null) {
      Fluttertoast.showToast(
        msg: 'ログインしました',
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
          title: Text('ログイン画面'),
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
                  hintText: 'メールアドレス',
                ),
                controller: email,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'パスワード',
                ),
                controller: password,
              ),
              TextButton(
                child: Text(
                  'パスワードをお忘れですか？',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PasswordReset(),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  'ログイン',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {
                  userlogin(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
