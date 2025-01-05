import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:something/core/config/di.dart';
import 'package:something/model/profile_model.dart';

class ProfileService {
  Future<ProfileModel> getProfile() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        'https://dummyjson.com/auth/me',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${sl.get<SharedPreferences>().getString('token')}'
          },
        ),
      );
      if (response.statusCode == 200) {
        ProfileModel profileModel = ProfileModel.fromJson(response.data);
        return profileModel;
      } else {
        throw Exception('check internet connection');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
