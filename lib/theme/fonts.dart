import 'package:flutter/material.dart';

import 'color_manager.dart';

class AppTextStyle {

  static const TextStyle heading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    height: 1,
    color: ColorManager.grey900,
  );

  static const TextStyle main = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: ColorManager.grey900,
  );


  static const TextStyle caption = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: ColorManager.grey500,
  );

  static const TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: ColorManager.grey900,
  );
}