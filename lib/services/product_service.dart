import 'package:bloc_session_2/models/product_model.dart';
import 'package:dio/dio.dart';

class ProductService {
  Dio dio = Dio();

  Future<List<ProductModel>?> getAllProducts() async {
    try {
      Response response = await dio.get('https://dummyjson.com/products');
      if (response.statusCode == 200) {
        List<ProductModel> products = List.generate(
          response.data['products'].length,
          (index) => ProductModel.fromMap(response.data['products'][index]),
        );
        return products;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
