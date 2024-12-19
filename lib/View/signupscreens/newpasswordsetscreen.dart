import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterNewPasswordScreen extends StatefulWidget {
  const EnterNewPasswordScreen({super.key});

  @override
  State<EnterNewPasswordScreen> createState() => _EnterNewPasswordScreenState();
}

class _EnterNewPasswordScreenState extends State<EnterNewPasswordScreen> {
  bool _isObscurePassword = true;
  bool _isObscureRePassword = true;

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
                                const SizedBox(height: 20),

                                Center(
                                  child: Image.asset(
                                    'assets/images/password.png', // Ensure correct path
                                    width: 250,
                                    height: 250,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                const Center(
                                  child: Text(
                                    "Enter New Password",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.coretextcolor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Center(
                                  child: Text(
                                    "Set complex passwords to protect",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey, // Change this color if using a custom theme
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),

                                // Password Field
                                buildPasswordInputField(
                                  context,
                                  label: "Password",
                                  hintText: "Enter your Password",
                                  isPassword: true,
                                  isObscure: _isObscurePassword,
                                  onToggleVisibility: () {
                                    setState(() {
                                      _isObscurePassword = !_isObscurePassword;
                                    });
                                  },
                                ),
                                const SizedBox(height: 20),

                                // Retype Password Field
                                buildPasswordInputField(
                                  context,
                                  label: "Re Type Password",
                                  hintText: "Re Enter your Password",
                                  isPassword: true,
                                  isObscure: _isObscureRePassword,
                                  onToggleVisibility: () {
                                    setState(() {
                                      _isObscureRePassword = !_isObscureRePassword;
                                    });
                                  },
                                ),
                                const SizedBox(height: 20),

                                // Set New Password Button
                                ElevatedButton(
                                  onPressed: () {
                                    // Add functionality for setting the new password
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.corecolor,
                                    minimumSize: const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: const Text(
                                    'Set New password',
                                    style: TextStyle(
                                      color: AppTheme.whitecolor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Need Help | FAQ | Terms of Use
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Need Help', style: TextStyle(color: Colors.grey)),
                                    const VerticalDivider(color: Colors.red, thickness: 2),
                                    const Text('FAQ', style: TextStyle(color: Colors.grey)),
                                    const VerticalDivider(color: Colors.red, thickness: 2),
                                    const Text('Terms of use', style: TextStyle(color: Colors.grey)),
                                  ],
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

  // Helper method for the password and retype password fields
  Widget buildPasswordInputField(BuildContext context, {
    required String label,
    required String hintText,
    required bool isPassword,
    required bool isObscure,
    required VoidCallback onToggleVisibility,
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
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: const Icon(Icons.lock_outline, color: AppTheme.corecolor),
            suffixIcon: IconButton(
              icon: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
                color: AppTheme.coretextcolor,
              ),
              onPressed: onToggleVisibility,
            ),
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
}
