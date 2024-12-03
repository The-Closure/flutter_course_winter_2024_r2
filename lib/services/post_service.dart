import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_round_2/models/post_model.dart';

Future<PostModel> getOnePostWithDio() async {
  final Dio dio = Dio();
  Response response =
      await dio.get('https://jsonplaceholder.typicode.com/posts/1');
  PostModel post = PostModel.fromMap(response.data);
  return post;
}

Future<List<PostModel>> getAllPosts() async {
  Dio dio = Dio();
  List<PostModel> posts = [];
  try {
    Response response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      for (var i = 0; i < response.data.length; i++) {
        PostModel post = PostModel.fromMap(response.data[i]);
        posts.add(post);
      }
      return posts;
    } else {
      return [
        PostModel(id: -1, title: 'Exception', body: 'check internet connection'),
      ];
    }
  } catch (e) {
    print(e);
      return [
        PostModel(id: -1, title: 'Exception', body: 'check internet connection'),
      ];
  }
}




// ! use it if you want to get data with http package
// Future<dynamic> getOnePostWithHttp() async {
//   Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
//   var response = await http.get(uri);
//   Map<String, dynamic> dataMap = jsonDecode(response.body);
//   return dataMap;
// }
