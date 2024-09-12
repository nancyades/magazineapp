import 'package:aanma_nalam/Controllers/quizcontroller.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Scoreboard extends StatefulWidget {
  const Scoreboard({super.key});

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  // Initialize the QuizController
  final QuizController quizController = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppTheme.onsecondary,

      body: Container(
        decoration: const BoxDecoration(
            color: AppTheme.onsecondary
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text("Quiz Result",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.9,
                        decoration: TextDecoration.none,
                        fontSize: AppTheme.extralargeFontSize,
                        color: AppTheme.whitecolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(quizController.score.value >= 25 ?
                    "assets/images/icons/happyimg.png": "assets/images/icons/sadimage.png",
                    fit: BoxFit.contain,
                    width: 200,
                  ),
                ),
                Text(quizController.score.value >= 25 ?
                  "Completed!": "Better luck next time!",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 0.9,
                      decoration: TextDecoration.none,
                      fontSize: AppTheme.largeFontSize,
                      color: AppTheme.whitecolor,
                      fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                    'EARNED COINS',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: AppTheme.largeFontSize,
                      color: AppTheme.whitecolor,
                      fontWeight: FontWeight.w400,
                    )
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/icons/threegoldcoins.png",
                        fit: BoxFit.contain,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          quizController.score.value.toString(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: AppTheme.extralargeFontSize,
                            color: AppTheme.whitecolor,
                            fontWeight: FontWeight.w800,
                          )
                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color:  AppTheme.chooseboard,
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Win more than 20 coins to unlock the next level",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none,
                            fontSize: AppTheme.smallFontSize,
                            color: AppTheme.whitecolor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text("LEVEL 1",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      decoration: TextDecoration.none,
                      fontSize: AppTheme.extralargeFontSize,
                      color: AppTheme.whitecolor,
                      fontWeight: FontWeight.bold),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color:  AppTheme.chooseboard,
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "TIME TAKEN",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                decoration: TextDecoration.none,
                                fontSize: AppTheme.largeFontSize,
                                color: AppTheme.whitecolor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              quizController.timeTaken.value,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                decoration: TextDecoration.none,
                                fontSize: AppTheme.largeFontSize,
                                color: AppTheme.whitecolor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed("/levels");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.backbutton, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Padding inside the button
                      elevation: 5, // Shadow depth
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: AppTheme.mediumFontSize,
                          color: AppTheme.whitecolor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
