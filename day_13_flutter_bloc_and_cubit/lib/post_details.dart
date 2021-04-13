import 'package:day_12_flutter_bloc_and_cubit/post.dart';
import 'package:flutter/material.dart';
class PostDetailsView extends StatelessWidget {
  final Post post;
  PostDetailsView({Key key, @required this.post}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Center(
        child: Text(
          post.body
        ),
      ),
    );
  }
}
