import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool spin = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spin,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'anime',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              My_txt(Colors.grey, Colors.lightBlueAccent, 'Enter your email id',
                  (value) {
                email = value;
              }, false),
              SizedBox(
                height: 8.0,
              ),
              My_txt(Colors.grey, Colors.lightBlueAccent, 'Enter your password',
                  (value) {
                pass = value;
              }, true),
              SizedBox(
                height: 24.0,
              ),
              My_Container(Colors.lightBlueAccent, 'Login', () async {
                setState(() {
                  spin = true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: pass);
                  if (user != null) {
                    Navigator.pushNamed(context, '/chat');
                  }
                } catch (e) {
                  print(e);
                } finally {
                  setState(() {
                    spin = false;
                  });
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
