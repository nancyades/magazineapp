import 'dart:async';

import 'package:aanma_nalam/Controllers/quizcontroller.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayQuiz extends StatefulWidget {
  const PlayQuiz({super.key});

  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> with SingleTickerProviderStateMixin {
  final QuizController quizController = Get.put(QuizController());

  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;


  @override
  void initState() {
    super.initState();
    //_startInitialTimer();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Repeats the animation back and forth

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        // Switch between front and back at the halfway point
        if (_animation.value >= 0.5 && _isFront) {
          setState(() {
            _isFront = false;
          });
        } else if (_animation.value < 0.5 && !_isFront) {
          setState(() {
            _isFront = true;
          });
        }
      });
  }


  @override
  void dispose() {
    _controller.dispose();
    //_timer.cancel();
    super.dispose();
  }

  int _currentQuestionIndex = 0;
  final int _totalQuestions = 5;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.onsecondary,
      appBar: AppBar(
        backgroundColor: AppTheme.onsecondary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.whitecolor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Choose Level',
          style: TextStyle(
              fontFamily: 'Poppins',
              letterSpacing: 0.9,
              decoration: TextDecoration.none,
              fontSize: AppTheme.highMediumFontSize,
              color: AppTheme.whitecolor,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              width: Get.width,
              height: Get.height * 0.1,
              decoration: const BoxDecoration(
                color: AppTheme.onprimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(9),
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "LEVEL: 1",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.9,
                                  decoration: TextDecoration.none,
                                  fontSize: AppTheme.highMediumFontSize,
                                  color: AppTheme.whitecolor,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Icon(
                            Icons.alarm_sharp,
                            size: 30,
                            color: AppTheme.whitecolor,
                          ),
                         /* Text(
                            _formatTime(_seconds),
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.9,
                                decoration: TextDecoration.none,
                                fontSize: AppTheme.highMediumFontSize,
                                color: AppTheme.whitecolor,
                                fontWeight: FontWeight.w900),
                          ),*/

                          Obx(() => Text(
                            quizController.timeTaken.value, // Display the formatted time
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.9,
                                decoration: TextDecoration.none,
                                fontSize: AppTheme.highMediumFontSize,
                                color: AppTheme.whitecolor,
                                fontWeight: FontWeight.w900),
                          )),

                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            quizController.score.value.toString(),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.9,
                              decoration: TextDecoration.none,
                              fontSize: 24, // Replace with AppTheme.highMediumFontSize
                              color: Colors.white, // Replace with AppTheme.whitecolor
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(width: 10),
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..rotateY(_animation.value * 3.141592653589793), // Rotate Y-axis for 360 flip
                                child: _isFront
                                    ? Image.asset(
                                  'assets/images/icons/goldcoin.png',
                                  width: 50,
                                  height: 50,
                                )
                                    : Image.asset(
                                  'assets/images/icons/goldcoin.png',
                                  width: 50,
                                  height: 50,
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(quizController.questions.length, (index) {
                      return Container(
                        width: (MediaQuery.of(context).size.width - 40) /
                            quizController.questions.length - 4, // Adjust width with space
                        height: 4,
                        decoration: BoxDecoration(
                          color: index <= quizController.currentQuestionIndex.value
                              ? AppTheme.whitecolor
                              : AppTheme.onsecondary,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      );
                    }),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                             'Question ${_currentQuestionIndex + 1} out of $_totalQuestions',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: AppTheme.smallFontSize,
                              color: AppTheme.whitecolor,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
            if (quizController.isLoading.value) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            } else if (quizController.questions.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Center(child: Text('No questions found.')),
                ],
              );

            } else {
              var question = quizController.questions[quizController.currentQuestionIndex.value];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: AppTheme.whitecolor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(9),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              question.question,
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ...quizController.shuffledAnswers.map((answer) {
                          bool isIncorrect = quizController.incorrectAnswers.contains(answer);
                          bool isSelected = quizController.selectedAnswer.value == answer;

                          return AnimatedBuilder(
                            animation: quizController.swingController,
                            builder: (context, child) {
                              return Transform(
                                transform: isSelected && !quizController.isAnswerCorrect.value
                                    ? Matrix4.rotationZ(quizController.swingAnimation.value)
                                    : Matrix4.identity(),
                                child: GestureDetector(
                                  onTap: () {
                                    quizController.checkAnswer(answer);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? (quizController.isAnswerCorrect.value
                                            ? Colors.green
                                            : Colors.red)
                                            : isIncorrect
                                            ? Colors.red
                                            : AppTheme.chooseboard,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(9),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            answer,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.9,
                                              decoration: TextDecoration.none,
                                              fontSize: AppTheme.highMediumFontSize,
                                              color: AppTheme.whitecolor,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),









        ],
      ),
    );
  }
}







