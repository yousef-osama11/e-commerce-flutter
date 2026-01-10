import 'package:e_commerce_flutter/theme/color_manager.dart';
import 'package:flutter/material.dart';

Widget customButton({String? text, Widget? prefixIcon, Widget? postfixIcon, Function? onClick}) {
  double startIconPadding = text != null
  ? 10.0
  : 0.0;

  Widget? startIcon = prefixIcon != null
      ? Padding(padding: EdgeInsets.only(right: startIconPadding), child: prefixIcon)
      : null;

  Widget? endIcon = postfixIcon != null
      ? Padding(padding: const EdgeInsets.only(left: 10), child: postfixIcon)
      : null;

  return GestureDetector(
    onTap: (){
      onClick?.call();
    },
    child: Container(
      alignment: Alignment.center,
      height: 54,
      decoration: BoxDecoration(
        color: ColorManager.primaryBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          startIcon ?? SizedBox(),
          Text(
            text ?? "",
            style: TextStyle(
              color: ColorManager.primaryWhite,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
          endIcon ?? SizedBox()
        ],
      ),
    ),
  );
}
