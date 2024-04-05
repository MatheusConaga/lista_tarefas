import 'package:flutter/material.dart';
import 'package:lista_tarefas/telas/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key?key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarefas',
      home: Home(),
      );
  }
}