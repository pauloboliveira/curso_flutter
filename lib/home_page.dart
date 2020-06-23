import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Curso")),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _text(),
          _img(),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("PageView"),
                  _button("Page2"),
                  _button("Page3"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("Snack"),
                  _button("Dialog"),
                  _button("Toast"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _text() {
    return Text(
      "Hello World!",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.blue,
      ),
    );
  }

  _img() {
    return Image.asset(
      "assets/images/dog1.png",
      fit: BoxFit.contain,
    );
  }

  _button(text) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(text,
          style: TextStyle(
            color: Colors.white,
          )),
      onPressed: () {
        print("ok");
      },
    );
  }
}
