import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:something/core/config/di.dart';
import 'package:something/model/user_model.dart';

class AuthService {
  Future<Map<String, dynamic>> login({required UserModel usermodel}) async {
    Dio dio = Dio();
    try {
      Response response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: usermodel.toMap(),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('something went wrong');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
