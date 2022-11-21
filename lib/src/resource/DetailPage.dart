import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:login/network/NetworkRequest.dart';
import 'package:login/src/model/employees.dart';
import 'package:login/src/resource/Employee_Profile_Page.dart';

class DetailPage extends StatefulWidget {
  DetailPage({
    Key? key,
    required this.id,
    required this.age,
    required this.job,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  }) : super(key: key);
  int id;
  int age;
  String job;
  String name;
  String email;
  String phone;
  String address;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 15,
    );
    return Scaffold(
      appBar: AppBar(title: Text('Detail Page')),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.people,
                  size: 50,
                )),
            SizedBox(
              height: 50,
            ),
            Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Name(name: widget.name),
                    sizedBox,
                    Age(age: widget.age),
                    sizedBox,
                    Address(address: widget.address),
                    sizedBox,
                    Job(job: widget.job),
                    sizedBox,
                    PhoneNumber(phone: widget.phone),
                    sizedBox,
                    Email(email: widget.email),
                  ],
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () {
                setState(() {
                  widget.age += 1;
                  updateProfile(
                      id: widget.id,
                      age: widget.age,
                      name: widget.name,
                      job: widget.job,
                      email: widget.email,
                      phone: widget.phone,
                      address: widget.address);
                });
              },
              icon: Icon(Icons.plus_one)),
          IconButton(
              onPressed: () {
                setState(() {
                  deleteProfile(widget.id);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => gotoListView()));
                });
              },
              icon: Icon(Icons.delete)),
        ],
      )),
    );
  }

  gotoListView() {
    return Employee_Profile_Page();
  }
}

class Email extends StatelessWidget {
  const Email({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Email:  ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(email),
      ],
    );
  }
}

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    Key? key,
    required this.phone,
  }) : super(key: key);

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Phone Number:  ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(phone),
      ],
    );
  }
}

class Job extends StatelessWidget {
  const Job({
    Key? key,
    required this.job,
  }) : super(key: key);

  final String job;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Job:  ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(job),
      ],
    );
  }
}

class Address extends StatelessWidget {
  const Address({
    Key? key,
    required this.address,
  }) : super(key: key);

  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Address:  ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(address),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({
    Key? key,
    required this.age,
  }) : super(key: key);

  final int age;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Age:  ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(age.toString()),
      ],
    );
  }
}

class Name extends StatelessWidget {
  const Name({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Name:  ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(name),
      ],
    );
  }
}
