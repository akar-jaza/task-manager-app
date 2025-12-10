import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task_manager_app/screens/home_screen.dart';
import 'package:task_manager_app/screens/splash_screen/splash_screen.dart';
import 'package:task_manager_app/screens/tasks_screen/add_task_screen.dart';
import 'package:task_manager_app/screens/tasks_screen/task_detail_screen.dart';

class Routes {
  static const splash = '/';
  static const tasksList = '/home';
  static const addTask = '/add';
  static const details = '/details';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => SplashView()),
    GetPage(name: Routes.tasksList, page: () => HomeView()),
    GetPage(name: Routes.addTask, page: () => AddTaskView()),
    GetPage(name: Routes.details, page: () => TaskDetailsView()),
  ];
}
