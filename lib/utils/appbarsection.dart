import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InstaBar extends StatefulWidget {
  const InstaBar({Key? key}) : super(key: key);

  @override
  State<InstaBar> createState() => _InstaBarState();
}

class _InstaBarState extends State<InstaBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("Instagram"),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Icon(Icons.arrow_drop_down_rounded)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(onTap: () {}, child: Icon(Icons.favorite_border)),
                    SizedBox(
                      width: 25,
                    ),
                    InkWell(onTap: () {}, child: Icon(Icons.message)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
