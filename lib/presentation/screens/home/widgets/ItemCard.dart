import 'package:e_commerce_flutter/presentation/screens/home/homeScreen.dart';
import 'package:e_commerce_flutter/theme/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme/fonts.dart';

Widget itemCard({required WearableItem item}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Image.asset(item.imagePath, height: 174, width: double.infinity,fit: BoxFit.fitWidth),
      ),
      SizedBox(height: 8),
      SizedBox(
        width: 161,
        child: Text(
          item.name,
          style: AppTextStyle.title.copyWith(color: ColorManager.grey900),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      SizedBox(height: 3),
      Text(
        "\$ ${item.price.toString()}",
        style: AppTextStyle.title
            .copyWith(color: ColorManager.grey500)
            .copyWith(fontSize: 12),
      ),
    ],
  );
}
