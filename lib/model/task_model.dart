import 'package:uuid/uuid.dart';

class Task {
  String id;
  String title;
  String? description;
  String category;
  int priority; // 0 low, 1 medium, 2 high
  bool completed;

  Task({
    String? id,
    required this.title,
    this.description,
    this.category = 'General',
    this.priority = 1,
    this.completed = false,
  }) : id = id ?? Uuid().v4();

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'category': category,
    'priority': priority,
    'completed': completed,
  };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    category: json['category'] ?? 'General',
    priority: json['priority'] ?? 1,
    completed: json['completed'] ?? false,
  );
}
