import 'package:flutter/material.dart';

List<Widget> imageWidgetList = [
  Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'asset/tower1.png',
        height: 85,
        width: 85,
        fit: BoxFit.fill,
        isAntiAlias: false,
      ),
    ),
  ),
  Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'asset/tower2.png',
        height: 85,
        width: 85,
        fit: BoxFit.fill,
        isAntiAlias: false,
      ),
    ),
  ),
  Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'asset/tower3.png',
        height: 85,
        width: 85,
        fit: BoxFit.fill,
        isAntiAlias: false,
      ),
    ),
  ),
  Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'asset/tower4.png',
        height: 85,
        width: 85,
        fit: BoxFit.fill,
        isAntiAlias: false,
      ),
    ),
  ),
];
