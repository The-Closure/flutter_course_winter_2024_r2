import 'package:bloc_session_2/blocs/post_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc()..add(GetAllPosts()),
      child: Builder(builder: (context) {
        return Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     context.read<PostBloc>().add(GetAllPosts());
          //   },
          //   child: const Icon(
          //     Icons.restore_page,
          //   ),
          // ),
          body: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostSuccess) {
                return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.posts[index].title),
                        subtitle: Text(state.posts[index].body),
                        leading: CircleAvatar(
                          child: Text(
                            state.posts[index].id.toString(),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is PostError) {
                return  Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
