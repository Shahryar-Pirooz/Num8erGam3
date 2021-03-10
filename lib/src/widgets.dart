import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numbergame/src/colors.dart';

Widget myText(String data, {double size = 72.0}) {
  return Text(
    data,
    textAlign: TextAlign.center,
    style: GoogleFonts.anton(
        color: MyColors.blue,
        fontSize: size,
        // shadows: <Shadow>[
        //   Shadow(color: MyColors.blue[700], offset: Offset(3, 3))
        // ]
      ),
  );
}

Widget customButton(
    {Key key,
    VoidCallback onPress,
    String text = "Enter your Text",
    Color color = Colors.transparent}) {
  return Container(
    margin: EdgeInsets.all(10),
    child: TextButton(
      onPressed: onPress,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return MyColors.blue[900];
        } else if (states.contains(MaterialState.hovered)) {
          return MyColors.blue[600];
        } else {
          return MyColors.blue;
        }
      })),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(
          text,
          style:
              GoogleFonts.anton(color: MyColors.blue[100], fontSize: 20),
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
  Color btnColor = isPressed ? color : MyColors.black;

  return Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
            blurRadius: 5, color: MyColors.blue[700], offset: Offset(2, 5))
      ],
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: btnColor,
    ),
    child: TextButton(
      onPressed: onPress,
      style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)){
                  return splashColor;
                }else{
                  return null;
                }
              })),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.anton(color: MyColors.blue, fontSize: 39),
      ),
    ),
  );
}
