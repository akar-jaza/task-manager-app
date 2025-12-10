import 'package:flutter/material.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Task Detail Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
