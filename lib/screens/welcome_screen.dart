import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/constants.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 1), upperBound: 1);
    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);
    super.initState();
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'anime',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      ' Together',
                      speed: Duration(milliseconds: 100),
                      textStyle: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            My_Container(
              Colors.lightBlueAccent,
              'Login',
              () {
                Navigator.pushNamed(
                    context, '/login'); //Go to registration screen.
              },
            ),
            My_Container(
              Colors.blueAccent,
              'Register',
              () {
                Navigator.pushNamed(
                    context, '/regis'); //Go to registration screen.
              },
            ),
            Container(
              child: Text(
                "Made with ❤️ - By Agash",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
