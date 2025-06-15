// import 'package:almari/views/login.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/auth_controller.dart';

// class SignupPage extends StatelessWidget {
//   SignupPage({super.key});
//   final AuthController authController = Get.put(AuthController());
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   final RxString selectedGender = ''.obs;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Signup - Almari'),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(height: 20),
//                   const Text(
//                     'Signup',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     controller: usernameController,
//                     decoration: const InputDecoration(
//                       labelText: 'Username',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                       labelText: 'Email',
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
//                   const SizedBox(height: 10),
//                   Obx(() {
//                     return DropdownButtonFormField<String>(
//                       decoration: const InputDecoration(
//                         labelText: 'Gender',
//                         border: OutlineInputBorder(),
//                       ),
//                       value: selectedGender.value.isEmpty
//                           ? null
//                           : selectedGender.value,
//                       items: const [
//                         DropdownMenuItem(value: 'Male', child: Text('Male')),
//                         DropdownMenuItem(
//                             value: 'Female', child: Text('Female')),
//                       ],
//                       onChanged: (value) {
//                         if (value != null) {
//                           selectedGender.value = value;
//                         }
//                       },
//                     );
//                   }),
//                   const SizedBox(height: 24),
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 30, vertical: 12),
//                         // minimumSize: Size.zero, // Allow button to be smaller
//                         // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       ),
//                       onPressed: () {
//                         final username = usernameController.text.trim();
//                         final email = emailController.text.trim();
//                         final password = passwordController.text.trim();
//                         final gender = selectedGender.value;
//                         if (username.isEmpty ||
//                             email.isEmpty ||
//                             password.isEmpty ||
//                             gender.isEmpty) {
//                           Get.snackbar('Error', 'All fields are required!',
//                               snackPosition: SnackPosition.BOTTOM);
//                         } else {
//                           authController.signup(
//                               username, email, password, gender);
//                         }
//                       },
//                       child: Text('Signup')),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('Already have an account?'),
//                       TextButton(
//                         onPressed: () {
//                           Get.to(
//                             () => LoginPage(),
//                           );
//                         },
//                         child: const Text('Login'),
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

import 'package:almari/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final RxString selectedGender = ''.obs;

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
                          // fontFamily: 'Cursive',
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

                      // **Subheading: "Create an Account"**
                      const Text(
                        'Create an Account',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(250, 250, 250, 250),
                        ),
                      ),

                      // const SizedBox(height: 20),

                      _buildTextField(usernameController, 'Username'),
                      const SizedBox(height: 10),
                      _buildTextField(emailController, 'Email'),
                      const SizedBox(height: 10),
                      _buildTextField(passwordController, 'Password',
                          obscureText: true),
                      const SizedBox(height: 10),

                      // Gender Dropdown
                      Obx(() {
                        return DropdownButtonFormField<String>(
                          decoration: _inputDecoration('Gender'),
                          value: selectedGender.value.isEmpty
                              ? null
                              : selectedGender.value,
                          items: const [
                            DropdownMenuItem(
                                value: 'Male', child: Text('Male')),
                            DropdownMenuItem(
                                value: 'Female', child: Text('Female')),
                          ],
                          onChanged: (value) {
                            if (value != null) selectedGender.value = value;
                          },
                        );
                      }),

                      const SizedBox(height: 24),

                      // **Signup Button**
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
                          final email = emailController.text.trim();
                          final password = passwordController.text.trim();
                          final gender = selectedGender.value;

                          if (username.isEmpty ||
                              email.isEmpty ||
                              password.isEmpty ||
                              gender.isEmpty) {
                            Get.snackbar('Error', 'All fields are required!',
                                snackPosition: SnackPosition.BOTTOM);
                          } else {
                            authController.signup(
                                username, email, password, gender);
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),

                      // const SizedBox(height: 5),

                      // **Login Redirect**
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          TextButton(
                            onPressed: () => Get.to(() => LoginPage()),
                            child: const Text(
                              'Login',
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
