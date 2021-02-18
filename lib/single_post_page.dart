import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:chopper_http/api/post_api_service.dart';
import 'package:chopper_http/models/built_post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SinglePostPage extends StatelessWidget {
  final int postId;

  SinglePostPage({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chopper Blog'),
      ),
      body: FutureBuilder<Response<BuiltPost>>(
        future: Provider.of<PostAPIService>(context).getPost(postId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final post = snapshot.data.body;
            return _buildPost(post);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget _buildPost(BuiltPost post) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Column(
      children: [
        Text(
          post.title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(post.body),
      ],
    ),
  );
}
