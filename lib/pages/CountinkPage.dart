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
  @override
  Widget build(BuildContext context) {
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
    var random = new Random();
    List positionsList = [];
    List numberList=new List(12);
    int firstNumber = random.nextInt(99);
    int otherNumber = firstNumber;
    // for create random positions list
    while (positionsList.length <= 11) {
      int position = random.nextInt(12);
      if (!positionsList.contains(position)) {
        positionsList.add(position);
      }
    }
    // for create numbers
    for (var pos in positionsList) {
      numberList[pos] = otherNumber;
      otherNumber++;
    }


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
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(12, (index){
                  return customButton(text: numberList[index].toString());
                })
              ),
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
}
