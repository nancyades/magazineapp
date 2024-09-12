import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aanma_nalam/constant/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _keepMeSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppTheme.corecolor, // Red background at the top
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: MediaQuery.of(context).viewInsets.bottom == 0
                        ? const NeverScrollableScrollPhysics()
                        : const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 100), // Spacing from the top
                        Container(
                          width: double.infinity,
                          height: constraints.maxHeight,
                          decoration: const BoxDecoration(
                            color: AppTheme.whitecolor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 35),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Image.asset(
                                        'assets/images/icons/Vector.png', // Ensure correct path
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Welcome Back!",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.coretextcolor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "let's login for explore continues",
                                  style: TextStyle(
                                    fontSize: AppTheme.mediumFontSize,
                                    color: AppTheme.seeallcolor,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Image.asset(
                                  'assets/images/logo-01.png', // Change to your logo path
                                  height: 45,
                                ),
                                const SizedBox(height: 30),
                                buildInputField(
                                  context,
                                  label: "Email or Phone Number",
                                  hintText: "Enter your email",
                                  prefixIcon: Icons.email_outlined,
                                ),
                                const SizedBox(height: 20),
                                buildInputField(
                                  context,
                                  label: "password",
                                  hintText: "Enter your Password",
                                  prefixIcon: Icons.lock_outline,
                                  isPassword: true,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _keepMeSignedIn, // Controlled by state
                                          onChanged: (bool? value) {
                                            setState(() {
                                              _keepMeSignedIn = value ?? false; // Toggle checkbox state
                                            });
                                          },
                                          activeColor: Colors.red, // Change this to the color you want
                                        ),
                                        const Text("Keep me signed in"),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Handle forgot password
                                      },
                                      child: const Text(
                                        "Forgot password",
                                        style: TextStyle(
                                          color: AppTheme.corecolor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed('/loginsuccess');
                                    // Handle sign in action
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.corecolor,
                                    minimumSize: const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: AppTheme.whitecolor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Divider(
                                        color: Colors.grey, // Customize divider color
                                        thickness: 1, // Thickness of the line
                                        endIndent: 10, // Spacing between the divider and the text
                                      ),
                                    ),
                                    Text(
                                      "You can connect with",
                                      style: TextStyle(
                                        color: Colors.grey, // Customize text color
                                        fontSize: 14, // Customize text size
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        color: Colors.grey, // Customize divider color
                                        thickness: 1, // Thickness of the line
                                        indent: 10, // Spacing between the text and the divider
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    socialIconButton('assets/images/icons/vector3.png'),
                                    const SizedBox(width: 20),
                                    socialIconButton('assets/images/icons/Vector2.png'),
                                    const SizedBox(width: 20),
                                    socialIconButton('assets/images/icons/Vector1.png'),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/createaccountscreen');
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Don't have an account? "),
                                      const Text(
                                        "Sign up here",
                                        style: TextStyle(
                                          color: AppTheme.corecolor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Reusable method for input fields
  Widget buildInputField(BuildContext context, {
    required String label,
    required String hintText,
    required IconData prefixIcon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.coretextcolor),
        ),
        const SizedBox(height: 5),
        TextFormField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(prefixIcon, color: AppTheme.corecolor),
            suffixIcon: isPassword ? const Icon(Icons.visibility_off, color: AppTheme.coretextcolor) : null,
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  // Social icon button
  Widget socialIconButton(String iconPath) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
