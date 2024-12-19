import 'package:aanma_nalam/View/signupscreens/forgotconfrimemailscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _isTextFieldFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus(); // Hide keyboard when tapping outside
              setState(() {
                _isTextFieldFocused = false;
              });
            },
            child: Column(
              children: [
                const SizedBox(height: 100), // Space at the top
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: MediaQuery.of(context).viewInsets.bottom == 0
                          ? const NeverScrollableScrollPhysics()
                          : const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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

                            Center(
                              child: Image.asset(
                                'assets/images/resetpassword.png', // Ensure correct path
                              ),
                            ),
                            Center(
                              child: const Text(
                                "Reset Your Password",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.coretextcolor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: const Text(
                                  "Enter Your email address below",
                                  style: TextStyle(
                                    fontSize: AppTheme.smallFontSize,
                                    color: AppTheme.seeallcolor,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: const Text(
                                "and we'll send you a link with instructions",
                                style: TextStyle(
                                  fontSize: AppTheme.smallFontSize,
                                  color: AppTheme.seeallcolor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            // Input Field
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Email or Phone Number",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.coretextcolor,
                                    fontSize: AppTheme.mediumFontSize,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.redAccent),
                                  ),
                                  child: Focus(
                                    onFocusChange: (hasFocus) {
                                      setState(() {
                                        _isTextFieldFocused = hasFocus;
                                      });
                                    },
                                    child: const TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Email or Phone Number',
                                        prefixIcon: Icon(Icons.email, color: Colors.redAccent),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  Get.to(ConfrimationEmail());
                                },
                                child: const Text(
                                  'Send Verification Code',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Need Help',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Container(
                                    height: 20, // Set height for the divider
                                    child: VerticalDivider(
                                      color: Colors.red,
                                      thickness: 2,
                                      width: 20, // Controls the width of space around the divider
                                    ),
                                  ),
                                  Text(
                                    'FAQ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Container(
                                    height: 20, // Set height for the divider
                                    child: VerticalDivider(
                                      color: Colors.red,
                                      thickness: 2,
                                      width: 20,
                                    ),
                                  ),
                                  Text(
                                    'Terms of use',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
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
}
