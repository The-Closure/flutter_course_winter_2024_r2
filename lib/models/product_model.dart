// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);
class ProductModel {
  final int id;
  final String title;
  final String description;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "thumbnail": thumbnail,
      };
}
