import 'package:e_commerce_flutter/presentation/widgets/CustomButton.dart';
import 'package:e_commerce_flutter/presentation/widgets/header_section.dart';
import 'package:e_commerce_flutter/theme/color_manager.dart';
import 'package:e_commerce_flutter/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetails extends StatelessWidget {
  final String image;
  final double price;
  final String title;
  final String description;
  final double rate;
  final int reviewerCount;

  const ProductDetails({
    super.key,
    required this.image,
    required this.price,
    required this.title,
    required this.description,
    required this.rate,
    required this.reviewerCount,
  });

  @override
  Widget build(BuildContext context) {
    final reviewsLabel =
        "($reviewerCount reviewer${reviewerCount > 1 ? 's' : ''})";

    return Scaffold(
      backgroundColor: ColorManager.primaryWhite,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headerSection(context: context, screenName: 'Details'),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 24,
                            left: 24,
                            top: 20,
                            bottom: 12,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              image,
                              height: MediaQuery.of(context).size.height / 2.7,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(title, style: AppTextStyle.main),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 24,
                          left: 24,
                          top: 12,
                        ),
                        child: Row(
                          spacing: 8,
                          children: [
                            SvgPicture.asset('assets/images/ic_star.svg'),
                            Text(
                              '$rate/5',
                              style: AppTextStyle.title.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Text(
                              reviewsLabel,
                              style: AppTextStyle.title.copyWith(
                                color: ColorManager.grey500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(description, style: AppTextStyle.caption),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: ColorManager.grey100,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 24,
                          ),
                          child: Row(
                            spacing: 16,
                            children: [
                              Column(
                                children: [
                                  Text('Price', style: AppTextStyle.caption),
                                  Text("\$$price", style: AppTextStyle.title),
                                ],
                              ),
                              Expanded(
                                child: customButton(
                                  text: 'Add To Card',
                                  prefixIcon: SvgPicture.asset(
                                    'assets/images/ic_bug.svg',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
