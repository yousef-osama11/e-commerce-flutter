import 'dart:ffi';

import 'package:e_commerce_flutter/presentation/screens/home/clothesProvider.dart';
import 'package:e_commerce_flutter/theme/color_manager.dart';
import 'package:e_commerce_flutter/theme/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../homeScreen.dart';

class CategoriesRow extends ConsumerStatefulWidget {
  const CategoriesRow({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return CategoriesRowState();
  }
}

class CategoriesRowState extends ConsumerState<CategoriesRow> {
  List<String> chipNames = [
    "All",
    "T-Shirts",
    "Shoes",
    "Hoodies",
    "pants",
  ];

  WearType wearTypeFromString(String value) {
    switch (value.toLowerCase()) {
      case 'all':
        return WearType.all;
      case 'shoes':
        return WearType.shoes;
      case 't-shirts':
        return WearType.tShirt;
      case 'hoodies':
        return WearType.hoodie;
      case 'pants':
        return WearType.pants;
      default:
        return WearType.notDefined;
    }
  }

  int selectedChipIndex = 0;

  bool isChipSelected(int chipIndex) {
    return chipIndex == selectedChipIndex;
  }

  void onClickChip(int chipIndex) {
    setState(() {
      ref.read(clothesProvider.notifier).selectCategory(wearTypeFromString(chipNames[chipIndex]));
      selectedChipIndex = chipIndex;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      height: 36,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16, right: 8),
        scrollDirection: Axis.horizontal,
        itemCount: chipNames.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: (){
                onClickChip(index);
              },
              child: _customLabelChip(
                isSelected: isChipSelected(index),
                text: chipNames[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _customLabelChip({required bool isSelected, required String text}) {
  var backgroundColor = isSelected
      ? ColorManager.primaryBlue
      : ColorManager.primaryWhite;
  var textColor = isSelected ? ColorManager.primaryWhite : ColorManager.grey900;
  var boarder = isSelected
      ? null
      : Border.all(color: ColorManager.grey100, width: 1);
  return Container(
    alignment: Alignment.center,
    height: 36,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
      border: boarder,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(text, style: AppTextStyle.title.copyWith(color: textColor)),
    ),
  );
}
