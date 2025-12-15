import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/controller/task_controller.dart';
import 'package:task_manager_app/model/task_model.dart';
import 'package:task_manager_app/theme/app_theme.dart';
import 'package:task_manager_app/widgets/appbar.dart';
import 'task_detail_view.dart';

class TasksView extends StatelessWidget {
  TasksView({super.key});

  final RxString searchQuery = "".obs;

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.find<TaskController>();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Tasks'),
      body: Obx(() {
        // Filter tasks by search
        List<Task> filtered = controller.tasks
            .where(
              (t) =>
                  t.title.toLowerCase().contains(
                    searchQuery.value.toLowerCase(),
                  ) ||
                  (t.description ?? "").toLowerCase().contains(
                    searchQuery.value.toLowerCase(),
                  ),
            )
            .toList();

        // Separate:
        List<Task> inProgress = filtered.where((t) => !t.completed).toList();
        List<Task> done = filtered.where((t) => t.completed).toList();

        return Column(
          children: [
            // ---------------- SEARCH BAR ----------------
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search tasks...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest,
                ),
                onChanged: (value) => searchQuery.value = value,
              ),
            ),

            const SizedBox(height: 10),

            // --------------- TASK LIST ----------------
            Expanded(
              child: filtered.isEmpty
                  ? const Center(
                      child: Text(
                        "No tasks found",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        // ---------------- IN PROGRESS ----------------
                        if (inProgress.isNotEmpty)
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "In Progress",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),

                        ...inProgress.map((t) => _taskItem(context, t)),

                        // ---------------- DONE SEPARATOR ----------------
                        if (done.isNotEmpty) ...[
                          const SizedBox(height: 20),
                          const Text(
                            "Completed Tasks",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],

                        // ---------------- DONE TASKS ----------------
                        ...done.map((t) => _taskItem(context, t)),
                      ],
                    ),
            ),
          ],
        );
      }),
    );
  }

  // ---------------- TASK CARD WIDGET ----------------
  Widget _taskItem(BuildContext context, Task t) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final cs = Theme.of(context).colorScheme;
    /**
     * appColors.success → use for “Done” text, icons, etc.
      appColors.successContainer → subtle background for done cards.
      appColors.warning → use for “In Progress” accents.
      appColors.warningContainer → subtle background for in-progress cards.
      cs.surface, cs.surfaceVariant, cs.onSurface → use for general surfaces and text.
     */

    // Use semantic container colors for card backgrounds
    final Color cardColor = t.completed
        ? appColors.successContainer
        : appColors.warningContainer;

    final titleColor = cs.onSurface; // readable title color
    final subtitleColor = cs.onSurface.withOpacity(0.75);

    final statusColor = t.completed ? appColors.success : appColors.warning;

    return GestureDetector(
      onTap: () => Get.to(() => TaskDetailsView(task: t)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: cs.shadow.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          title: Text(
            t.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (t.description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    t.description!,
                    style: TextStyle(fontSize: 16, color: subtitleColor),
                  ),
                ),
              const SizedBox(height: 6),
              Text(
                t.completed ? "Done" : "In Progress",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
              Text(
                "Created: ${t.createdAt.day}/${t.createdAt.month}/${t.createdAt.year}" +
                    (t.completed && t.doneAt != null
                        ? "\nDone: ${t.doneAt!.day}/${t.doneAt!.month}/${t.doneAt!.year}"
                        : ""),
                style: TextStyle(
                  fontSize: 12,
                  color: cs.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
          trailing: Icon(
            t.completed ? Icons.check_circle : Icons.radio_button_unchecked,
            color: statusColor,
            size: 28,
          ),
        ),
      ),
    );
  }
}
