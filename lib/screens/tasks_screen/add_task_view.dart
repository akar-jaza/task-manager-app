import 'package:flutter/material.dart';
import 'package:task_manager_app/widgets/appbar.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Task'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: .start,
            children: [
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  labelText: 'Task Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
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
                  onPressed: () {
                    // Handle task addition logic here
                  },
                  child: Text('Add Task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
