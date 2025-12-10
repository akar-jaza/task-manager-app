import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/controller/nav_controller.dart';
import 'package:task_manager_app/controller/task_controller.dart';
import 'package:task_manager_app/model/task_model.dart';
import 'package:task_manager_app/widgets/appbar.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final TaskController _taskController = Get.find<TaskController>();
  final NavController _navController = Get.find<NavController>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Task'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Task Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Task Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButtonTheme(
                data: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    final title = _titleController.text.trim();
                    final description = _descriptionController.text.trim();

                    if (title.isEmpty) {
                      Get.snackbar(
                        'Error',
                        'Title is required',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        duration: const Duration(seconds: 2),
                      );
                      return;
                    }

                    final task = Task(
                      title: title,
                      description: description.isEmpty ? null : description,
                    );

                    _taskController.addTask(task);

                    // Clear the text fields
                    _titleController.clear();
                    _descriptionController.clear();

                    // Show success snackbar
                    Get.snackbar(
                      'Success',
                      'Task added successfully',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      duration: const Duration(seconds: 2),
                    );

                    // Switch to Tasks view after a short delay to show the snackbar
                    Future.delayed(const Duration(milliseconds: 500), () {
                      _navController.changeIndex(0); // Switch to Tasks view
                    });
                  },
                  child: const Text('Add Task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
