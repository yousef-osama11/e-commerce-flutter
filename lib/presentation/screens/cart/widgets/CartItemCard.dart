import 'package:e_commerce_flutter/presentation/screens/home/homeScreen.dart';
import 'package:e_commerce_flutter/theme/color_manager.dart';
import 'package:e_commerce_flutter/theme/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget cartItemCard({
  required WearableItem wearableItem,
  required int itemCount,
  Function? onClickDelete,
  Function? onClickPlus,
  Function? onClickMinus,
}) {
  return Align(
    alignment: Alignment.center,
    child: Container(
      height: 107,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.grey100),
        color: ColorManager.primaryWhite,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 14,
            left: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                wearableItem.imagePath,
                height: 79,
                width: 83,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            top: 14,
            left: 114,
            child: Text(
              wearableItem.name,
              style: AppTextStyle.main.copyWith(fontSize: 14),
            ),
          ),
          Positioned(
            top: 35,
            left: 114,
            child: Text(
              "Size ${wearableItem.size}",
              style: AppTextStyle.caption.copyWith(fontSize: 12),
            ),
          ),
          Positioned(
            top: 73,
            left: 114,
            child: Text(
              "\$ ${wearableItem.price}",
              style: AppTextStyle.main.copyWith(fontSize: 14),
            ),
          ),
          Positioned(
            bottom: 14,
            right: 15.5,
            child: SizedBox(
              width: 72.5,
              child: Row(
                children: [
                  GestureDetector(onTap: (){
                    onClickMinus?.call();
                  },child: SvgPicture.asset('assets/images/minus-ic.svg')),
                  Spacer(),
                  Text(
                    itemCount.toString(),
                    style: AppTextStyle.main.copyWith(fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(onTap: (){
                    onClickPlus?.call();
                  },child: SvgPicture.asset('assets/images/plus-ic.svg')),
                ],
              ),
            ),
          ),
          Positioned(
            top: 14,
            right: 15,
            child: GestureDetector(
              onTap: () {
                onClickDelete?.call();
              },
              child: SvgPicture.asset('assets/images/trash-ic.svg'),
            ),
          ),
        ],
      ),
    ),
  );
}
