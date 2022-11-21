import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login/network/NetworkRequest.dart';
import 'package:login/src/resource/DetailPage.dart';
import 'package:login/src/resource/HomePage.dart';
import 'package:login/src/resource/Login_Page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:login/src/model/employees.dart';
import 'package:http/http.dart' as http;

class Employee_Profile_Page extends StatefulWidget {
  const Employee_Profile_Page({super.key});

  @override
  State<Employee_Profile_Page> createState() => _Employee_Profile_PageState();
}

class _Employee_Profile_PageState extends State<Employee_Profile_Page> {
  late Future<List<Profiles>> futureProfile;
  late TextEditingController searchController = new TextEditingController();
  List<Profiles> searchProfile = [];
  List<Profiles> displayProfile = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProfile('').then((value) {
      setState(() {
        searchProfile.addAll(value);
        displayProfile = searchProfile;
      });
    });
    futureProfile = fetchProfile('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Employee Profiles',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.yellowAccent),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (((context) => goToLoginPage(context)))));
              },
              icon: Icon(Icons.logout)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (((context) => goToHomePage(context)))));
              },
              icon: Icon(Icons.home)),
          IconButton(onPressed: null, icon: Icon(Icons.settings)),
        ],
      )),
      body: Column(children: [
        Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  futureProfile = fetchProfile(value);
                });
              },
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'search',
              ),
            )),
        Expanded(
            child: FutureBuilder(
          future: futureProfile,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return Container(child: Text('Not found data'));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) =>
                        buildCard(snapshot.data[index]));
              }
            } else if (snapshot.hasError)
              return Container(child: Text('Not Found Data'));
            else {
              return Center(
                  child: Container(
                child: CircularProgressIndicator(),
                width: 50,
                height: 50,
              ));
            }
          },
        ))
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              createProfile(
                  id: 51,
                  age: 20,
                  name: 'Khang',
                  job: 'Student',
                  email: 'khang@gmail.com',
                  phone: '093509763',
                  address: '2203/1');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => super.widget));
            });
          },
          child: Icon(Icons.add)),
    );
  }

  goToLoginPage(BuildContext context) {
    return Login();
  }

  goToHomePage(BuildContext context) {
    return HomePage();
  }

  Widget buildCard(var item) {
    return Card(
        margin: EdgeInsets.all(5),
        elevation: 20,
        shadowColor: Color.fromARGB(
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255)),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: Icon(Icons.people),
            title: Text(
              item.id.toString() + '.  ' + item.name,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Email: ' + item.email,
                style:
                    TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => DetailPage(
                          id: item.id,
                          name: item.name,
                          phone: item.phone,
                          email: item.email,
                          address: item.address,
                          job: item.job,
                          age: item.age))));
            },
          ),
        ));
  }
}
