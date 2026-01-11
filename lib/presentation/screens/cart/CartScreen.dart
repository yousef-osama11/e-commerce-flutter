import 'package:e_commerce_flutter/presentation/screens/cart/widgets/CartItemCard.dart';
import 'package:e_commerce_flutter/presentation/screens/home/clothesProvider.dart';
import 'package:e_commerce_flutter/presentation/screens/home/homeScreen.dart';
import 'package:e_commerce_flutter/presentation/widgets/CustomButton.dart';
import 'package:e_commerce_flutter/theme/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/fonts.dart';
import '../../widgets/header_section.dart';

class CartScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    return _cartScreenContent(context, ref);
  }
}

Widget _cartScreenContent(BuildContext context, WidgetRef ref) {
  var cartItems = ref.watch(clothesProvider).cartItems;
  var uniqueCartItems = getUniqueCartItems(cartItems);
  var shippingFee = 80.0;
  var priceSection = uniqueCartItems.isNotEmpty
      ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            spacing: 16,
            children: [
              cartPriceRow(
                name: "Sub-total",
                price: getTotalPrice(cartItems).toString(),
              ),
              cartPriceRow(name: "VAT (%)", price: "0.00"),
              cartPriceRow(name: "Shipping fee", price: "80"),
              Container(height: 1, color: ColorManager.grey100),
              cartPriceRow(
                name: "Total",
                price: (getTotalPrice(cartItems) + shippingFee).toString(),
                isTotalValue: true,
              ),
            ],
          ),
        )
      : Center(child: Text("No Items Found", style: AppTextStyle.main));
  return Container(
    color: ColorManager.primaryWhite,
    child: SafeArea(
      child: Scaffold(
        body: Container(
          color: ColorManager.primaryWhite,
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: headerSection(
                      context: context,
                      screenName: 'My Cart',
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20)),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: uniqueCartItems.length,
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              cartItemCard(
                                wearableItem: uniqueCartItems[index],
                                itemCount: getWearableItemCount(
                                  uniqueCartItems[index].name,
                                  cartItems,
                                ),
                                onClickDelete: () {
                                  var newItems = getFilteredCartItems(
                                    uniqueCartItems[index].name,
                                    cartItems,
                                  );
                                  ref
                                      .read(clothesProvider.notifier)
                                      .updateCartItems(newItems);
                                },
                                onClickMinus: () {
                                  var newItems = removeCartItemByName(
                                    uniqueCartItems[index].name,
                                    cartItems,
                                  );
                                  ref
                                      .read(clothesProvider.notifier)
                                      .updateCartItems(newItems);
                                },
                                onClickPlus: () {
                                  var newItems = addCartItemByName(
                                    uniqueCartItems[index].name,
                                    cartItems,
                                  );
                                  ref
                                      .read(clothesProvider.notifier)
                                      .updateCartItems(newItems);
                                },
                              ),
                              SizedBox(height: 14),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 24)),
                  SliverToBoxAdapter(
                    child: priceSection,
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 100)),
                ],
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: customButton(
                    text: "Go To Checkout",
                    postfixIcon: SvgPicture.asset(
                      "assets/images/arrow-right.svg",
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget cartPriceRow({
  required String name,
  required String price,
  bool isTotalValue = false,
}) {
  var color = isTotalValue ? ColorManager.grey900 : ColorManager.grey500;
  return Row(
    children: [
      Text(name, style: AppTextStyle.caption.copyWith(color: color)),
      Spacer(),
      Text("\$ $price", style: AppTextStyle.title),
    ],
  );
}

bool isItemIncludedInCart(String itemName, List<WearableItem> wearableItems) {
  bool isIncluded = false;
  for (final item in wearableItems) {
    if (item.name == itemName) {
      isIncluded = true;
      break;
    }
  }
  return isIncluded;
}

List<WearableItem> getUniqueCartItems(List<WearableItem> wearableItems) {
  final seenNames = <String>{};
  final uniqueItems = <WearableItem>[];

  for (final item in wearableItems) {
    if (!seenNames.contains(item.name)) {
      uniqueItems.add(item);
      seenNames.add(item.name);
    }
  }
  return uniqueItems;
}

int getWearableItemCount(String name, List<WearableItem> wearableItems) {
  return wearableItems.where((item) => item.name == name).toList().length;
}

List<WearableItem> getFilteredCartItems(
  String itemName,
  List<WearableItem> wearableItems,
) {
  return wearableItems.where((item) => item.name != itemName).toList();
}

List<WearableItem> removeCartItemByName(
  String itemName,
  List<WearableItem> wearableItems,
) {
  bool removed = false;
  return wearableItems.where((item) {
    if (!removed && item.name == itemName) {
      removed = true;
      return false;
    }
    return true;
  }).toList();
}

List<WearableItem> addCartItemByName(
  String itemName,
  List<WearableItem> wearableItems,
) {
  final updatedItems = List<WearableItem>.from(wearableItems);

  try {
    final itemToAdd = wearableItems.firstWhere((item) => item.name == itemName);
    updatedItems.add(itemToAdd);
  } catch (e) {
    return updatedItems;
  }

  return updatedItems;
}

double getTotalPrice(List<WearableItem> wearableItems) {
  double totalPrice = 0;
  for (final item in wearableItems) {
    totalPrice += item.price;
  }
  return totalPrice;
}
