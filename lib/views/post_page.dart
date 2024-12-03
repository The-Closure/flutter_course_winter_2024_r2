import 'package:flutter/material.dart';
import 'package:rest_api_round_2/models/post_model.dart';
import 'package:rest_api_round_2/services/post_service.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        // * use it if you want to get data with dio package
        future: getOnePostWithDio(),
        // ! use it if you want to get data with http package
        // future: getOnePostWithHttp(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            PostModel post = snapshot.data!;
            return ListTile(
              leading: CircleAvatar(
                child: Text(post.id.toString()),
              ),
              title: Text(post.title),
              subtitle: Text(post.body),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
