import 'package:aanma_nalam/Controllers/quizcontroller.dart';
import 'package:aanma_nalam/View/quiz/quizscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:aanma_nalam/constant/topmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: 50,
            color: AppTheme.corecolor,
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
                    BackButtonContainer(),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Choose Level',
                      style: TextStyle(
                        fontSize: AppTheme.mediumFontSize,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.seeallcolor,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/icons/Coins Icons.png', // Ensure correct path
                          width: 25,
                          height: 25,
                          color: AppTheme.coretextcolor,
                        ),
                        SizedBox(width: 3,),
                        // Count Badge
                        Container(
                          margin: EdgeInsets.only(left: 2.0),
                          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '20',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 8.0),
                    // Shopping Icon with Count
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/icons/Shopping icon.png', // Ensure correct path
                          width: 25,
                          height: 20,
                          color: AppTheme.coretextcolor,
                        ),
                        // Count Badge
                        Container(
                          margin: EdgeInsets.only(left: 2.0),
                          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '05',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 8.0),
                    // Profile Picture with Badge
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0,bottom: 8),
                          child: CircleAvatar(
                            radius: 16.0,
                            backgroundImage: AssetImage('assets/images/icons/Ellipse 39.png'), // Ensure correct path
                          ),
                        ),
                        Positioned(
                          right: 4,
                          bottom: 4,
                          child: Container(
                            width: 13,
                            height: 13,
                            padding: EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              color:  AppTheme.coretextcolor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.add, color: Colors.white, size: 11.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // List of Levels
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero, // Remove default padding to avoid gaps
              itemCount: 20, // Number of levels
              itemBuilder: (context, index) {

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      Get.find<QuizController>().resetQuiz();
                     // Get.offNamed('/playquiz');
                      Get.to(QuizScreen());
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppTheme.newplayquizcontainer, // Set container background color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                            leading: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.grey.withOpacity(0.9), // Set background color for lock icon
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  //index == 0 ?
                                // "assets/images/icons/unlock.png"
                       'assets/images/icons/lock.png', // Ensure correct path
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Level ${index + 1}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: AppTheme.coretextcolor,
                                    ),
                                  ),
                                  Text(
                                    "5 Questions Multiple Choice",
                                    style: TextStyle(
                                      fontFamily: 'Kottaone',
                                      fontSize: 12,
                                      color: AppTheme.multichoicecolor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                Get.find<QuizController>().resetQuiz();
                               // Get.offNamed('/playquiz');
                                Get.to(QuizScreen());




                              },
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.corecolor, // Set background color for arrow icon
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppTheme.whitecolor, // Set icon color
                                  size: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
