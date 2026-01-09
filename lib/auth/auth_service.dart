// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class AuthService extends ChangeNotifier {
//   final _supabase = Supabase.instance.client;

//   bool get isAuthenticated => _supabase.auth.currentSession != null;

//   Future<void> login(String email, String password) async {
//     await _supabase.auth.signInWithPassword(
//       email: email,
//       password: password,
//     );
//     notifyListeners();
//   }

//   Future<void> signup(String email, String password, String username) async {
//   final response = await _supabase.auth.signUp(
//     email: email,
//     password: password,
//     data: {
//       'username': username,
//     },
//   );

//   if (response.user == null) {
//     throw Exception("Signup failed");
//   }

//   notifyListeners();
// }

//   Future<void> logout() async {
//     await _supabase.auth.signOut();
//     notifyListeners();
//   }

//   String get userId => _supabase.auth.currentUser!.id;
// }

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool get isAuthenticated => _supabase.auth.currentSession != null;

  // Get the username from user metadata
  String get username {
    final user = _supabase.auth.currentUser;
    if (user == null) return 'Guest';

    // Try to get username from user_metadata
    final metadata = user.userMetadata;
    final username = metadata?['username']?.toString();

    // Fallback to email without domain or displayName
    return username ?? user.email?.split('@').first ?? user.userMetadata?['name']?.toString() ?? 'User';
  }

  // Get first name for greeting
  String get firstName {
    final name = username;
    // Take only the first word (first name)
    return name.split(' ').first;
  }

  // Get user's email
  String? get userEmail => _supabase.auth.currentUser?.email;

  Future<void> login(String email, String password) async {
    await _supabase.auth.signInWithPassword(email: email, password: password);
    notifyListeners();
  }

  Future<void> signup(String email, String password, String username) async {
    final response = await _supabase.auth.signUp(email: email, password: password, data: {'username': username});

    if (response.user == null) {
      throw Exception("Signup failed");
    }

    notifyListeners();
  }

  Future<void> logout() async {
    await _supabase.auth.signOut();
    notifyListeners();
  }

  String get userId => _supabase.auth.currentUser?.id ?? '';

  // Get complete user data
  User? get currentUser => _supabase.auth.currentUser;
}
