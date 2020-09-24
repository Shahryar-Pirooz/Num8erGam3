import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numbergame/src/colors.dart';
import 'package:numbergame/src/widgets.dart';

import 'CountGamePage.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

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
                    )),
                customButton(
                  onPress: () {
                    countinkPageDialog(context, width: width, height: height);
                  },
                  text: "Count Game",
                ),
                Builder(
                  builder: (context) => customButton(
                      onPress: () {
                        Scaffold.of(context)
                            .showSnackBar(snackBar("Coming soon"));
                      },
                      text: "Calc Game"),
                )
              ],
            )),
      ),
    );
  }

  SnackBar snackBar(String message) => SnackBar(
        backgroundColor: MyColors.red,
        content: Text(message),
      );

  //Show welcome dialog
  void countinkPageDialog(context,
      {double height = double.infinity, double width = double.infinity}) {
    final double dialogHeight = height / 2;
    final double dialogWidth = width / 2;

    Dialog _dialog = Dialog(
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
                Flexible(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: headerText(
                        "Hey there guys! The rules of this game are super" +
                            " simple,\nYou have 10 seconds to find the lowest number and " +
                            "then you have to count towards the larger numbers until the" +
                            " table is complete!",
                        size: 20),
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 1,
                  child: customButton(
                      text: "Let's GO",
                      onPress: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CountGamePage()));
                      }),
                )
              ]),
        ),
      ),
    );
    showDialog(context: context, builder: (context) => _dialog);
  }
}
