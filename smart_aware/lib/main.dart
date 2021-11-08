import 'package:flutter/material.dart';
import 'package:smart_aware/navigation/about.dart';
import 'navigation/landing.dart';
import 'navigation/analysis.dart';
import 'navigation/predict.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartAware',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext ctx) => Landing(),
        '/analysis': (BuildContext ctx) => Analysis(),
        '/predict': (BuildContext ctx) => Predict("1"),
        '/about': (BuildContext ctx) => About(),
      },
    );
  }
}
