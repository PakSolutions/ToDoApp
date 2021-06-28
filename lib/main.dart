import 'package:flutter/material.dart';
import 'package:todoapp/ToDo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: Text("My ToDo App"),),
        body: ToDo(),
      )
    );
  }
}