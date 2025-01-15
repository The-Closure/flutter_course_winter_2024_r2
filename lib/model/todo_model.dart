// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  String? title;
  num? userId;
  TodoModel({
    required this.title,
    required this.userId,
  });

  TodoModel copyWith({
    String? title,
    num? userId,
  }) {
    return TodoModel(
      title: title ?? this.title,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'userId': userId,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'] ,
      userId: map['userId'] ,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) => TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TodoModel(title: $title, userId: $userId)';

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.userId == userId;
  }

  @override
  int get hashCode => title.hashCode ^ userId.hashCode;
}
