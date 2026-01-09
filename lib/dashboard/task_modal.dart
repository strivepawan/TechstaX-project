import 'package:flutter/material.dart';
import 'package:techstax/services/task_repository,.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final ValueChanged<bool> onToggle;

  const TaskTile({super.key, required this.task, required this.onDelete, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            if (value != null) {
              onToggle(value);
            }
          },
        ),
        title: Text(task.title, style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null)),
        subtitle: Text(
          task.isCompleted ? "Completed" : "Pending",
          style: TextStyle(color: task.isCompleted ? Colors.green : Colors.orange, fontWeight: FontWeight.w500),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
