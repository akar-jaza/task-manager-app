import 'package:flutter/material.dart';
import 'package:task_manager_app/widgets/appbar.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Task Details'),
      body: Center(
        child: Text('Task Detail Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
