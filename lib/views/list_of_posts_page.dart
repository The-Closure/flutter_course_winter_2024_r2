import 'package:flutter/material.dart';
import 'package:rest_api_round_2/models/post_model.dart';
import 'package:rest_api_round_2/services/post_service.dart';

class ListOfPostsPage extends StatelessWidget {
  const ListOfPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: FutureBuilder(
        future: getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PostModel> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      posts[index].id.toString(),
                    ),
                  ),
                  title: Text(posts[index].title),
                  subtitle: Text(posts[index].body),
                );
              },
            );
          }
          //  else if (snapshot.hasError) {
          //   return const Center(
          //     child: Text('Check internet connection'),
          //   );
          // }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
