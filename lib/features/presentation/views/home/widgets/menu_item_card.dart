import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';

class MenuItemCard extends StatelessWidget {
  final String title;
  final String? description;
  final String price;
  final bool? isDeal;
  final String? image;
  final bool? isLastItem;
  final Function? onTap;

  const MenuItemCard(
      {super.key,
      required this.title,
      this.description,
      required this.price,
      this.isDeal = false,
      this.image,
      this.isLastItem = false,
      this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: (){
          onTap!();
        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                      color: AppColors.separationColor,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(
                              image ?? 'https://loremflickr.com/50/50/food'))),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppStyles.boldTextSize16Black,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        description ?? '',
                        style: AppStyles.regularTextSize12Black,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price,
                            style: AppStyles.semiTextSize14Green,
                          ),
                          if (isDeal != null && isDeal == true)
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.promoColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                child: Text('Promotion',
                                    style: AppStyles.boldTextSize12Black),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: !isLastItem! ? const Divider(
                color: AppColors.separationColor,
              ) : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
