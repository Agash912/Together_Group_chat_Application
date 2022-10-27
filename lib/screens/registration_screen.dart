import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              My_txt(
                  Colors.lightBlueAccent, Colors.blueAccent, 'Enter your email',
                  (value) {
                email = value;
              }, false),
              SizedBox(
                height: 8.0,
              ),
              My_txt(Colors.lightBlueAccent, Colors.blueAccent,
                  'Enter your password', (value) {
                pass = value;
              }, true),
              SizedBox(
                height: 24.0,
              ),
              My_Container(Colors.blueAccent, 'Register', () async {
                setState(() {
                  spin = true;
                });
                try {
                  final new_user = await _auth.createUserWithEmailAndPassword(
                      email: email, password: pass);
                  if (new_user != null) {
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
