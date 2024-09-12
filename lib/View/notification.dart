import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: 50,
            color: AppTheme.corecolor,
          ),
          SizedBox(
            height: 20,
          ),
          // Custom Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // "Choose Level" Text
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {

                        Get.back();
                      },

                      child: Image.asset(
                        'assets/images/icons/Vector.png', // Ensure correct path
                        width: 15,
                        height: 15,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Notification',
                      style: TextStyle(
                        fontSize: AppTheme.mediumFontSize,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.seeallcolor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(
                padding: EdgeInsets.all(5),
                children: [
                  buildNotificationCard(
                    context,
                    'How to play?',
                    'Welcome to Bible Trivia! Here’s a guide to get you started.',
                    'Learn More',
                    Icons.notifications,
                  ),
                  buildNotificationCard(
                    context,
                    'Your Feedback Matters',
                    'We would love to hear your thoughts. Please take a moment to rate us.',
                    'Learn More',
                    Icons.feedback,
                  ),
                  buildNotificationCard(
                    context,
                    'Audio Bible Dramatized KJV',
                    'Check out this new app for Audio Bible.',
                    'Install Now',
                    Icons.headset,
                  ),
                  buildNotificationCard(
                    context,
                    'Subscribe to our Youtube Channel',
                    'Check out the new app for Audio Bible.',
                    'Subscribe Now',
                    Icons.subscriptions,
                  ),
                  buildNotificationCard(
                    context,
                    'Follow us on Whatsapp Channel',
                    'Check out this new app for Audio Bible.',
                    'Follow Now',
                    Icons.phone_forwarded_sharp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNotificationCard(BuildContext context, String title, String description, String buttonText, IconData icon) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                icon,
                color: Colors.grey.shade500,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: AppTheme.whitecolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        onPressed: () {
                          // Button Action
                        },
                        child: Text(buttonText),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

