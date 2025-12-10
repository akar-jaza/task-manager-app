import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
