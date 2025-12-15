// lib/screens/tasks_screen/task_details_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/controller/task_controller.dart';
import 'package:task_manager_app/model/task_model.dart';
import 'package:task_manager_app/theme/app_theme.dart';
import 'package:task_manager_app/widgets/appbar.dart';

class TaskDetailsView extends StatelessWidget {
  final Task task;

  const TaskDetailsView({super.key, required this.task});

  Color _foregroundFor(Color background) {
    // simple readable-contrast helper
    return background.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.find<TaskController>();
    final cs = Theme.of(context).colorScheme;
    final appColors = Theme.of(context).extension<AppColors>()!;

    final titleColor = cs.onSurface;
    final subtitleColor = cs.onSurface.withOpacity(0.75);
    final statusColor = task.completed ? appColors.success : appColors.warning;
    final statusTextColor = _foregroundFor(statusColor);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Task Details'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  CrossAxisAlignment.center, // center horizontally
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  task.description ?? "No description",
                  style: TextStyle(fontSize: 18, color: subtitleColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  "Status: ${task.completed ? "Done" : "In Progress"}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Created: ${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year}",
                  style: TextStyle(fontSize: 16, color: subtitleColor),
                  textAlign: TextAlign.center,
                ),
                if (task.completed && task.doneAt != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    "Done: ${task.doneAt!.day}/${task.doneAt!.month}/${task.doneAt!.year}",
                    style: TextStyle(fontSize: 16, color: appColors.success),
                    textAlign: TextAlign.center,
                  ),
                ],
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
                        backgroundColor: appColors.success,
                        colorText: _foregroundFor(appColors.success),
                        duration: const Duration(seconds: 2),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColors.success,
                      foregroundColor: _foregroundFor(appColors.success),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Mark as Done"),
                  ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    controller.removeTask(task.id);
                    Get.back();
                    Get.snackbar(
                      "Deleted",
                      "Task removed",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: cs.error,
                      colorText: cs.onError,
                      duration: const Duration(seconds: 2),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cs.error,
                    foregroundColor: cs.onError,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("Delete Task"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
