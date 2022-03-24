import 'package:flutter_project/question.dart';

class QuestionBrain {
  int questionIndex = 0;

  List<Question> questionBank = [
    Question(questionTitle: "Q 1 ", questionResponse: false),
    Question(questionTitle: "Q 2 ", questionResponse: true),
    Question(questionTitle: "Q 3 ", questionResponse: false),
    Question(questionTitle: "Q 4 ", questionResponse: true),
    Question(questionTitle: "Q 5 ", questionResponse: true),
    Question(questionTitle: "Q 6 ", questionResponse: false),
    Question(questionTitle: "Q 7 ", questionResponse: true),
    Question(questionTitle: "Q 8 ", questionResponse: false),
    Question(questionTitle: "Q 9 ", questionResponse: true),
    Question(questionTitle: "Q 10 ", questionResponse: true),
  ];

  String getQuestionTitle(int questionIndex) {
    return questionBank[questionIndex].questionTitle;
  }

  bool getQuestionAnswer(int questionIndex) {
    return questionBank[questionIndex].questionResponse;
  }

  void getNextQuestion() {
    if (questionIndex < (questionBank.length - 1)) {
      questionIndex++;
    } else {
      questionIndex = 0;
    }
  }

  bool isInEndGame() {
    return questionIndex == (questionBank.length - 1);
  }

  int currentIndex() {
    return questionIndex;
  }
}
