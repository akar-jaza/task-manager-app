import 'package:flutter/material.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Add Task Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
