import 'package:flutter/material.dart';
import 'package:insta_server/Homepage.dart';
import 'package:insta_server/datafetch/postfetch.dart';
import 'package:insta_server/utils/thepost.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataFetchInstaPost(),
    );
  }
}
