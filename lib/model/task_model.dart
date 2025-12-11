import 'package:uuid/uuid.dart';

class Task {
  String id;
  String title;
  String? description;
  bool completed;
  DateTime createdAt;
  DateTime? doneAt; // <-- new field

  Task({
    String? id,
    required this.title,
    this.description,
    this.completed = false,
    DateTime? createdAt,
    this.doneAt,
  })  : id = id ?? Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'completed': completed,
        'createdAt': createdAt.toIso8601String(),
        'doneAt': doneAt?.toIso8601String(),
      };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        completed: json['completed'] ?? false,
        createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
        doneAt: json['doneAt'] != null ? DateTime.parse(json['doneAt']) : null,
      );
}
