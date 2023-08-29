import 'package:appname/pages/slide_vertical.dart';
import 'package:appname/router/router.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App Flutter",
      home: VerticalSlideScreen(),
    );
  }
}


