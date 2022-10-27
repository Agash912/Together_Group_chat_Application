import 'package:flutter/material.dart';

String pass = '';
String email = '';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

class My_Container extends StatelessWidget {
  final col;
  final content;
  final Function onPressed;

  My_Container(this.col, this.content, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: col,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            content,
          ),
        ),
      ),
    );
  }
}

class My_txt extends StatelessWidget {
  final col1;
  final col2;
  final txt;
  final Function onPressed;
  final bool obs;
  My_txt(this.col1, this.col2, this.txt, this.onPressed, this.obs);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onPressed,
      obscureText: obs,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: txt,
        hintStyle: TextStyle(color: col1),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: col2, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: col2, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
