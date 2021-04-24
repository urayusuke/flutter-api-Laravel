import 'package:flutter/material.dart';

import 'login.dart';

class PasswordReset extends StatelessWidget {
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
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'パスワード',
                ),
              ),
              RaisedButton(
                child: Text(
                  'パスワード変更',
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
                      builder: (context) => Login(),
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
