import 'package:flutter/material.dart';
import 'package:techstax/dashboard/task_tile.dart';
import 'package:techstax/services/task_repository,.dart';
import 'package:techstax/widget/empty_state_text.dart';

class TaskListSection extends StatelessWidget {
  final List<Task> tasks;
  final Future<void> Function(Task) onDelete;
  final Future<void> Function(Task, bool) onToggle;

  const TaskListSection({super.key, required this.tasks, required this.onDelete, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const SliverFillRemaining(child: PremiumEmptyState());
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final task = tasks[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: TaskTile(task: task, onDelete: () => onDelete(task), onToggle: (v) => onToggle(task, v)),
        );
      }, childCount: tasks.length),
    );
  }
}
