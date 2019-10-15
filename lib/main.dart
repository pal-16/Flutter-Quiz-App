import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your name ?',
      'answers': [
        {'text': 'palak', 'score': 0},
        {'text': 'pal', 'score': 10},
        {'text': 'pa', 'score': 20},
        {'text': 'pk', 'score': 30},
      ],
    },
    {
      'questionText': 'What\'s your classes name ?',
      'answers': [
        {'text': 'saahil', 'score': 9},
        {'text': 'shyamal', 'score': 6},
        {'text': 'vinay', 'score': 5},
        {'text': 'abhishek', 'score': 7},
      ],
    },
    {
      'questionText': 'What\'s your college name ?',
      'answers': [
        {'text': 'vjti', 'score': 0},
        {'text': 'vjti', 'score': 6},
        {'text': 'vjti', 'score': 5},
        {'text': 'vjti', 'score': 7},
      ],
    },
  ];

  var _qi = 0;
  var _totalscore = 0;
  void _resetquiz(){
    setState(() {
        _qi = 0;
       _totalscore = 0;
 
    });
  }
  void _answerQuestion(int score) {
    _totalscore += score;

    if (_qi < _questions.length) {
      print('we have more questions');
    } else {
      print('no more questions');
    }
    setState(() {
      _qi = _qi + 1;
    });

    print('answer chosen');
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('test your knowledge'),
        ),
        body: _qi < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion, qi: _qi, questions: _questions)
            : Result(_totalscore,_resetquiz),
      ),
    );
  }
}
