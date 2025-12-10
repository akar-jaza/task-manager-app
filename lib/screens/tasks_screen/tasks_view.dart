import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/controller/task_controller.dart';
import 'package:task_manager_app/model/task_model.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final TaskController _taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      body: Obx(() {
        final tasks = _taskController.tasks;

        if (tasks.isEmpty) {
          return const Center(child: Text("No tasks yet"));
        }

        // Sort: orange first, green second, blue last
        final sortedTasks = tasks.toList()
          ..sort((a, b) {
            int order(String status) {
              switch (status) {
                case "orange":
                  return 0;
                case "green":
                  return 1;
                case "blue":
                  return 2;
                default:
                  return 1;
              }
            }

            return order(a.status).compareTo(order(b.status));
          });

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: sortedTasks.length,
          itemBuilder: (context, index) {
            final task = sortedTasks[index];

            Color circleColor;
            switch (task.status) {
              case "orange":
                circleColor = Colors.orange;
                break;
              case "blue":
                circleColor = Colors.blue;
                break;
              default:
                circleColor = Colors.green;
            }

            return Card(
              child: ListTile(
                leading: CircleAvatar(radius: 10, backgroundColor: circleColor),
                title: Text(task.title),
                subtitle: task.description != null ? Text(task.description!) : null,
                onTap: () async {
                  final result = await Get.toNamed('/details', arguments: task);

                  if (result != null && (result == "orange" || result == "blue")) {
                    _taskController.updateTaskStatus(task.id, result);
                  }
                },
              ),
            );
          },
        );
      }),
    );
  }
}
