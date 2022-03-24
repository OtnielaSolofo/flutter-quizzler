import 'package:flutter/material.dart';
import 'package:flutter_project/question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
          backgroundColor: Colors.white30,
          title: const Center(
            child: Text("Quizzler"),
          )),
      body: const SafeArea(
        child: Quizzler(),
      ),
    ));
  }
}

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> iconResponse = [];

  void checkResponseUser(bool response) {
    if (response == question.getQuestionAnswer(question.currentIndex())) {
      setState(() {
        iconResponse.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      });
    } else {
      setState(() {
        iconResponse.add(
          const Icon(
            Icons.clear,
            color: Colors.red,
          ),
        );
      });
    }
  }

  void showAlert() {
    Alert(
      context: context,
      desc: "Would you restart game ?",
      buttons: [
        DialogButton(
          child: const Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              iconResponse.clear();
              question.getNextQuestion();
            });
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }

  QuestionBrain question = QuestionBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                question.questionBank[question.currentIndex()].questionTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
            )),
        Container(
            child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (!question.isInEndGame()) {
                    checkResponseUser(true);
                    setState(() {
                      question.getNextQuestion();
                    });
                  } else {
                    showAlert();
                  }
                },
                child: Container(
                  width: 100,
                  height: 50,
                  child: const Card(
                    color: Colors.black38,
                    child: Center(
                      child: Text(
                        "True",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              GestureDetector(
                onTap: () {
                  if (!question.isInEndGame()) {
                    checkResponseUser(false);
                    setState(() {
                      question.getNextQuestion();
                    });
                  } else {
                    showAlert();
                  }
                },
                child: Container(
                    width: 100,
                    height: 50,
                    child: const Card(
                      color: Colors.black38,
                      child: Center(
                        child: Text(
                          "False",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    )),
              )
            ],
          ),
        )),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: iconResponse,
          ),
        )),
      ],
    );
  }
}
