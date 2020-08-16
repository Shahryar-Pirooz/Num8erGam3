import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numbergame/src/colors.dart';

Widget headerText(String data, {double size = 72.0}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: GoogleFonts.luckiestGuy(
        color: MyColors.blue,
        fontSize: size,
        shadows: <Shadow>[
          Shadow(color: MyColors.blueDark, offset: Offset(3, 3))
        ]),
  );
}

Widget customButton(
    {VoidCallback onPress,
    String text = "Enter your Text",
    Color color = Colors.transparent}) {
  return Container(
    margin: EdgeInsets.all(10),
    child: FlatButton(
      onPressed: onPress,
      color: MyColors.blue,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(
          text,
          style:
              GoogleFonts.luckiestGuy(color: MyColors.blueLight, fontSize: 20),
        ),
      ),
    ),
  );
}

Widget gameButton(
    {VoidCallback onPress,
    String text = "Enter your Text",
    Color splashColor = Colors.transparent,
    Color color,
    bool isPressed = false}) {
  Color btnColor = isPressed ? color : Colors.transparent;

  return Container(
    margin: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: btnColor,
    ),
    child: FlatButton(
      onPressed: onPress,
      splashColor: splashColor,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(
          text,
          style: GoogleFonts.luckiestGuy(color: MyColors.blue, fontSize: 20),
        ),
      ),
    ),
  );
}
