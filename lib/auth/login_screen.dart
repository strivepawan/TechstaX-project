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
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:techstax/dashboard/dasboard_screen.dart';
// import 'auth_service.dart';
// import 'signup_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final email = TextEditingController();
//   final password = TextEditingController();

//   bool _isLoading = false;
// Future<void> _handleLogin(BuildContext context) async {
//   print("🔵 STEP 1: Login button pressed");

//   setState(() {
//     _isLoading = true;
//     print("🟡 STEP 2: Loading state set to TRUE");
//   });

//   try {
//     print("🟠 STEP 3: Calling AuthService.login()");
//     print("📧 Email: ${email.text.trim()}");
//     print("🔐 Password length: ${password.text.trim().length}");

//     await context.read<AuthService>().login(
//           email.text.trim(),
//           password.text.trim(),
//         );

//     print("🟢 STEP 4: Login successful from AuthService");

//     if (!mounted) {
//       print("🔴 STEP 5: Widget NOT mounted, stopping execution");
//       return;
//     }

//     print("🟣 STEP 6: Widget mounted, navigating to Dashboard");

//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (_) => const DashboardScreen(),
//       ),
//       (route) => false,
//     );
//   } catch (e) {
//     print("❌ STEP 7: Error occurred during login");
//     print("❌ Error details: $e");

//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString())),
//       );
//     }
//   } finally {
//     if (mounted) {
//       setState(() {
//         _isLoading = false;
//         print("⚪ STEP 8: Loading state set to FALSE");
//       });
//     } else {
//       print("🔴 STEP 8: Widget not mounted, skipping setState");
//     }
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: email,
//               decoration: const InputDecoration(hintText: "Email"),
//             ),
//             const SizedBox(height: 12),
//             TextField(
//               controller: password,
//               obscureText: true,
//               decoration: const InputDecoration(hintText: "Password"),
//             ),
//             const SizedBox(height: 24),

//             SizedBox(
//               width: double.infinity,
//               height: 48,
//               child: ElevatedButton(
//     onPressed: _isLoading ? null : () => _handleLogin(context),
//     child: _isLoading
//         ? const SizedBox(
//             height: 22,
//             width: 22,
//             child: CircularProgressIndicator(
//               strokeWidth: 2,
//               color: Colors.black,
//             ),
//           )
//         : const Text("Login"),
//   ),
// ),

//             const SizedBox(height: 16),

//             TextButton(
// onPressed: _isLoading
//     ? null
//     : () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => const SignupScreen(),
//           ),
//         );
//                     },
//               child: const Text("Sign Up"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     email.dispose();
//     password.dispose();
//     super.dispose();
//   }
// }
