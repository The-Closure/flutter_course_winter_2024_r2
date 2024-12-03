import 'package:dio/dio.dart';
import 'package:rest_api_round_2/models/cat_model.dart';

Future<List<CatModel>> getAllCats() async {
  Dio dio = Dio();
  List<CatModel> cats = [];
  try {
    Response response =
        await dio.get('https://674f2795bb559617b26e4185.mockapi.io/cat');
    if (response.statusCode == 200) {
      for (var i = 0; i < response.data.length; i++) {
        CatModel cat = CatModel.fromMap(response.data[i]);
        cats.add(cat);
      }
      return cats;
    } else {
      return [
        CatModel(
          id: "-1",
          name: "name",
          color: "color",
          image:
              "https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/846a2783-f3df-488d-8d04-19bc0ffa44c1/81c971bb-a5eb-4f0d-8716-67c23a93f895.png",
        ),
      ];
    }
  } catch (e) {
    print(e);
    return [
      CatModel(
        id: "-1",
        name: "name",
        color: "color",
        image:
            "https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/846a2783-f3df-488d-8d04-19bc0ffa44c1/81c971bb-a5eb-4f0d-8716-67c23a93f895.png",
      ),
    ];
  }
}

Future<bool> createOneCat({required CatModel newCat}) async {
  Dio dio = Dio();
  try {
    Response response = await dio.post(
      'https://674f2795bb559617b26e4185.mockapi.io/cat',
      data: newCat.toMap(),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
