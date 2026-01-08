import 'package:e_commerce_flutter/presentation/navigation/navigationRoutes.dart';
import 'package:e_commerce_flutter/presentation/screens/home/homeScreen.dart';
import 'package:e_commerce_flutter/theme/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../theme/fonts.dart';

class ItemCard extends StatelessWidget {
  final WearableItem item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/home/product-details',
          extra: item
        );
      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.imagePath,
              height: 174,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 161,
            child: Text(
              item.name,
              style: AppTextStyle.title.copyWith(color: ColorManager.grey900),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "\$ ${item.price}",
            style: AppTextStyle.title.copyWith(
              color: ColorManager.grey500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
