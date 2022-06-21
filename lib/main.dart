import 'package:flutter/material.dart';
import 'package:getallusersfromapi/show_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShowData(),
    );
  }
}
