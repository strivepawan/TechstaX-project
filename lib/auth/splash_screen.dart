import 'package:flutter/material.dart';
import 'package:techstax/app/techstax_assets.dart';
import 'package:techstax/auth/login_screen.dart';
import 'package:techstax/widget/primary_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              SizedBox(width: 60, height: 80, child: Image.asset(TechstaxAssets.logo)),

              const SizedBox(height: 20),

              // Illustration
              Expanded(child: Center(child: Image.asset(TechstaxAssets.splash))),

              const SizedBox(height: 24),

              // Title Text
              Text(
                "Manage your",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white),
              ),

              Text(
                "Task with",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white),
              ),

              // Highlighted App Name
              Text(
                "DayTask",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFF5C86A), // Yellow highlight
                ),
              ),

              const SizedBox(height: 32),

              // Primary Button
              PrimaryButton(
                title: "Let’s Start",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
