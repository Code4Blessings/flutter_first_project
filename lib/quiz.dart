import 'package:flutter/widgets.dart';
import 'package:flutter_first_project/answer.dart';
import 'package:flutter_first_project/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz({
    @required this.questions, 
    @required this.answerQuestion, 
    @required this.questionIndex
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        //Wrapping this questions statement in parenthesis along with adding List<String> will get rid of the "map is not an object" error.
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
