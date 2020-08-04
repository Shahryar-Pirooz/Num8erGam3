import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numbergame/src/colors.dart';

Widget headerText(String data , { double size = 72.0}) {
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

Widget customButton({VoidCallback onPress, String text = "Enter your Text"}) {
  return FlatButton(
    onPressed: onPress,
    color: MyColors.blue,
    child: Container(
      margin: EdgeInsets.all(10),
      child: Text(
        text,
        style: GoogleFonts.luckiestGuy(
            color: MyColors.blueLight,
          fontSize: 20
        ),
      ),
    ),
  );
}
