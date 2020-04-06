import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<String> questions;
  final int questionIndex;
  final Function answerQuestion;
  final List<Map<String,Object>> answers;

  Quiz(
      {@required this.answerQuestion,
      @required this.questions,
      @required this.questionIndex,
      @required this.answers});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          // questions.elementAt(0),
          questions[questionIndex],
        ),
        ...(answers as List<Map<String,Object>>).map((answer) {
          return Answer(()=>answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}