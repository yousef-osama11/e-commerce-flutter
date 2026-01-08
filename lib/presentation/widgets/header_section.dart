import 'package:e_commerce_flutter/theme/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget headerSection({
  required String screenName,
  String iconName = 'ic_back_arrow',
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, top: 44),
    child: Stack(
      children: [
        SvgPicture.asset('assets/images/$iconName.svg', height: 24, width: 24),
        Center(child: Text('Details', style: AppTextStyle.main)),
      ],
    ),
  );
}
