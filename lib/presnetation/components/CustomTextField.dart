import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? postfixIcon;
  final String? hint;
  final bool isPassword;
  final Function(String)? getCurrentInput;

  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.postfixIcon,
    this.hint,
    this.isPassword = false,
    this.getCurrentInput,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var passwordIconPath = 'images/eye-off.svg';
  var showPassword = false;

  void onClickShowPasswordIcon() {
    setState(() {
      showPassword = !showPassword;
      if (passwordIconPath == "images/eye-off.svg") {
        passwordIconPath = "images/eye-on.svg";
      } else {
        passwordIconPath = "images/eye-off.svg";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _customTextField(
      isPassword: widget.isPassword,
      hint: widget.hint,
      getCurrentInput: (input) {
        widget.getCurrentInput?.call(input);
      },
      passwordIconPath: passwordIconPath,
      postfixIcon: widget.postfixIcon,
      showText: showPassword,
      onClickShowPassword: () {
        onClickShowPasswordIcon();
      },
    );
  }
}

Widget _customTextField({
  Widget? prefixIcon,
  Widget? postfixIcon,
  String? hint,
  bool? isPassword,
  required String passwordIconPath,
  Function(String)? getCurrentInput,
  Function? onClickShowPassword,
  required bool showText,
}) {
  Widget? startIcon = prefixIcon != null
      ? Padding(
          padding: const EdgeInsets.only(left: 20, right: 8),
          child: prefixIcon,
        )
      : null;

  Widget? endIcon = postfixIcon != null
      ? Padding(
          padding: const EdgeInsets.only(left: 8, right: 20),
          child: postfixIcon,
        )
      : null;

  var passwordIcon = (isPassword ?? false)
      ? GestureDetector(
          onTap: () {
            onClickShowPassword?.call();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 20),
            child: SvgPicture.asset(
              passwordIconPath,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Color(0xFF999999),
                BlendMode.srcIn,
              ),
            ),
          ),
        )
      : null;
  return SizedBox(
    height: 52,
    child: TextFormField(
      obscureText: (isPassword ?? false) && !showText,
      onChanged: getCurrentInput,
      style: TextStyle(
        color: Color(0xFF999999),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints(minWidth: 24, minHeight: 24),
        prefixIcon: startIcon,
        suffixIconConstraints: BoxConstraints(minWidth: 24, minHeight: 24),
        suffixIcon: passwordIcon ?? endIcon,
        hintStyle: TextStyle(
          color: Color(0xFF999999),
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        hintText: hint ?? "Text...",
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFE6E6E6), width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 1),
        ),
      ),
    ),
  );
}
