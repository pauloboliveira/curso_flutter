import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testeflutter/pages/hello_list_view.dart';
import 'package:testeflutter/pages/hello_page2.dart';
import 'package:testeflutter/pages/hello_page3.dart';
import 'package:testeflutter/utils/nav.dart';
import 'package:testeflutter/widgets/blue_button.dart';
import 'package:testeflutter/widgets/drawer_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Curso"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Tab 1",
                ),
                Tab(
                  text: "Tab 2",
                ),
                Tab(
                  text: "Tab 3",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _body(context),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.red,
              ),
            ],
          ),
          //usando um Widget qualquer para o Floating
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
          drawer: DrawerList()),
    );
  }

  _body(context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
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

  _img(text) {
    return Image.asset(
      text,
      fit: BoxFit.contain,
    );
  }

  _button(context, text, Function onPressed) {
    return BlueButton(text, onPressed);
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(builder: (context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("ListView",
                  () => _onClickNavigator(context, HelloListView())),
              BlueButton(
                  "Page2", () => _onClickNavigator(context, HelloPage2())),
              BlueButton(
                  "Page3", () => _onClickNavigator(context, HelloPage3())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("Snack", () => _onClickSnack(context)),
              BlueButton("Dialog", () => _onClickDialog(context)),
              BlueButton("Toast", () => _onClickToast()),
            ],
          ),
        ],
      );
    });
  }

  _onClickNavigator(context, Widget page) {
    push(context, page);
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: "Ok",
          onPressed: () {
            print("Ok!");
          },
        ),
        content: Text('Teste Snack'),
      ),
    );
  }

  _onClickDialog(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text('Flutter'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          ),
        );
      },
    );
  }

  _onClickToast() {
    return Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  onClickFab() {}
}
