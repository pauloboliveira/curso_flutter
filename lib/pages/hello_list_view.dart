import 'package:flutter/material.dart';
import 'package:testeflutter/pages/dog_page.dart';
import 'package:testeflutter/utils/nav.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.list,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.grid_on,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _gridView = true;
              });
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Filhote", "assets/images/dog1.png"),
      Dog("Golden", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rotweiller", "assets/images/dog4.png"),
    ];

    if (!_gridView) {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 300,
        itemBuilder: (context, index) {
          Dog dog = dogs[index];

          return GestureDetector(
            onTap: () {
              push(context, DogPage(dog));
            },
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _img(dog.foto),
                Container(
                  margin: EdgeInsets.all(12),
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      dog.nome,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    } else {
      return GridView.builder(
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          Dog dog = dogs[index];

          return GestureDetector(
            onTap: () {
              push(context, DogPage(dog));
            },
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _img(dog.foto),
                Container(
                  margin: EdgeInsets.all(12),
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      dog.nome,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      );
    }
  }

  _img(text) {
    return Image.asset(
      text,
      fit: BoxFit.cover,
    );
  }
}
