import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insta_server/datafetch/postfetch.dart';

import 'package:insta_server/model/postmodel.dart';
import 'package:insta_server/utils/appbarsection.dart';
import 'package:insta_server/utils/instastory.dart';
import 'package:insta_server/utils/thepost.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            child: InstaBar(), preferredSize: Size.fromHeight(5.0)),
        // flexibleSpace:,
      ),
      body: DataFetchInstaPost(),
    );
  }
}
