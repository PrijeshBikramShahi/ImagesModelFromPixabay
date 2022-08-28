import 'package:flutter/material.dart';
import '../model/postmodel.dart';
import '../model/testmodel.dart';
import '../datafetch/postfetch.dart';
import '../variables/instapostvars.dart';

class InstaPost extends StatefulWidget {
  const InstaPost({Key? key}) : super(key: key);

  @override
  State<InstaPost> createState() => _InstaPostState();
}

class _InstaPostState extends State<InstaPost> {
  final List posts = [
    {
      "name": userName,
      "image": imageUrl,
    },
  ];

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final Hits _posts = posts[index];
          return Container(
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
                                    image: NetworkImage(imageUrl),
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
                  child: Image(image: NetworkImage(imageUrl)),
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: InkWell(
                                    onTap: favTap,
                                    child: Icon(
                                      iconType,
                                      color: favColor,
                                    ))),
                            Text(""),
                            Expanded(
                                child: InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.message,
                                      // color: favColor,
                                    ))),
                            Expanded(
                                child: InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.send_rounded,
                                    )))
                          ],
                        )
                      ],
                    ),
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
}
