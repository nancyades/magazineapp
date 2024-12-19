import 'package:aanma_nalam/Controllers/quizcontroller.dart';
import 'package:aanma_nalam/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {

  QuizScreen({super.key,});
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
     // backgroundColor: Colors.grey[300],

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
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/icons/Vector.png', // Ensure correct path
                              width: 15,
                              height: 20,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Level : 1',
                        style: TextStyle(
                          fontFamily: 'PoppinsSemibold',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.grey,
                        ),
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
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 23,
                              minHeight: 23,
                            ),
                            child: Text(
                              quizController.score.value.toString(),
                              style: TextStyle(
                                fontFamily: 'PoppinsMedium',
                                color: AppTheme.grey,
                                fontSize: 15,
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

            height: 130,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10), // Rounded corners
              border: Border.all(
                color: Colors.grey, // Border color
                width: 0.1, // Border width
              ),
            ),
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
                        Image.asset(
                          'assets/images/icons/timer.png',
                          width: 30,
                          height: 30,
                        ),
                        Obx(() => Padding(
                          padding: const EdgeInsets.only(left: 6.0, top: 8),
                          child: Text(
                            quizController.timeTaken.value,
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
                    children: List.generate(quizController.questions.length, (index) {
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: Get.width * 0.03, // Dynamic radius based on screen width
                            backgroundColor: quizController.currentQuestionIndex.value == index
                                ? AppTheme.corecolor
                                : Colors.white,
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                fontSize: Get.width * 0.035, // Dynamic font size
                                fontWeight: FontWeight.w600,
                                color: quizController.currentQuestionIndex.value == index
                                    ? Colors.white
                                    : AppTheme.grey,
                              ),
                            ),
                          ),
                          if (index != quizController.questions.length - 1) // Ensures no trailing connector for the last item
                            Container(
                              height: Get.height * 0.005, // Dynamic height for the connector
                              width: Get.width * 0.15, // Dynamic width for the connector
                              color: quizController.currentQuestionIndex.value > index
                                  ? AppTheme.corecolor
                                  : AppTheme.grey,
                            ),
                        ],
                      );
                    }),
                  ),


                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: List.generate(quizController.questions.length, (index) {
                  //     return Row(
                  //       children: [
                  //         CircleAvatar(
                  //           radius: 10,
                  //           backgroundColor: quizController.currentQuestionIndex.value == index
                  //               ? AppTheme.corecolor
                  //               : Colors.white,
                  //           child: Text(
                  //             (index + 1).toString(),
                  //             style: TextStyle(
                  //                 fontSize: 13,
                  //
                  //                 fontWeight: FontWeight.w600,
                  //
                  //                 color: quizController.currentQuestionIndex.value == index
                  //                     ? Colors.white
                  //                     : AppTheme.grey),
                  //           ),
                  //         ),
                  //         if (index != 4)
                  //           Container(
                  //             height: 2.5,
                  //             width: 65,
                  //             color: quizController.currentQuestionIndex.value > index
                  //                 ? AppTheme.corecolor
                  //                 : AppTheme.grey,
                  //           ),
                  //       ],
                  //     );
                  //   }),
                  // ),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Question ${quizController.currentQuestionIndex.value + 1}",
                            style: TextStyle(
                              fontFamily: 'Kottaone',
                              fontSize: 13,
                              color: AppTheme.corecolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Question ${quizController.currentQuestionIndex.value + 1} out of $_totalQuestions',
                            style: TextStyle(
                              fontFamily: 'Kottaone',
                              fontSize: 11,
                              color: AppTheme.corecolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
               height: 30,
             width: Get.width,
             color: AppTheme.whitecolor,
           ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.6740,
                    decoration: BoxDecoration(
                      color: AppTheme.quizbackground,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0), // Adjust the radius as needed
                        topRight: Radius.circular(10.0), // Adjust the radius as needed
                      ),
                    ),
                    child: Obx(() {
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
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0, left: 8, right: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.awardbgcolor,
                                        borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed for rounder corners
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Center(
                                          child: Text(
                                            question.question,
                                            style: TextStyle(
                                              fontFamily: 'PoppinsSemibold',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: AppTheme.corecolor,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 30),
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
                                          child: Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                quizController.checkAnswer(answer);
                                              },
                                              child: Container(
                                                height: 65,
                                                padding: EdgeInsets.symmetric(vertical: 20),
                                                decoration: BoxDecoration(
                                                  color: isSelected
                                                      ? (quizController.isAnswerCorrect.value ? Colors.green : Colors.red)
                                                      : isIncorrect
                                                      ? Colors.red
                                                      : AppTheme.whitecolor,
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                    child: Text(
                                                      answer,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        color: isSelected
                                                            ? (quizController.isAnswerCorrect.value
                                                            ? AppTheme.whitecolor
                                                            : AppTheme.whitecolor)
                                                            : isIncorrect
                                                            ? AppTheme.whitecolor
                                                            : AppTheme.coretextcolor,
                                                        fontSize: 18,
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
                  ),
                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}





