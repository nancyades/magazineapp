import 'package:aanma_nalam/View/quiz/quizresultscreen.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({super.key});

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4), () {
      Get.off(QuizScoreScreen(), transition: Transition.cupertino, duration: Duration(seconds: 1));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Emoji Image
            Image.network(
              'https://emojipedia-us.s3.amazonaws.com/source/skype/289/face-with-monocle_1f9d0.png',
              height: 150,
              width: 150,
            ),
            SizedBox(height: 30),
            // Quiz Result Text
            Text(
              'Quiz Result',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: AppTheme.highMediumFontSize,
                  color: AppTheme.corecolor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            // Please wait... Text
            Text(
              'Please wait...',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: AppTheme.mediumFontSize,
                  color: AppTheme.coretextcolor,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}



