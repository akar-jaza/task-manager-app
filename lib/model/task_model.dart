import 'package:uuid/uuid.dart';

class Task {
  String id;
  String title;
  String? description;
  bool completed;

  Task({
    String? id,
    required this.title,
    this.description,
    this.completed = false,
  }) : id = id ?? Uuid().v4();

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'completed': completed,
  };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    completed: json['completed'] ?? false,
  );
}
