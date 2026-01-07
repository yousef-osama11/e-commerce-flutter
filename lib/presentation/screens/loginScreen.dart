import 'package:e_commerce_flutter/theme/color_manager.dart';
import 'package:e_commerce_flutter/theme/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomTextField.dart';

class LoginScreen extends StatefulWidget {
  final Function? onClickSignIn;
  final Function? onClickJoin;

  const LoginScreen({super.key, this.onClickSignIn, this.onClickJoin});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  String username = "";
  String password = "";

  void onChangeUsername(String username) {
    setState(() {
      this.username = username;
    });
  }

  void onChangePassword(String password) {
    setState(() {
      this.password = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loginScreenContent(
      onClickSignIn: () {
        widget.onClickSignIn?.call();
        // validate input
      },
      onClickJoin: widget.onClickJoin,
      onUpdateUsername: (username) {
        onChangeUsername(username);
      },
      onUpdatePassword: (password) {
        onChangePassword(password);
      },
    );
  }
}

Widget _loginScreenContent({
  Function? onClickSignIn,
  Function? onClickJoin,
  Function(String)? onUpdateUsername,
  Function(String)? onUpdatePassword,
}) {
  return Scaffold(
    body: Container(
      color: ColorManager.primaryWhite,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 59),
                        Text("Login to your Account", style: AppTextStyle.heading),
                        SizedBox(height: 8),
                        Text(
                          "It's great to see you again.",
                          style: AppTextStyle.caption,
                        ),
                        SizedBox(height: 24),
                        Text("Username", style: AppTextStyle.title),
                        SizedBox(height: 4),
                        CustomTextField(
                          hint: "Enter your username",
                          getCurrentInput: (input) {
                            onUpdateUsername?.call(input);
                          },
                        ),
                        SizedBox(height: 16),
                        Text("Password", style: AppTextStyle.title),
                        SizedBox(height: 4),
                        CustomTextField(
                          hint: "Enter your password",
                          isPassword: true,
                          getCurrentInput: (input) {
                            onUpdatePassword?.call(input);
                          },
                        ),
                        SizedBox(height: 55),
                        customButton(text: "Sign In", onClick: onClickSignIn),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: AppTextStyle.caption,
                            ),
                            GestureDetector(
                              onTap: () {
                                onClickJoin?.call();
                              },
                              child: Text(
                                "Join",
                                style: AppTextStyle.title.copyWith(
                                  color: ColorManager.grey900,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 1,
                                  decorationColor: ColorManager.grey900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}
