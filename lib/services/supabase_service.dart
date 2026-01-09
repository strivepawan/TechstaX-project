// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:techstax/services/task_repository,.dart';

// class SupabaseService {
//   final _client = Supabase.instance.client;

//   Future<List<Task>> fetchTasks(String userId) async {
//     final data = await _client
//         .from('tasks')
//         .select()
//         .eq('user_id', userId)
//         .order('created_at');

//     return data.map<Task>((e) => Task.fromJson(e)).toList();
//   }

//   Future<void> addTask(String title, String userId) async {
//     await _client.from('tasks').insert({
//       'title': title,
//       'user_id': userId,
//     });
//   }

//   Future<void> deleteTask(String id) async {
//     await _client.from('tasks').delete().eq('id', id);
//   }

//   Future<void> updateTaskStatus(String taskId, bool isCompleted) async {
//   await _client
//       .from('tasks')
//       .update({'is_completed': isCompleted})
//       .eq('id', taskId);
// }
// }

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:techstax/services/task_repository,.dart';

class SupabaseService {
  final _client = Supabase.instance.client;

  Future<List<Task>> fetchTasks(String userId) async {
    final data = await _client.from('tasks').select().eq('user_id', userId).order('created_at');

    return (data as List).map<Task>((e) => Task.fromJson(e)).toList();
  }

  Future<void> addTask(String title, String userId) async {
    await _client.from('tasks').insert({'title': title, 'user_id': userId});
  }

  Future<void> deleteTask(String id) async {
    await _client.from('tasks').delete().eq('id', id);
  }

  Future<void> updateTaskStatus(String taskId, bool isCompleted) async {
    await _client.from('tasks').update({'is_completed': isCompleted}).eq('id', taskId);
  }
}
