import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:insta_server/model/testmodel.dart';
import 'package:insta_server/utils/thepost.dart';
import 'package:http/http.dart' as http;
import '../model/postmodel.dart';
import '../variables/instapostvars.dart';

class DataFetchInstaPost extends StatefulWidget {
  const DataFetchInstaPost({Key? key}) : super(key: key);

  @override
  State<DataFetchInstaPost> createState() => _DataFetchInstaPostState();
}

class _DataFetchInstaPostState extends State<DataFetchInstaPost> {
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  // String bodyText = "this is body";
  List<Hits> posts = [];

  fetchDataFromServer() async {
    final serverLocation =
        "https://pixabay.com/api/?key=17082254-e9c4d9fe859875b824e271a7a&q=yellow+flowers&image_type=photo&pretty=true";

    final uri = Uri.parse(serverLocation);
    // print("$serverLocation");
    var response = http.get(uri);
    setState(() {});
    response.then((res) {
      // print(res.statusCode);
      final decoded = json.decode(res.body)['hits'];
      posts = decoded.map<Hits>((item) {
        final convertedItem = Hits.covertPostsFromJson(item);
        return convertedItem;
      }).toList();
      // print(res.body);
      setState(() {});
    });
    response.catchError((e) {
      print(e);
      setState(() {});
    });

    // try {
    //   final response2 = await http.get(uri);
    //   print(response2.statusCode);
    // } catch (e) {
    //   print(e);
    // }
    // print("2");
  }

  favTap() {
    isFavTapped = !isFavTapped;

    if (isFavTapped) {
      iconType = Icons.favorite;
      favColor = Colors.red;
      setState(() {});
    } else {
      favColor = Colors.black;
      iconType = Icons.favorite_border_outlined;
      setState(() {});
    }
  }

  bookTap() {
    isBookTapped = !isBookTapped;

    if (isBookTapped) {
      bookColor = Colors.yellow;
      setState(() {});
    } else {
      bookColor = Colors.black;

      setState(() {});
    }
  }

  ScrollController controllerscroll = ScrollController();
  Widget buildList() {
    return ListView.builder(
        // controller: controllerscroll,
        physics: BouncingScrollPhysics(),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final Hits _posts = posts[index];
          return Container(
            padding: EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      Row(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(_posts.userImageURL,
                                        scale: 1),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          _posts.user,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ]),
                    ]),
                    Column(children: [
                      Icon(
                        Icons.more_vert,
                      )
                    ]),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Image(
                    image: NetworkImage(
                      _posts.largeImageURL,
                    ),

                    //
                  ),
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: favTap,
                                child: Icon(
                                  iconType,
                                  color: favColor,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(_posts.views.toString()),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.message,
                                  // color: favColor,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(_posts.likes.toString()),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.send_rounded,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(_posts.comments.toString()),
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: bookTap,
                              child: Icon(
                                Icons.bookmark,
                                color: bookColor,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              )
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarcen(),w
      body: buildList(),
    );
  }
}
