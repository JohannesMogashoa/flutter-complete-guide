import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'answer.dart';
import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  void _restartQuestion() {
    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What is your favorite color?',
        'answers': ['Green', 'Red', 'Blue', 'Yellow']
      },
      {
        'questionText': 'What is your favorite tech stack?',
        'answers': ['.NET', 'Javascript', 'Python-Django', 'PHP-Laravel']
      }
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          title: Text("First Quiz App"),
        ),
        body: _questionIndex < questions.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network("https://cdn.pixabay.com/photo/2019/05/22/22/28/brainstorm-4222728_1280.jpg"),
                  ),
                  Question(questions[_questionIndex]['questionText']),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("You have completed all the questions"),
                    FlatButton(
                      color: Colors.blueGrey,
                      child: Text(
                        "Restart",
                        style: TextStyle(fontSize: 28),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: _restartQuestion,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
