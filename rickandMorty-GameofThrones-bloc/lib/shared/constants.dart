import 'package:flutter/material.dart';

const String allRAMcharacters = "character";
const String RAMbaseurl = 'https://rickandmortyapi.com/api/';
const String GOTbaseurl = "https://thronesapi.com/api/v2/";
const String allGOTcharacters = "Characters";
const String RAMcharactersScreen = '/ram';
const String GOTcharactersScreen = '/';

const TextStyle headstyle = TextStyle(
  color: Colors.transparent,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
  decorationStyle: TextDecorationStyle.solid,
  decorationColor: Colors.amber,
  decorationThickness: 3,
  shadows: [Shadow(color: Colors.brown, offset: Offset(0, -8))],
);

const TextStyle hintstyle =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
