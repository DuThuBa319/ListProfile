import 'package:flutter/material.dart';
import 'package:login/src/resource/Employee_Profile_Page.dart';

void main() => runApp((MyFirstApp()));

class MyFirstApp extends StatefulWidget {
  @override
  State<MyFirstApp> createState() => _MyFirstAppState();
}

class _MyFirstAppState extends State<MyFirstApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Employee_Profile_Page(),
    );
  }
}
