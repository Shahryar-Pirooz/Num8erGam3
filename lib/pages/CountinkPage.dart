import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
 List<Map<int,bool>> numberList = new List(12);
  int firstNumber;
  int otherNumber;

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
  }

  @override
  Widget build(BuildContext context) {
   widgetsList = [];
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile)
          return mobile(context);
        else if (sizingInformation.deviceScreenType == DeviceScreenType.desktop)
          return desktop(context);
        else
          return Container(
            color: Colors.green,
          );
      },
    );
  }

  Widget mobile(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.all(50),
                  child: Hero(
                    child: headerText(" NUM8ER \n GAM3 ", size: 25),
                    tag: "numberGame",
                  )),
            ),
            Flexible(
              flex: 3,
              child: Builder(
                builder: (context){
                  for (var map in numberList) {
                    var number = map.keys.toList()[0];
                    var isCorrect = map.values.toList()[0];

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
                        onPress: () {},
                      ));
                    }
                  }

                  return GridView.count(
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    crossAxisCount: 3,
                    children: List.of(widgetsList), //todo : باید یک لیست از ویجت ها درست کنم ( مثل صفحه تست) که بصورت خودکار ساخته و دسته بنید بشن این عمل باید به وسیله مپ انجام بگیره
                  );
                },
              )
            )
          ],
        ),
      ),
    );
  }

  Widget desktop(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: Hero(
                    child: headerText(" NUM8ER \n GAM3 ", size: 25),
                    tag: "numberGame",
                  )),
            ),
            Flexible(
              flex: 5,
              child: Container(
                color: MyColors.red,
              ),
            )
          ],
        ),
      ),
    );
  }

  void makeRandomNumberList() {
      // for create random positions list
      while (positionsList.length <= 11) {
        int position = random.nextInt(12);
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

  void makeWidgetList(List numbers){ }
}
