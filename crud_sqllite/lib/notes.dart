import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotesModel {
  final int? id;
  final String title;
  final int age;
  final String description;
  final String email;
  NotesModel({
    this.id,
    required this.title,
    required this.age,
    required this.description,
    required this.email,
  });

  NotesModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        title = res['title'],
        age = res['age'],
        description = res['description'],
        email = res['email'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'age': age,
      'description': description,
      'email': email,
    };
  }
}
