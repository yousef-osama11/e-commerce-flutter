import 'package:flutter/material.dart';

import 'color_manager.dart';

class AppTextStyle {

  static final TextStyle heading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    height: 1,
    color: ColorManager.grey900,
  );

  static final TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: ColorManager.grey500,
  );
}