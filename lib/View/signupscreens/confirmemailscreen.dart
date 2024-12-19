import 'package:aanma_nalam/View/signupscreens/forgotconfrimemailscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmEmailScreen extends StatefulWidget {
  const ConfirmEmailScreen({super.key});

  @override
  State<ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 100), // Space at the top
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

                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/images/createaccount.png', // Ensure correct path
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Confirm Your Email",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.coretextcolor,
                          )
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "We've sent 5 digits verification code",
                        style: TextStyle(
                          fontSize: 16, // You can use AppTheme.mediumFontSize if defined
                          color: Colors.grey, // Change this color if using a custom theme
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "to",
                            style: TextStyle(
                              fontSize: 16, // You can use AppTheme.mediumFontSize if defined
                              color: Colors.grey, // Change this color if using a custom theme
                            ),
                          ),
                          const Text(
                            " Hello@designer.com",
                            style: TextStyle(
                              fontSize: 16, // You can use AppTheme.mediumFontSize if defined
                              color: AppTheme.corecolor, // Change this color if using a custom theme
                            ),
                          ),
                        ],
                      ),


                      const SizedBox(height: 20),
                      // Input Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email or Phone Number",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Change if using a custom theme
                              fontSize: 16, // You can replace with AppTheme.mediumFontSize
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
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email or Phone Number',
                                prefixIcon: Icon(Icons.email, color: Colors.redAccent),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      // Continue Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.to(ConfrimationEmail());
                          },
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
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

