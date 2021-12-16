import 'package:flutter/material.dart';

class AppBarStyle {

  static const appBarTextStyle = TextStyle(
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 13,
    letterSpacing: 4,
  );

  static final AppBar appbar_style = AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'THE',
                style: appBarTextStyle,
              ),
              Text(
                'MOVIE',
                style: appBarTextStyle,
              ),
              Text(
                'DATABASE',
                style: appBarTextStyle,
              ),
            ],
          )
        ],
      ));
}