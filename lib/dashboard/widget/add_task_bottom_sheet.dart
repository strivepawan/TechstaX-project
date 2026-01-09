import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  final Future<void> Function(String title) onSubmit;

  const AddTaskBottomSheet({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    String title = '';

    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, bottom: MediaQuery.of(context).viewInsets.bottom + 30, top: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Create New Task", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 20),
          TextField(
            onChanged: (v) => title = v,
            decoration: const InputDecoration(hintText: "What needs to be done?", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () async {
                if (title.trim().isEmpty) return;
                await onSubmit(title.trim());
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text("Add Task"),
            ),
          ),
        ],
      ),
    );
  }
}
