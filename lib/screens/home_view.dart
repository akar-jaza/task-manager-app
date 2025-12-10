import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task_manager_app/controller/nav_controller.dart';
import 'package:task_manager_app/screens/tasks_screen/add_task_view.dart';
import 'package:task_manager_app/screens/tasks_screen/task_detail_view.dart';
import 'package:task_manager_app/screens/tasks_screen/tasks_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final NavController nav = Get.put(NavController());
  final List<Widget> pages = [TasksView(), AddTaskView(), TaskDetailsView()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: nav.index.value, // keeps each page alive
          children: pages,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: nav.index.value, // <--- wire selected index
          onDestinationSelected: nav.changeIndex,
          destinations: [
            NavigationDestination(icon: Icon(Icons.list_alt), label: 'Tasks'),
            NavigationDestination(
              icon: Icon(Icons.add_circle_outline),
              label: 'Add',
            ),
            NavigationDestination(
              icon: Icon(Icons.info_outline),
              label: 'Details',
            ),
          ],
        ),
      ),
    );
  }
}
