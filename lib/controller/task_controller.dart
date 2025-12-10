import 'package:get/get.dart';
import 'package:task_manager_app/model/task_model.dart';
import 'package:task_manager_app/services/storage_service.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() {
    final saved = StorageService.readTasks();
    if (saved != null) tasks.assignAll(saved);
  }

  void addTask(Task t) {
    tasks.add(t);
    StorageService.saveTasks(tasks);
  }

  void removeTask(String id) {
    tasks.removeWhere((t) => t.id == id);
    StorageService.saveTasks(tasks);
  }

  void updateTask(Task updated) {
    final idx = tasks.indexWhere((t) => t.id == updated.id);
    if (idx != -1) tasks[idx] = updated;
    StorageService.saveTasks(tasks);
  }
}
