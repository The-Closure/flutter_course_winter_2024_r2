// ignore_for_file: public_member_api_docs, sort_constructors_first
class CatModel {
  String id;
  String name;
  String color;
  String image;
  CatModel({
    required this.id,
    required this.name,
    required this.color,
    required this.image,
  });

  static CatModel fromMap(Map<String, dynamic> map) {
    return CatModel(
      id: map['id'],
      name: map['name'],
      color: map['color'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'color' : color,
      'image' : image,
    };
  }
}
