import 'package:flutter/material.dart';

final allRAMcharacters = "character";
final RAMbaseurl = 'https://rickandmortyapi.com/api/';
final GOTbaseurl = "https://thronesapi.com/api/v2/";
final allGOTcharacters = "Characters";
const RAMcharactersScreen = '/ram';
const GOTcharactersScreen = '/';
TextStyle headstyle = TextStyle(
  color: Colors.transparent,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
  decorationStyle: TextDecorationStyle.solid,
  decorationColor: Colors.amber,
  decorationThickness: 3,
  shadows: [Shadow(color: Colors.brown, offset: Offset(0, -8))],
);
TextStyle hintstyle =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
