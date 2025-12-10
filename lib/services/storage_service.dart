import 'package:get_storage/get_storage.dart';
import 'package:task_manager_app/model/task_model.dart';

class StorageService {
  static late GetStorage box;

  static Future init() async {
    await GetStorage.init();
    box = GetStorage();
  }

  static void saveTasks(List tasks) {
    final json = tasks.map((t) => (t as Task).toJson()).toList();
    box.write('tasks', json);
  }

  static List<Task>? readTasks() {
    final json = box.read('tasks');
    if (json == null) return null;
    return (json as List)
        .map((e) => Task.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
