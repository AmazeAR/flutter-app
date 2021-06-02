import 'dart:ui';

import 'package:flutter/material.dart';

const kServerUrl = "https://amazar-v1.herokuapp.com/";

const double kAppBarSize = 70.0;

const kBoxDecorationOfSigninPage = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
  color: Colors.white,
);

const kLabelTextStyleOfSigninPage = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const kTitleTextStyleOfSigninPage = TextStyle(
  color: Colors.white,
  fontSize: 60.0,
  fontWeight: FontWeight.bold,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Color(0xFFB3E5FC),
  hintText: "Enter the Group Meeting Name",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kDefaultProfileURL =
    'https://www.pngarts.com/files/10/Default-Profile-Picture-PNG-Free-Download.png';
