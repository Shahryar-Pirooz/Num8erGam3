import 'package:flutter/material.dart';
import 'package:numbergame/pages/HomeApp.dart';
import 'package:numbergame/src/colors.dart';

main() {
  runApp(MaterialApp(
    color: MyColors.blue,
    home: HomeApp(),
    theme: ThemeData(
        backgroundColor: MyColors.black,
        scaffoldBackgroundColor: MyColors.black
    ),
  ));
}
