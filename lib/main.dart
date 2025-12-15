import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/controller/task_controller.dart';
import 'package:task_manager_app/routes/routes.dart';
import 'package:task_manager_app/services/storage_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:task_manager_app/theme/app_theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await StorageService.init();

  Get.put(TaskController());

  runApp(const TaskManagerApp());

  FlutterNativeSplash.remove();
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,

      title: 'Task Manager App',
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
