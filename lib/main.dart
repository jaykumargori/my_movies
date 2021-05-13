import 'package:flutter/material.dart';
import 'package:my_movies/views/homecreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Movies',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Test(),
      debugShowCheckedModeBanner: false,
    );
  }
}
