import 'package:dio/dio.dart';

class CatService {
  String sound() {
    return "Hello World";
  }
}

class UserService {
  final Dio dio;
  UserService({required this.dio});
  getData() {
    dio.get("path");
  }
}
