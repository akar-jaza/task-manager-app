import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task_manager_app/screens/home_view.dart';
import 'package:task_manager_app/screens/splash_screen/splash_view.dart';
import 'package:task_manager_app/screens/tasks_screen/add_task_view.dart';
//import 'package:task_manager_app/screens/tasks_screen/task_detail_view.dart';

class Routes {
  static const splash = '/';
  static const homeView = '/home';
  static const tasksList = '/tasks-list';
  static const addTask = '/add';
  //static const details = '/details';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => SplashView()),
    GetPage(name: Routes.homeView, page: () => HomeView()), 
    GetPage(name: Routes.tasksList, page: () => HomeView()),
    GetPage(name: Routes.addTask, page: () => AddTaskView()),
    //GetPage(name: Routes.details, page: () => TaskDetailsView()),
  ];
}
