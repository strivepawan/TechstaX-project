import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techstax/app/techstax_assets.dart';
import 'package:techstax/auth/auth_service.dart';
import 'package:techstax/auth/signup_screen.dart';
import 'package:techstax/dashboard/dasboard_screen.dart';
import 'package:techstax/widget/add_text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  bool _isLoading = false;
  Future<void> _handleLogin(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await context.read<AuthService>().login(email.text.trim(), password.text.trim());

      if (!mounted) {
        return;
      }

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
        (route) => false,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // Logo + App Name
                Center(
                  child: Column(children: [Image.asset(TechstaxAssets.logo, height: 80), const SizedBox(height: 12)]),
                ),

                const SizedBox(height: 40),

                // Welcome Text
                const Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
                ),

                const SizedBox(height: 24),

                // Email Label
                const Text("Email Address", style: TextStyle(fontSize: 14, color: Color(0xFF9FB3C8))),
                const SizedBox(height: 8),

                // Email Field
                AppTextField(
                  hintText: "pawan@gmail.com",
                  controller: email,
                  prefixIcon: Icons.person_pin_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                const Text("Password", style: TextStyle(color: Color(0xFF9FB3C8))),
                const SizedBox(height: 20),

                // Password Label
                AppTextField(
                  hintText: "••••••••",
                  prefixIcon: Icons.lock_outline,
                  controller: password,
                  suffixIcon: Icons.visibility_off,
                  obscureText: true,
                  onSuffixTap: () {
                    // toggle password visibility later
                  },
                ),

                const SizedBox(height: 12),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password?", style: TextStyle(color: Color(0xFF9FB3C8))),
                  ),
                ),

                const SizedBox(height: 24),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : () => _handleLogin(context),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5C86A),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: _isLoading
                        ? SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                          )
                        : const Text("Login"),
                  ),
                ),

                const SizedBox(height: 28),

                // Divider
                Row(
                  children: const [
                    Expanded(child: Divider(color: Color(0xFF4A5A64))),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Or continue with", style: TextStyle(color: Color(0xFF9FB3C8))),
                    ),
                    Expanded(child: Divider(color: Color(0xFF4A5A64))),
                  ],
                ),

                const SizedBox(height: 24),

                // Google Button
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size(double.infinity, 52),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.g_mobiledata_outlined, color: Colors.white, size: 28),
                      SizedBox(width: 8),
                      Text("Google", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Sign Up
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Don’t have an account? ",
                          style: TextStyle(color: Color(0xFF9FB3C8)),
                        ),
                        TextSpan(
                          text: "Sign Up",
                          style: const TextStyle(color: Color(0xFFF5C86A), fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen()));
                            },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
