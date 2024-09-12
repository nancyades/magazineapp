import 'dart:convert';
import 'package:aanma_nalam/Models/quizmodel.dart';
import 'package:http/http.dart' as http;


class QuizService {
  final String apiUrl = 'https://opentdb.com/api.php?amount=5&category=18&difficulty=easy&type=multiple';

  Future<List<QuizQuestion>> fetchQuizQuestions() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<QuizQuestion> questions = (jsonData['results'] as List)
          .map((data) => QuizQuestion.fromJson(data))
          .toList();
      return questions;
    } else {
      throw Exception('Failed to load quiz questions');
    }
  }
}
