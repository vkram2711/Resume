import 'package:flutter/material.dart';
import 'app_body.dart';

//TODO: achievements, git, change top bar, listview generate
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const AppBody(false),
        '/u': (context) => const AppBody(true),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'ProximaNova',
          backgroundColor: Colors.black,
          splashColor: Colors.yellow[600],
          secondaryHeaderColor: Colors.white,
          primaryColor: Colors.grey[400]),
    );
  }
}
