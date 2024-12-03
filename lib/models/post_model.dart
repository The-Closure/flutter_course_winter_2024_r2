
class PostModel {
  int id;
  String title;
  String body;
  PostModel({
    required this.id,
    required this.title,
    required this.body,
  });

  static PostModel fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}