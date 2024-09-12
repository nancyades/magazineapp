import 'package:aanma_nalam/View/signupscreens/confirmemailscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 100), // Space at the top
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 35),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/icons/Vector.png',
                              // Ensure correct path
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Create Your Account",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.coretextcolor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Create account for exploring news",
                        style: TextStyle(
                          fontSize: AppTheme.mediumFontSize,
                          color: AppTheme.seeallcolor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset(
                        'assets/images/logo-01.png',
                        // Replace with your logo path
                        height: 45,
                      ),
                      SizedBox(height: 20),
                      // Input Fields
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "First Name",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.coretextcolor,
                              fontSize: AppTheme.mediumFontSize,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.redAccent),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your firstname',
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.redAccent),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Last Name",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.coretextcolor,
                              fontSize: AppTheme.mediumFontSize,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.redAccent),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your lastname',
                                prefixIcon:
                                Icon(Icons.email, color: Colors.redAccent),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Password",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.coretextcolor,
                              fontSize: AppTheme.mediumFontSize,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.redAccent),
                            ),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your password',
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.redAccent),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Confirm Password",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.coretextcolor,
                              fontSize: AppTheme.mediumFontSize,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.redAccent),
                            ),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Confirm your password',
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.redAccent),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          // Continue Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Get.to(ConfirmEmailScreen());
                              },
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 150),
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
    );
  }
}
