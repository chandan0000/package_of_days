import 'package:flutter/material.dart';
import 'package:multirolebased/homescreen.dart';
import 'package:multirolebased/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: Homescreen(),
        home: const Splashscreen());
  }
}
