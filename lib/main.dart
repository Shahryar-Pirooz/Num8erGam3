import 'package:flutter/material.dart';
import 'package:numbergame/pages/HomeApp.dart';
import 'package:numbergame/src/colors.dart';
import 'package:numbergame/test.dart';

main() {
  runApp(MaterialApp(
    color: MyColors.blue,
    home: Test(),
    theme: ThemeData(
        backgroundColor: MyColors.black,
        scaffoldBackgroundColor: MyColors.black),
  ));
}
