import 'package:flutter/material.dart';

class TaskProgressCard extends StatelessWidget {
  final int completed;
  final int total;

  const TaskProgressCard({super.key, required this.completed, required this.total});

  @override
  Widget build(BuildContext context) {
    final progress = total > 0 ? completed / total : 0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF6C63FF), Color(0xFF8B84FF)]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Today's Progress", style: TextStyle(color: Colors.white)),
          const SizedBox(height: 12),
          LinearProgressIndicator(value: progress.toDouble(), backgroundColor: Colors.white24, color: Colors.white),
          const SizedBox(height: 12),
          Text("$completed / $total completed", style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
