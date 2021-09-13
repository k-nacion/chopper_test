import 'package:chopper_test/model/post.dart' as model;
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final model.Post post;

  const Post({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(.3), width: 1.2),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            post.title,
            style: TextStyle(
              color: Colors.black.withOpacity(.5),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            post.body,
            style: TextStyle(fontSize: 19),
          ),
        ],
      ),
    );
  }
}
