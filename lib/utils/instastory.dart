import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InstaStory extends StatefulWidget {
  const InstaStory({Key? key}) : super(key: key);

  @override
  State<InstaStory> createState() => _InstaStoryState();
}

class _InstaStoryState extends State<InstaStory> {
  static final String imageUrl =
      "https://cdn.pixabay.com/photo/2022/07/31/20/00/little-boy-7356705_960_720.jpg";
  // String userName = "";

  final List items = [
    {
      "username": "iamram",
      "ppUrl": imageUrl,
    },
    {
      "username": "iamram",
      "ppUrl": imageUrl,
    },
    {
      "username": "iamram",
      "ppUrl": imageUrl,
    },
    {
      "username": "iamram",
      "ppUrl": imageUrl,
    },
    {
      "username": "iamram",
      "ppUrl": imageUrl,
    },
    {
      "username": "iamram",
      "ppUrl": imageUrl,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column();
        });
  }
}
