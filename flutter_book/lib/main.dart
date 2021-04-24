import 'package:flutter/material.dart';
import 'package:flutter_book/users/registration.dart';
import 'users/login.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
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
                    builder: (context) => Registration(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
