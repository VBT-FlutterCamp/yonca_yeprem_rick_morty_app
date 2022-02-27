import 'package:flutter/material.dart';
import 'feature/rickmorty/rickmorty.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick And Monty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RickMorty(),
    );
  }
}
