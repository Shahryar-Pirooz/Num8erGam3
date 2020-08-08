

import 'package:flutter/material.dart';
import 'package:numbergame/src/widgets.dart';

import 'CountinkPage.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            widthFactor: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Hero(
                      child: headerText(" NUM8ER \n GAM3 "),
                      tag: "numberGame",
                    )
                ),
                customButton(
                  onPress:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CountinkPage()));
                  },
                  text: "Countink",
                )
              ],
            )
        ),
      ),
    );
  }
}