import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:numbergame/src/colors.dart';
import 'package:numbergame/src/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CountinkPage extends StatefulWidget {
  @override
  _CountinkPageState createState() => _CountinkPageState();
}

class _CountinkPageState extends State<CountinkPage> {
 final Random random = new Random();
 final List positionsList = [];
 List<Widget> widgetsList;
 List<Map<int,bool>> numberList = new List(9);
  int firstNumber;
  int otherNumber;
  int score;
  int _start = 10;
  Timer _timer;

 @override
  void initState() {
   numberList = [
     {0:false},{0:false},{0:false},
     {0:false},{0:false},{0:false},
     {0:false},{0:false},{0:false},
     {0:false},{0:false},{0:false}
   ];
   firstNumber = random.nextInt(99);
   otherNumber = firstNumber;
   makeRandomNumberList();
   score = 0;
   startTimer();
  }

  @override
  Widget build(BuildContext context) {
   widgetsList = [];
   final double width = MediaQuery. of(context). size. width;
   final double height = MediaQuery. of(context). size. height;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile)
          return mobile(context , width, height);
        else if (sizingInformation.deviceScreenType == DeviceScreenType.desktop)
          return desktop(context , width , height);
        else
          return desktop(context , width , height);
      },
    );
  }

  Widget mobile(BuildContext context , double width , double height) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 65 , bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Hero(
                        child: headerText(" NUM8ER \n GAM3 ", size: 25),
                        tag: "numberGame",
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          headerText(_start.toString(),size: 25),
                          headerText(score.toString(),size: 25)
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
                builder: (context){
                  for (var map in numberList) {
                    var number = map.keys.toList()[0];
                    var isCorrect = map.values.toList()[0];

                    if(widgetsList.length < 9){
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
                              });
                            },
                          ),
                        );
                      } else {
                        widgetsList.add(gameButton(
                          text: number.toString(),
                          splashColor: MyColors.red,
                          color: MyColors.blue,
                          isPressed: isCorrect,
                          onPress: () {
                            setState(()=> score--);
                          },
                        ));
                      }
                    }

                  }
                  final double itemHeight =height/3.8;
                  final double itemWidth = width / 3;
                  return GridView.count(
                    shrinkWrap: false,
                    childAspectRatio: (itemWidth / itemHeight),
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    crossAxisCount: 3,
                    children: List.of(widgetsList),
                  );
                },
              )
            )
          ],
        ),
      ),
    );
  }

  Widget desktop(BuildContext context , double width , double height) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
           Spacer(flex: 1,),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 65 , bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Hero(
                              child: headerText(" NUM8ER \n GAM3 ", size: 25),
                              tag: "numberGame",
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                headerText(_start.toString(),size: 25),
                                headerText(score.toString(),size: 25)
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
                        builder: (context){
                          for (var map in numberList) {
                            var number = map.keys.toList()[0];
                            var isCorrect = map.values.toList()[0];

                           if(widgetsList.length < 9){
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
                                     });
                                   },
                                 ),
                               );
                             } else {
                               widgetsList.add(gameButton(
                                 text: number.toString(),
                                 splashColor: MyColors.red,
                                 color: MyColors.blue,
                                 isPressed: isCorrect,
                                 onPress: () {
                                   setState(()=> score--);
                                 },
                               ));
                             }
                           }
                          }
                         final double itemHeight = height/3;
                         final double itemWidth = width/4.6;
                          return GridView.count(
                            shrinkWrap: false,
                            childAspectRatio: (itemWidth / itemHeight),
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            crossAxisCount: 3,
                            children: List.of(widgetsList),
                          );
                        },
                      )
                  )
                ],
              ),
            ),
            Spacer(flex: 1,)
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
        numberList[pos]={otherNumber : false};
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
         } else {
           _start = _start - 1;
         }
       },
     ),
   );
 }

 @override
 void dispose() {
   _timer.cancel();
   super.dispose();
 }

}
