import 'package:flutter/cupertino.dart';

import '../../../../theme/fonts.dart';
import '../../../widgets/CustomTextField.dart';

Widget textFieldSection(String title, String hint, [bool isPassword = false]) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(title, style: AppTextStyle.title),
      const SizedBox(height: 4),
      CustomTextField(hint: hint, isPassword: isPassword),
    ],
  );
}
