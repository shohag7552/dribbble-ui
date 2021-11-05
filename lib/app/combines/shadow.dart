import 'package:flutter/material.dart';

List<BoxShadow> customShadow = [
  BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: 5,
      offset: const Offset(-5, -5),
      blurRadius: 30),
  BoxShadow(
      color: Colors.blue[900]!.withOpacity(0.5),
      spreadRadius: -4,
      offset: const Offset(7, 7),
      blurRadius: 20),
];
