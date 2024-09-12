import 'package:aanma_nalam/Controllers/quizcontroller.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SingleTickerProviderStateMixin {
  final QuizController quizController = Get.put(QuizController());

  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  int _currentQuestionIndex = 0;
  final int _totalQuestions = 5;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            height: 70,
            color: AppTheme.corecolor,
          ),
          // Custom Header
          Container(
            color: AppTheme.whitecolor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // "Choose Level" Text
                  Row(
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
                            'Level 1',
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

                  Row(
                    children: [

                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 2.0),
                            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            child: Text(
                              quizController.score.value.toString(),
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 5),
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
                                  width: 30,
                                  height: 30,
                                )
                                    : Image.asset(
                                  'assets/images/icons/goldcoin.png',
                                  width: 30,
                                  height: 30,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(width: 10.0),
                      // Profile Picture with Badge

                    ],
                  ),
                ],
              ),
            ),
          ),
          // Progress bar and timer section
          Container(
            height: 120,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.alarm_sharp,
                          size: 30,
                          color: AppTheme.coretextcolor,
                        ),
                        Obx(() => Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            quizController.timeTaken.value, // Display the formatted time
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.9,
                                decoration: TextDecoration.none,
                                fontSize: AppTheme.mediumFontSize,
                                color: AppTheme.coretextcolor,
                                fontWeight: FontWeight.w900),
                          ),
                        )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(quizController.questions.length,  (index) {
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: quizController.currentQuestionIndex.value == index ? AppTheme.corecolor : Colors.white,
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(color:  quizController.currentQuestionIndex.value == index ? Colors.white : Colors.grey),
                            ),
                          ),
                          if (index != 4)
                            Container(
                              height: 2,
                              width: 50,
                              color: quizController.currentQuestionIndex.value > index ? AppTheme.corecolor : Colors.grey,
                            ),
                        ],
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Question ${quizController.currentQuestionIndex.value + 1}",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: AppTheme.verySmallFontSize,
                          color: AppTheme.corecolor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        'Question ${quizController.currentQuestionIndex.value + 1} out of $_totalQuestions',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: AppTheme.verySmallFontSize,
                          color: AppTheme.corecolor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
           Container(
               height: 40,
             width: Get.width,
             color: AppTheme.whitecolor,

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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              question.question,
                              style: TextStyle(
                                fontSize: AppTheme.mediumFontSize,
                                fontWeight: FontWeight.w800,
                                color: AppTheme.corecolor,
                              ),
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
                                child:

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      backgroundColor: isSelected
                                          ? (quizController.isAnswerCorrect.value
                                          ? Colors.green
                                          : Colors.red)
                                          : isIncorrect
                                          ? Colors.red
                                          : AppTheme.whitecolor,
                                    ),
                                    onPressed: () {
                                      quizController.checkAnswer(answer);
                                    },
                                    child: Text(
                                      answer,
                                      style: TextStyle(color: isSelected
                                          ? (quizController.isAnswerCorrect.value
                                          ? AppTheme.whitecolor
                                          : AppTheme.whitecolor)
                                          : isIncorrect
                                          ? AppTheme.whitecolor
                                          :AppTheme.coretextcolor,

                                          fontSize: 18),
                                    ),
                                  ),
                                )
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





