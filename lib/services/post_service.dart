import 'package:bloc_session_2/models/post_model.dart';
import 'package:dio/dio.dart';

class PostService {
  Future<List<PostModel>?> getAllPost() async {
    Dio dio = Dio();
    try {
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        List<PostModel> posts = List.generate(
          response.data.length,
          (index) => PostModel.fromMap(
            response.data[index],
          ),
        );
        return posts;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
