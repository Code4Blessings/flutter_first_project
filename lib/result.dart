import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    //A getter is a method that can never receive arguments but you do have to return something.  You use it like a property.
    String resultText;
    if (resultScore <= 4) {
      resultText = 'You\'re a bit too negative';
    } else if (resultScore <= 15) {
      resultText = 'You\'re pretty likeable';
    } else if (resultScore <= 30) {
      resultText = 'You\'re very bright';
    } else {
      resultText = 'You\'re beautiful inside and out';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            Text(
              resultPhrase,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              onPressed: resetHandler,
              child: Text(
                'Restart Quiz',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18
                ),
              ),
            ),
          ]
        )
    );
  }
}
