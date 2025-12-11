import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/controller/task_controller.dart';
import 'package:task_manager_app/model/task_model.dart';
import 'package:task_manager_app/widgets/appbar.dart';

class TaskDetailsView extends StatelessWidget {
  final Task task;

  const TaskDetailsView({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.find<TaskController>();

    return Scaffold(
      appBar: CustomAppBar(title: 'Task Details'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // center horizontally
          children: [
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              task.description ?? "No description",
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "Status: ${task.completed ? "Done" : "In Progress"}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: task.completed ? Colors.green : Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Created: ${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            if (task.completed && task.doneAt != null)
              Text(
                "Done: ${task.doneAt!.day}/${task.doneAt!.month}/${task.doneAt!.year}",
                style: const TextStyle(fontSize: 16, color: Colors.green),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 30),
            if (!task.completed)
              ElevatedButton(
                onPressed: () {
                  task.completed = true;
                  task.doneAt = DateTime.now();
                  controller.updateTask(task);
                  Get.back();
                  Get.snackbar(
                    "Success",
                    "Task marked as done",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                    duration: const Duration(seconds: 2),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Mark as Done"),
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controller.removeTask(task.id);
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Delete Task"),
            ),
          ],
        ),
      ),
    );
  }
}
