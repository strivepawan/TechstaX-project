import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techstax/app/theme.dart';
import 'package:techstax/auth/auth_service.dart';
import 'package:techstax/auth/login_screen.dart';
import 'package:techstax/dashboard/dasboard_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(debugShowCheckedModeBanner: false, theme: AppTheme.darkTheme, home: const AuthGate()),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();

    if (auth.isAuthenticated) {
      return const DashboardScreen();
    } else {
      return const LoginScreen();
    }
  }
}
