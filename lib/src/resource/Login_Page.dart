import 'package:flutter/material.dart';
import 'package:login/src/blocs/Login_Bloc.dart';
import 'package:login/src/resource/HomePage.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //khai bao bien
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  LoginBloc bloc = LoginBloc();
  bool ShowPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //logo
                Logo(),
                // Text Welcome
                TextWelcome(),
                // khoang trang
                SizedBox(
                  height: 40,
                ),
                //Text Field Username
                StreamBuilder(
                  stream: bloc.UsernameStream,
                  builder: (context, snapshot) => TextField(
                    controller: _usernameController,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Username',
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        )),
                  ),
                ),
                //Text field Password
                StreamBuilder(
                    stream: bloc.PasswordStream,
                    builder: (context, snapshot) => Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: <Widget>[
                            TextField(
                              controller: _passwordController,
                              obscureText: ShowPass,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  errorText: snapshot.hasError
                                      ? snapshot.error.toString()
                                      : null,
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  )),
                            ),
                            Container(
                                child: ShowPass
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            ShowPass = false;
                                          });
                                        },
                                        icon: Icon(Icons.visibility_off),
                                        iconSize: 20,
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            ShowPass = true;
                                          });
                                        },
                                        icon: Icon(Icons.visibility),
                                        iconSize: 20,
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                      )),
                          ],
                        )),
                // nut sign in
                SignInButton(),
                // Quen mat khau, dang ky  moi..
                SupportCommand(),
              ])),
    );
  }

  Center SignInButton() {
    var _signInBtn = TextButton(
      onPressed: () {
        setState(() {
          onSignInClicked();
        });
      },
      child: Text(
        'Sign In',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.black,
        padding: EdgeInsets.all(15),
      ),
    );
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: _signInBtn,
        ),
      ),
    );
  }

  void onSignInClicked() {
    setState(() {
      if (bloc.IsValidInfo(_usernameController.text, _passwordController.text))
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => gotoHomePage(context))));
    });
  }

  Widget gotoHomePage(BuildContext context) {
    return HomePage();
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      UIData.logo_Flutter,
      scale: 3,
    );
  }
}

class TextWelcome extends StatelessWidget {
  const TextWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      // ignore: prefer_const_literals_to_create_immutables
      children: <TextSpan>[
        TextSpan(
            text: 'Hi!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
              fontSize: 40,
            )),
        TextSpan(
            text: '\nWelcome Back!!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30,
            ))
      ],
    ));
  }
}

class SupportCommand extends StatelessWidget {
  const SupportCommand({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        TextButton(
            onPressed: null,
            child: Text(
              'Sign up.',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            )),
        TextButton(
            onPressed: null,
            child: Text(
              'Forgot Password?',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ))
      ],
    );
  }
}

class UIData {
  static const String logo_Flutter = 'assets/images/logoFlutter.png';
}
