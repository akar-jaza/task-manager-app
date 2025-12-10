import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/screens/home_screen.dart';

void main() {
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: HomeScreen());
  }
}
