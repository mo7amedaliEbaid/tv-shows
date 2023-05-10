import 'package:flutter/material.dart';

final baseurl='https://rickandmortyapi.com/api/';
const charactersScreen='/';
const charactersDetailsScreen='/character_details';
TextStyle headstyle=TextStyle(
  color: Colors.transparent,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
  decorationStyle: TextDecorationStyle.solid,
  decorationColor: Colors.amber,
  decorationThickness: 3,
  shadows: [
    Shadow(
        color: Colors.brown,
        offset: Offset(0, -8))
  ],

);
TextStyle hintstyle=TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold
);
