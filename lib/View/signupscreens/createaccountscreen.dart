import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
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

                      const Text(
                        "Create Your Account",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.coretextcolor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Create account for exploring news",
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
                      const SizedBox(height: 10),

                      Image.asset(
                        'assets/images/createaccount.png', // Ensure correct path
                        //width: 500,
                      ),
                      // Input Field
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Email or Phone Number",
                                style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.coretextcolor,fontSize: AppTheme.mediumFontSize,),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
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
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed('/signupscreen');

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

                      SizedBox(
                        height: 30,
                      )
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



