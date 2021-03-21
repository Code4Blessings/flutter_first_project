import 'package:flutter/material.dart';
import 'package:flutter_first_project/quiz.dart';
import 'package:flutter_first_project/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 5},
        {'text': 'Black', 'score': 1},
        {'text': 'Purple', 'score': 3},
        {'text': 'Orange', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s you favorite animal?',
      'answers': [
        {'text': 'Rabbits', 'score': 3},
        {'text': 'Snake', 'score': 1},
        {'text': 'Cheetah', 'score': 7},
        {'text': 'Lion', 'score': 10}
      ]
    },
    {
      'questionText': 'Who\'s your favorite singer?',
      'answers': [
        {'text': 'Evanessance', 'score': 2},
        {'text': 'Bruno Mars', 'score': 9},
        {'text': 'Michael Jackson', 'score': 10},
        {'text': 'Stevie Wonder', 'score': 7}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }

    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions
            )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
