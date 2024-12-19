import 'dart:async';

import 'package:aanma_nalam/Models/quizmodel.dart';
import 'package:aanma_nalam/Services/apiservice.dart';
import 'package:aanma_nalam/View/quiz/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController with SingleGetTickerProviderMixin {
  var questions = <QuizQuestion>[].obs;
  var currentQuestionIndex = 0.obs;
  var isLoading = true.obs;
  var score = 0.obs;
  var shuffledAnswers = <String>[].obs;
  var selectedAnswer = ''.obs;
  var isAnswerCorrect = false.obs;
  var incorrectAnswers = <String>[].obs;
  var hasAnsweredCorrectly = false.obs;
  var timeTaken = ''.obs;
  var showCoinImage = false.obs; // Flag to manage coin image display

  var accept = false.obs;

  late AnimationController swingController;
  late AnimationController coinController;
  late Animation<double> swingAnimation;

  Timer? _timer;
  int _seconds = 0;

  // Method to format time
  String _formatTime(int seconds) {
    final minutes = (seconds % 3600) ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _seconds++;
      timeTaken.value = _formatTime(_seconds); // Update the formatted time
    });
  }

  @override
  void onInit() {
    super.onInit();
    _startTimer();
    loadQuizQuestions();

    swingController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    swingAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 0.1), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 0.1, end: -0.1), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: -0.1, end: 0), weight: 50),
    ]).animate(swingController);
  }

  void loadQuizQuestions() async {
    try {
      isLoading(true);
      var quizQuestions = await QuizService().fetchQuizQuestions();
      questions.assignAll(quizQuestions);
      shuffleAnswersForCurrentQuestion();
    } finally {
      isLoading(false);
    }
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    _seconds = 0; // Reset seconds
    timeTaken.value = _formatTime(_seconds);
    score.value = 0;
    shuffledAnswers.clear();
    selectedAnswer.value = '';
    isAnswerCorrect.value = false;
    incorrectAnswers.clear();
    hasAnsweredCorrectly.value = false;
    showCoinImage.value = false; // Reset coin image flag
    loadQuizQuestions();
  }

  void shuffleAnswersForCurrentQuestion() {
    var currentQuestion = questions[currentQuestionIndex.value];
    shuffledAnswers.assignAll([
      ...currentQuestion.incorrectAnswers,
      currentQuestion.correctAnswer,
    ]);
    shuffledAnswers.shuffle();
    selectedAnswer.value = '';
    isAnswerCorrect.value = false;
    incorrectAnswers.clear();
    hasAnsweredCorrectly.value = false;
    showCoinImage.value = false; // Reset coin image flag for new question
  }

  void checkAnswer(String selectedAnswer) {
    if (questions[currentQuestionIndex.value].correctAnswer == selectedAnswer) {
      if (!hasAnsweredCorrectly.value) {
        isAnswerCorrect.value = true;
        score.value+=5;
        showCoinImage.value = true; // Show coin image for correct answer
        hasAnsweredCorrectly.value = true;
        Future.delayed(Duration(seconds: 1), () {
          showCoinImage.value = false; // Hide coin image after delay
          moveToNextQuestion();
        });
      } else {
        isAnswerCorrect.value = true;
        Future.delayed(Duration(seconds: 1), () {
          moveToNextQuestion();
        });
      }
    } else {
      incorrectAnswers.add(selectedAnswer);
      isAnswerCorrect.value = false;
      swingController.forward(from: 0);
      hasAnsweredCorrectly.value = true; // Prevent multiple increments
    }
    this.selectedAnswer.value = selectedAnswer;
  }

  bool isAnswerDisabled(String answer) {
    return incorrectAnswers.contains(answer);
  }

  @override
  void dispose() {
    _timer?.cancel();
    swingController.dispose();
    super.dispose();
  }

  void moveToNextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      shuffleAnswersForCurrentQuestion();
    } else {
      Get.snackbar('Quiz Completed', 'Your score: ${score.value}/${25}');
      Get.off(QuizResultScreen());
     //Get.offNamed("/scoreboard");
    }
  }
}
