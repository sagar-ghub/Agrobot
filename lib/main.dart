import 'package:flutter/material.dart';
import 'package:test_app/test.dart';
import 'homePage.dart';
import 'login.dart';
import 'register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      routes: {
        '/home' : (BuildContext context) => MyHomePage(),
        '/login' : (BuildContext context) => Login(),
        '/register' :(BuildContext context) => Register(),
        '/home': (BuildContext context)=> HomePage()
      }
    );
  }
}

