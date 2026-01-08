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
        color: Color(0xFF3669C9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          startIcon ?? SizedBox(),
          Text(
            text ?? "",
            style: TextStyle(
              color: Colors.white,
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
