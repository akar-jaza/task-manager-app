import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/routes/routes.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Manager App',
      initialRoute: Routes.home_view,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
