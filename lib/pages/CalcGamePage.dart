import 'dart:async';

import 'package:flutter/material.dart';
import 'package:numbergame/src/widgets.dart';

class CalcGame extends StatefulWidget {
  @override
  _CalcGameState createState() => _CalcGameState();
}

class _CalcGameState extends State<CalcGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: Header(), flex: 1),
            Flexible(child: QuestionBar(), flex: 1),
            Flexible(child: AnswerBar(), flex: 2),
          ],
        ),
      ),
    );
  }
}

//Logo , Time and Score
class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Timer _timer;
  int _start;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: headerText('10'),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }
}

// Question text
class QuestionBar extends StatefulWidget {
  @override
  _QuestionBarState createState() => _QuestionBarState();
}

class _QuestionBarState extends State<QuestionBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//Answer Buttom
class AnswerBar extends StatefulWidget {
  @override
  _AnswerBarState createState() => _AnswerBarState();
}

class _AnswerBarState extends State<AnswerBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
