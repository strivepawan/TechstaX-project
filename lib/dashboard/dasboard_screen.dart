// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:techstax/auth/login_screen.dart';
// import 'package:techstax/services/task_repository,.dart';
// import 'package:techstax/widget/empty_state_text.dart';

// import '../auth/auth_service.dart';
// import '../services/supabase_service.dart';
// import 'task_tile.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   final SupabaseService service = SupabaseService();
//   List<Task> tasks = [];
//   bool loading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadTasks();
//   }

//   Future<void> _loadTasks() async {
//     final userId = context.read<AuthService>().userId;
//     final result = await service.fetchTasks(userId);

//     if (!mounted) return;

//     setState(() {
//       tasks = result;
//       loading = false;
//     });
//   }

//   void _addTask() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
//       ),
//       builder: (_) {
//         String title = '';
//         return Padding(
//           padding: EdgeInsets.only(
//             left: 24,
//             right: 24,
//             bottom: MediaQuery.of(context).viewInsets.bottom + 30,
//             top: 24,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Create New Task",
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xFF2D2D2D),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: const Icon(Icons.close_rounded, size: 24),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   border: Border.all(color: const Color(0xFFE8E8E8), width: 1.5),
//                   boxShadow: [
//                     BoxShadow(
//                       // ignore: deprecated_member_use
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 8,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   onChanged: (v) => title = v,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   decoration: const InputDecoration(
//                     hintText: "What needs to be done?",
//                     hintStyle: TextStyle(
//                       color: Color(0xFFA0A0A0),
//                       fontWeight: FontWeight.w400,
//                     ),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 18,
//                     ),
//                   ),
//                   maxLines: 3,
//                   minLines: 1,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Container(
//                 width: double.infinity,
//                 height: 56,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFF6C63FF), Color(0xFF4A42D6)],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                   ),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color(0xFF6C63FF).withOpacity(0.3),
//                       blurRadius: 12,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     if (title.trim().isEmpty) return;

//                     await service.addTask(
//                       title.trim(),
//                       context.read<AuthService>().userId,
//                     );

//                     if (!mounted) return;
//                     Navigator.pop(context);
//                     _loadTasks();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     shadowColor: Colors.transparent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   ),
//                   child: const Text(
//                     "Add Task",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final auth = context.read<AuthService>();
//     final completedTasks = tasks.where((task) => task.isCompleted).length;
//     final totalTasks = tasks.length;
//     final progress = totalTasks > 0 ? completedTasks / totalTasks : 0;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF8FAFD),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         foregroundColor: const Color(0xFF2D2D2D),
//         title: const Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "My Tasks",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w800,
//                 color: Color(0xFF2D2D2D),
//               ),
//             ),
//             SizedBox(height: 2),
//             Text(
//               "Stay organized and productive",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFF6B7280),
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 6,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: IconButton(
//               icon: const Icon(
//                 Icons.logout_rounded,
//                 color: Color(0xFF6C63FF),
//                 size: 22,
//               ),
//               onPressed: () async {
//                 await auth.logout();
//                 if (!mounted) return;
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => const LoginScreen(),
//                   ),
//                   (route) => false,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _addTask,
//         backgroundColor: const Color(0xFF6C63FF),
//         foregroundColor: Colors.white,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         icon: const Icon(Icons.add_rounded, size: 24),
//         label: const Text(
//           "New Task",
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 16,
//           ),
//         ),
//       ),
//       body: loading
//           ? const Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(
//                     color: Color(0xFF6C63FF),
//                     strokeWidth: 2,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Loading your tasks...",
//                     style: TextStyle(
//                       color: Color(0xFF6B7280),
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           : RefreshIndicator(
//               color: const Color(0xFF6C63FF),
//               onRefresh: _loadTasks,
//               child: CustomScrollView(
//                 slivers: [
//                   SliverToBoxAdapter(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 16,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Progress Card
//                           Container(
//                             padding: const EdgeInsets.all(20),
//                             decoration: BoxDecoration(
//                               gradient: const LinearGradient(
//                                 colors: [Color(0xFF6C63FF), Color(0xFF8B84FF)],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: const Color(0xFF6C63FF).withOpacity(0.3),
//                                   blurRadius: 15,
//                                   offset: const Offset(0, 6),
//                                 ),
//                               ],
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   "Today's Progress",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 12),
//                                 Stack(
//                                   children: [
//                                     Container(
//                                       height: 8,
//                                       decoration: BoxDecoration(
//                                         color: Colors.white.withOpacity(0.2),
//                                         borderRadius: BorderRadius.circular(4),
//                                       ),
//                                     ),
//                                     AnimatedContainer(
//                                       duration: const Duration(milliseconds: 500),
//                                       height: 8,
//                                       width: MediaQuery.of(context).size.width * 0.85 * progress,
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(4),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 12),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "$completedTasks/$totalTasks completed",
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                     Text(
//                                       "${(progress * 100).toStringAsFixed(0)}%",
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//                           // Task List Header
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 4),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   "Your Tasks",
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w700,
//                                     color: Color(0xFF2D2D2D),
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 12,
//                                     vertical: 6,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFFF0F0FF),
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Text(
//                                     "$totalTasks tasks",
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w600,
//                                       color: Color(0xFF6C63FF),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Task List
//                   if (tasks.isEmpty)
//                     SliverFillRemaining(
//                       child: const PremiumEmptyState(),
//                     )
//                   else
//                     SliverPadding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       sliver: SliverList(
//                         delegate: SliverChildBuilderDelegate(
//                           (context, index) {
//                             final task = tasks[index];
//                             return Container(
//                               margin: const EdgeInsets.only(bottom: 12),
//                               child: TaskTile(
//                                 task: task,
//                                 onDelete: () async {
//                                   await service.deleteTask(task.id);
//                                   _loadTasks();
//                                 },
//                                 onToggle: (value) async {
//                                   await service.updateTaskStatus(task.id, value);
//                                   _loadTasks();
//                                 },
//                               ),
//                             );
//                           },
//                           childCount: tasks.length,
//                         ),
//                       ),
//                     ),
//                   const SliverToBoxAdapter(
//                     child: SizedBox(height: 80),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techstax/auth/auth_service.dart';
import 'package:techstax/dashboard/widget/add_task_bottom_sheet.dart';
import 'package:techstax/dashboard/widget/dasboard_app_bar.dart';
import 'package:techstax/dashboard/widget/task_list_section.dart';
import 'package:techstax/dashboard/widget/task_progress_card.dart';
import 'package:techstax/services/supabase_service.dart';
import 'package:techstax/services/task_repository,.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final service = SupabaseService();
  List<Task> tasks = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final userId = context.read<AuthService>().userId;
    final result = await service.fetchTasks(userId);
    if (!mounted) return;
    setState(() {
      tasks = result;
      loading = false;
    });
  }

  void _openAddTaskSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      builder: (_) => AddTaskBottomSheet(
        onSubmit: (title) async {
          await service.addTask(title, context.read<AuthService>().userId);
          _loadTasks();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthService>();

    return Scaffold(
      appBar: DashboardAppBar(auth: auth),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddTaskSheet,
        label: const Text("New Task"),
        icon: const Icon(Icons.add),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: TaskProgressCard(completed: tasks.where((t) => t.isCompleted).length, total: tasks.length),
                  ),
                ),
                TaskListSection(
                  tasks: tasks,
                  onDelete: (task) async {
                    await service.deleteTask(task.id);
                    _loadTasks();
                  },
                  onToggle: (task, value) async {
                    await service.updateTaskStatus(task.id, value);
                    _loadTasks();
                  },
                ),
              ],
            ),
    );
  }
}
