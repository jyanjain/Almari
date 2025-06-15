// import 'package:almari/controllers/auth_controller.dart';
// import 'package:almari/views/signup_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginPage extends StatelessWidget {
//   LoginPage({super.key});
//   final AuthController authController = Get.find<AuthController>();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     'Login',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextField(
//                     controller: usernameController,
//                     decoration: const InputDecoration(
//                       labelText: 'Username',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: passwordController,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       labelText: 'Password',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   ElevatedButton(
//                     onPressed: () {
//                       final username = usernameController.text.trim();
//                       final password = passwordController.text.trim();
//                       if (username.isEmpty || password.isEmpty) {
//                         Get.snackbar('Error', 'All fiels are required',
//                             snackPosition: SnackPosition.BOTTOM);
//                       } else {
//                         authController.login(username, password);
//                       }
//                     },
//                     child: Text('Login'),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('Don\'t have an account?'),
//                       TextButton(
//                         onPressed: () {
//                           Get.to(
//                             () => SignupPage(),
//                           ); // Navigate to Signup Page
//                         },
//                         child: const Text('Signup'),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 40),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:almari/controllers/auth_controller.dart';
import 'package:almari/views/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Opacity(
            opacity: 1,
            child: Image.asset(
              'assets/pic.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 5),

                      // **Stylish Almari Heading**
                      Text(
                        'ALMARI',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              // colors: [Colors.deepPurple, Colors.purpleAccent],
                              colors: [
                                Color.fromARGB(255, 237, 230, 230),
                                Color.fromARGB(151, 247, 244, 247)
                              ],
                            ).createShader(
                                const Rect.fromLTWH(100, 0, 200, 50)),
                          shadows: const [
                            Shadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // **Subheading: "Login to Your Account"**
                      const Text(
                        'Login ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(250, 250, 250, 250),
                        ),
                      ),

                      // const SizedBox(height: 20),

                      _buildTextField(usernameController, 'Username'),
                      const SizedBox(height: 10),
                      _buildTextField(passwordController, 'Password',
                          obscureText: true),
                      const SizedBox(height: 24),

                      // **Login Button**
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        onPressed: () {
                          final username = usernameController.text.trim();
                          final password = passwordController.text.trim();
                          if (username.isEmpty || password.isEmpty) {
                            Get.snackbar('Error', 'All fields are required!',
                                snackPosition: SnackPosition.BOTTOM);
                          } else {
                            authController.login(username, password);
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),

                      // const SizedBox(height: 10),

                      // **Signup Redirect**
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          TextButton(
                            onPressed: () => Get.to(() => SignupPage()),
                            child: const Text(
                              'Signup',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 140, 73, 255)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: _inputDecoration(label),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
    );
  }
}
