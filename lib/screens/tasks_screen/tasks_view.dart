import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/controller/task_controller.dart';
import 'package:task_manager_app/model/task_model.dart';
import 'package:task_manager_app/widgets/appbar.dart';
import 'task_detail_view.dart';

class TasksView extends StatelessWidget {
  TasksView({super.key});

  final TaskController controller = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Tasks'),
      body: Obx(
        () {
          if (controller.tasks.isEmpty) {
            return const Center(
              child: Text(
                "No tasks yet",
                style: TextStyle(fontSize: 22, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              Task t = controller.tasks[index];

              // Background color based on status
              Color cardColor = t.completed ? Colors.green.shade50 : Colors.orange.shade50;

              return GestureDetector(
                onTap: () {
                  Get.to(() => TaskDetailsView(task: t));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    title: Text(
                      t.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (t.description != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              t.description!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        const SizedBox(height: 6),
                        Text(
                          t.completed ? "Done" : "In Progress",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: t.completed ? Colors.green : Colors.orange,
                          ),
                        ),
                        Text(
  "Created: ${t.createdAt.day}/${t.createdAt.month}/${t.createdAt.year}" +
      (t.completed && t.doneAt != null
          ? "\nDone: ${t.doneAt!.day}/${t.doneAt!.month}/${t.doneAt!.year}"
          : ""),
  style: const TextStyle(fontSize: 12, color: Colors.black45),
),
                      ],
                    ),
                    trailing: Icon(
                      t.completed ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: t.completed ? Colors.green : Colors.orange,
                      size: 28,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
