import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatelessWidget {
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
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.grid_on,
              color: Colors.white,
            ),
            onPressed: () {},
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

    return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 300,
      itemBuilder: (context, index) {
        Dog dog = dogs[index];

        return Stack(
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
        );
      },
    );
  }

  _img(text) {
    return Image.asset(
      text,
      fit: BoxFit.cover,
    );
  }
}
