import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:numbergame/src/colors.dart';
import 'package:numbergame/src/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CountGamePage extends StatefulWidget {
  @override
  _CountGamePageState createState() => _CountGamePageState();
}

class _CountGamePageState extends State<CountGamePage> {
  final Random random = new Random();
  final List positionsList = [];
  List<Widget> widgetsList;
  List<Map<int, bool>> numberList = [];
  int firstNumber;
  int otherNumber;
  int correctsCounter;
  int score;
  int _start = 10;
  double width;
  double height;
  Timer _timer;

  @override
  void initState() {
    numberList = [
      {0: false},
      {0: false},
      {0: false},
      {0: false},
      {0: false},
      {0: false},
      {0: false},
      {0: false},
      {0: false},
      {0: false},
      {0: false},
      {0: false}
    ];
    firstNumber = random.nextInt(90);
    otherNumber = firstNumber;
    makeRandomNumberList();
    score = 0;
    correctsCounter = 0;
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widgetsList = [];
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile)
          return mobile(context, width, height);
        else if (sizingInformation.deviceScreenType == DeviceScreenType.desktop)
          return desktop(context, width, height);
        else
          return desktop(context, width, height);
      },
    );
  }

  Widget mobile(BuildContext context, double width, double height) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 65, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Hero(
                        child: Material(
                            color: Colors.transparent,
                            child: myText(" NUM8ER \n GAM3 ", size: 25)),
                        tag: "numberGame",
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          myText(_start.toString(), size: 25),
                          myText(score.toString(), size: 25)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
                flex: 4,
                child: Builder(
                  builder: (context) {
                    for (var map in numberList) {
                      var number = map.keys.toList()[0];
                      var isCorrect = map.values.toList()[0];

                      if (widgetsList.length < 9) {
                        if (number == firstNumber) {
                          widgetsList.add(
                            gameButton(
                              text: number.toString(),
                              color: MyColors.blue,
                              splashColor: MyColors.blue,
                              isPressed: isCorrect,
                              onPress: () {
                                setState(() {
                                  map[firstNumber] = true;
                                  firstNumber++;
                                  score++;
                                  correctsCounter++;
                                  if (correctsCounter == 9) {
                                    if (_start > 1 && score > 1)
                                      score *= _start;
                                    countGameDialog(context, "You're won");
                                  }
                                });
                              },
                            ),
                          );
                        } else {
                          widgetsList.add(gameButton(
                            text: number.toString(),
                            splashColor: MyColors.secondary,
                            color: MyColors.blue,
                            isPressed: isCorrect,
                            onPress: () {
                              setState(() => score--);
                            },
                          ));
                        }
                      }
                    }
                    return SizedBox(
                      height: width - 32,
                      width: width - 32,
                      child: GridView.count(
                        shrinkWrap: false,
                        childAspectRatio: 1,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        crossAxisCount: 3,
                        children: List.of(widgetsList),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }

  Widget desktop(BuildContext context, double width, double height) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Hero(
                              child: Material(child: myText(" NUM8ER \n GAM3 ", size: 25),type: MaterialType.transparency,),
                              tag: "numberGame",
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                myText(_start.toString(), size: 20),
                                myText(score.toString(), size: 20)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Builder(
                        builder: (context) {
                          for (var map in numberList) {
                            var number = map.keys.toList()[0];
                            var isCorrect = map.values.toList()[0];

                            if (widgetsList.length < 9) {
                              if (number == firstNumber) {
                                widgetsList.add(
                                  gameButton(
                                    text: number.toString(),
                                    color: MyColors.blue,
                                    splashColor: MyColors.blue,
                                    isPressed: isCorrect,
                                    onPress: () {
                                      setState(() {
                                        map[firstNumber] = true;
                                        firstNumber++;
                                        score++;
                                        correctsCounter++;
                                        if (correctsCounter == 9) {
                                          if (_start > 1 && score > 1)
                                            score *= _start;
                                          countGameDialog(
                                              context, "You're won");
                                        }
                                      });
                                    },
                                  ),
                                );
                              } else {
                                widgetsList.add(gameButton(
                                  text: number.toString(),
                                  splashColor: MyColors.secondary,
                                  color: MyColors.blue,
                                  isPressed: isCorrect,
                                  onPress: () {
                                    setState(() => score--);
                                  },
                                ));
                              }
                            }
                          }
                          final double itemHeight = height / 4;
                          final double itemWidth = width / 4.6;
                          return GridView.count(
                            shrinkWrap: false,
                            childAspectRatio: (itemWidth / itemHeight),
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            crossAxisCount: 3,
                            children: List.of(widgetsList),
                          );
                        },
                      ))
                ],
              ),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  void makeRandomNumberList() {
    // for create random positions list
    while (positionsList.length <= 8) {
      int position = random.nextInt(9);
      if (!positionsList.contains(position)) {
        positionsList.add(position);
      }
    }
    // for create numbers
    for (var pos in positionsList) {
      numberList[pos] = {otherNumber: false};
      otherNumber++;
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            countGameDialog(context, "Times up");
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void countGameDialog(context, String message) {
    final double dialogHeight = height / 2;
    final double dialogWidth = width / 2;
    Dialog _dialog;
    _timer.cancel();
    _dialog = Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16),
        height: dialogHeight,
        width: dialogWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: MyColors.black),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                myText("$message\nYour Score : $score ", size: 40),
                Spacer(),
                customButton(
                    text: "Ok",
                    onPress: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    })
              ]),
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (context) => _dialog,
        barrierDismissible: false);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
