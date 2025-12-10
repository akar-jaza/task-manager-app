class Task {
  String id;
  String title;
  String? description;
  String status; // "green", "orange", "blue"

  Task({
    required this.title,
    this.description,
    String? id,
    this.status = "green",
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'status': status,
      };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        status: json['status'] ?? "green",
      );
}
