import 'package:flutter/material.dart';

class PremiumEmptyState extends StatelessWidget {
  const PremiumEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(color: const Color(0xFFF0F0FF), shape: BoxShape.circle),
            child: const Icon(Icons.task_alt_rounded, size: 60, color: Color(0xFF6C63FF)),
          ),
          const SizedBox(height: 32),
          const Text(
            "No tasks yet",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFF2D2D2D)),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Start organizing your work by adding your first task. Click the button below to begin!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, height: 1.5, color: Color(0xFF6B7280)),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF6C63FF), Color(0xFF8B84FF)]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_rounded, color: Color(0xFF6C63FF), size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Create First Task",
                    style: TextStyle(color: Color(0xFF6C63FF), fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
