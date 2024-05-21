import 'dart:ui';

import 'package:flutter/material.dart';

Color color1 = const Color(0xFF17B861);
Color color2 = const Color(0xFF0A522C);
Color color3 = Color(0XFF1AD994);
Color color4 = Color(0XFF0F744F);
LinearGradient gradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [color1, color2],
);

LinearGradient gradientColor2 = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [color3, color4],
);
