import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'library_controller.dart';

class LibraryPage extends StatefulWidget {
  final String title;
  const LibraryPage({Key key, this.title = "Library"}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends ModularState<LibraryPage, LibraryController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Theme Dark'),
              onPressed: () {
                //Modular.get<AppController>().setThemeData(ThemeMode.dark);
              },
            ),
            RaisedButton(
              child: Text('Theme Ligth'),
              onPressed: () {
                //Modular.get<AppController>().setThemeData(ThemeMode.light);
              },
            ),
            Image.network(
              "https://i0.wp.com/www.jornadageek.com.br/wp-content/uploads/2020/05/Imagem-da-s%C3%A9rie-Dark.jpg",
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
