import 'package:flutter/material.dart';
import 'package:task_manager_app/widgets/appbar.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Tasks'),
      body: Center(child: Text('Tasks Screen', style: TextStyle(fontSize: 24))),
    );
  }
}
