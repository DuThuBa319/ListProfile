import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/src/model/employees.dart';
import 'package:login/src/resource/Employee_Profile_Page.dart';
import 'package:login/src/resource/Login_Page.dart';

//stl
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        // leading: Builder(
        //   builder: (context) => IconButton(
        //     icon: Icon(Icons.settings),
        //     onPressed: () => Scaffold.of(context).openDrawer(),
        //   ),
        // ),
        actions: [
          Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(Icons.clean_hands)))
        ],
      ),
      drawer: Drawer(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: FractionalOffset.topRight,
            child: Builder(
              builder: (context) => IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  }),
            ),
          ),
          Text(
            'Information',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
        ],
      )),
      endDrawer: Drawer(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => gotoProfilePage(context))));
                },
                child: Text(
                  'Employee Profiles',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.grey,
                  fixedSize: Size(200, 100),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: null, icon: Icon(Icons.home)),
          IconButton(onPressed: null, icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => LogOut(context))));
              },
              icon: Icon(Icons.logout)),
        ],
      )),
    );
  }

  LogOut(BuildContext context) {
    return Login();
  }

  gotoProfilePage(BuildContext context) {
    return Employee_Profile_Page();
  }
}
