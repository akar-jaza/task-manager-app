import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/controller/task_controller.dart';
import 'package:task_manager_app/model/task_model.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final Task task = Get.arguments;
    final TaskController taskController = Get.find<TaskController>();

    Widget statusButton(String text, Color color, String status) {
      return InkWell(
        onTap: () {
          taskController.updateTaskStatus(task.id, status);
          Get.back(result: status);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              CircleAvatar(radius: 8, backgroundColor: color),
              const SizedBox(width: 12),
              Text(text, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title: ${task.title}", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            if (task.description != null)
              Text("Description: ${task.description!}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 30),

            statusButton("Mark as In Progress", Colors.orange, "orange"),
            statusButton("Mark as Done", Colors.blue, "blue"),

            InkWell(
              onTap: () {
                taskController.removeTask(task.id);
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.delete, color: Colors.red, size: 18),
                    SizedBox(width: 12),
                    Text("Delete Task", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
