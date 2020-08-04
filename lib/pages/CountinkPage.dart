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
      builder: (context, sizingInformation){
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile)  return mobile(context);
       else if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) return desktop(context);
       else return Container(color: Colors.green,);
      },
    );
  }

  Widget mobile(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: Hero(
                    child: headerText(" NUM8ER \n GAM3 " , size: 25),
                    tag: "numberGame",
                  )) ,),
            Flexible(
              flex: 5,
              child: Container(
                color: MyColors.red,
              ) ,)
          ],
        ),
      ),
    );
  }
  Widget desktop(BuildContext context){
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
                    child: headerText(" NUM8ER \n GAM3 " , size: 25),
                    tag: "numberGame",
                  )) ,),
            Flexible(
              flex: 5,
              child: Container(
                color: MyColors.red,
              ) ,)
          ],
        ),
      ),
    );
  }

}


