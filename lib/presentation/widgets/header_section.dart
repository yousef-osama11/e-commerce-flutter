import 'package:e_commerce_flutter/theme/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

Widget headerSection({
  required BuildContext context,
  required String screenName,
  String iconName = 'ic_back_arrow',
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, top: 44),
    child: Stack(
      children: [
        GestureDetector(
          onTap: () {context.pop();},
          child: SvgPicture.asset(
            'assets/images/$iconName.svg',
            height: 24,
            width: 24,
          ),
        ),
        Center(child: Text(screenName, style: AppTextStyle.main)),
      ],
    ),
  );
}
