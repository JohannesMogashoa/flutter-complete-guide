import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final Function selectAnswer;
  final String answerText;

  Answer(this.selectAnswer, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: RaisedButton(
        color: Colors.blueGrey,
        child: Text(answerText), 
        onPressed: selectAnswer,
        ),
    );
  }
}
