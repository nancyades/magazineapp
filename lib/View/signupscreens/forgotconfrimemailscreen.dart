import 'dart:async';

import 'package:aanma_nalam/View/signupscreens/newpasswordsetscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConfrimationEmail extends StatefulWidget {
  const ConfrimationEmail({super.key});

  @override
  State<ConfrimationEmail> createState() => _ConfrimationEmailState();
}

class _ConfrimationEmailState extends State<ConfrimationEmail> {
  bool _isTextFieldFocused = false;
  bool _canResend = false; // Track if the user can resend the OTP
  int _start = 180; // Countdown time in seconds (3 minutes = 180 seconds)
  Timer? _timer;

  // Start countdown timer for resend
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _canResend = true; // Enable resend button
          timer.cancel();
        }
      });
    });
  }

  // Format the timer display
  String get timerDisplay {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    String secondsStr = seconds < 10 ? '0$seconds' : '$seconds';
    return '$minutes:$secondsStr';
  }

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer when the widget is created
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                            SizedBox(height: 20,),

                            Center(
                              child: Image.asset(
                                'assets/images/confirmmail.png', // Ensure correct path
                                width: 250,
                                height: 250,
                              ),
                            ),
                            SizedBox(height: 30,),
                            Center(
                              child: const Text(
                                "Confirm your Email",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.coretextcolor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: const Text(
                                "We've sent 5 digits verification code",
                                style: TextStyle(
                                  fontSize: 16, // You can use AppTheme.mediumFontSize if defined
                                  color: Colors.grey, // Change this color if using a custom theme
                                ),
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
                            const SizedBox(height: 30),
                            // Input Field
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Enter verification code",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.coretextcolor,
                                    fontSize: AppTheme.mediumFontSize,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.redAccent),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        // Icon for Email or Phone
                                        Icon(Icons.sms_outlined, color: Colors.redAccent),
                                        SizedBox(width: 8),

                                        // TextField for numeric input only
                                        Expanded(
                                          child: Focus(
                                            onFocusChange: (hasFocus) {
                                              setState(() {
                                                _isTextFieldFocused = hasFocus;
                                              });
                                            },
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Enter OTP',
                                              ),
                                              keyboardType: TextInputType.number, // Only allow number input
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter.digitsOnly, // Filter out non-digit inputs
                                              ],
                                            ),
                                          ),
                                        ),

                                        // Resend timer or button
                                        _canResend
                                            ? TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _start = 180; // Reset timer to 3:00
                                              _canResend = false;
                                              startTimer(); // Restart the timer
                                            });
                                          },
                                          child: Text(
                                            'Resend',
                                            style: TextStyle(color: Colors.redAccent),
                                          ),
                                        )
                                            : Text(
                                          'Resend in $timerDisplay',
                                          style: TextStyle(color: Colors.grey[500]),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 30),
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
                                  Get.to(EnterNewPasswordScreen());

                                },
                                child: const Text(
                                  'Verify and Create Account',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
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









