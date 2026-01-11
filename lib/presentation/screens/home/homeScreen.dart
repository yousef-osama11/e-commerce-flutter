import 'dart:ffi';

import 'package:e_commerce_flutter/presentation/navigation/navigationRoutes.dart';
import 'package:e_commerce_flutter/presentation/screens/home/clothesProvider.dart';
import 'package:e_commerce_flutter/presentation/screens/home/widgets/CategoriesRow.dart';
import 'package:e_commerce_flutter/presentation/screens/home/widgets/ItemCard.dart';
import 'package:e_commerce_flutter/presentation/widgets/CustomButton.dart';
import 'package:e_commerce_flutter/presentation/widgets/CustomTextField.dart';
import 'package:e_commerce_flutter/theme/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/fonts.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return _homeScreenContent(ref,context);
  }
}

class WearableItem {
  final String imagePath;
  final String name;
  final String description;
  final double price;
  final WearType type;
  final double rate;
  final int reviewsCount;
  final String size;

  const WearableItem({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.type,
    required this.description,
    required this.rate,
    required this.reviewsCount,
    required this.size
  });
}

Widget _homeScreenContent(WidgetRef ref, BuildContext context) {
  var wearableItems = ref.watch(clothesProvider).items;
  var searchBar = CustomTextField(
    getCurrentInput: (input){
      ref.read(clothesProvider.notifier).searchForWear(input);
    },
    hint: "Search for clothes...",
    prefixIcon: SvgPicture.asset("assets/images/ic_ic_search.svg"),
  );

  return Scaffold(
    body: Container(
      color: ColorManager.primaryWhite,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 59),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Discover", style: AppTextStyle.heading),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(child: searchBar),
                        SizedBox(width: 8),
                        SizedBox(
                          width: 52,
                          child: customButton(
                              prefixIcon: SvgPicture.asset(
                                "assets/images/ic_filter.svg",
                              ),
                              onClick: (){
                                CartRoute().push(context);
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  CategoriesRow(),
                  SizedBox(height: 24),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ItemCard(item: wearableItems[index]);
                }, childCount: wearableItems.length),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 224,
                  crossAxisSpacing: 19,
                  mainAxisSpacing: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

enum WearType { all,shoes, tShirt, hoodie, pants , notDefined}
