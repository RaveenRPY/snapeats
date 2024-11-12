import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:snapeats/features/data/models/data_model.dart';
import 'package:snapeats/utils/app_constants.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../widgets/app_main_button.dart';

class MenuItemDetailsView extends StatelessWidget {
  final Item menuItem;

  const MenuItemDetailsView({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return Container(
        padding: const EdgeInsets.only(top: 13),
        width: double.infinity,
        // height: 68.h,
        decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(25)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close_rounded,
                  color: AppColors.disableGray,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://loremflickr.com/640/480/food',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            menuItem.title!.en ?? '',
                            style: AppStyles.boldTextSize18Black,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Rs. ${menuItem.priceInfo?.price!.pickupPrice ?? '0.00'}',
                            style: AppStyles.boldTextSize20Black,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.primaryGreen,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: AppColors.primaryGreen,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '5.0',
                              style: AppStyles.boldTextSize12Black,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      menuItem.description!.en ?? '',
                      style: AppStyles.lightTextSize14Black,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              Divider(thickness: 5,color: AppColors.separationColor.withOpacity(0.7),),
              const SizedBox(height: 20),

              if (menuItem.modifierGroupRules!.iDs!.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: menuItem.modifierGroupRules!.iDs!.length,
                  itemBuilder: (context, index) {
                    String id = menuItem.modifierGroupRules!.iDs![index];
                    log(menuItem.menuItemId.toString());
                    // ModifierGroup group = AppConstants.allModifierList!.firstWhere((element) => id == element.modifierGroupId);

                    return Column(children: [
                      Text(
                        'group.title!.en' ?? '',
                        style: AppStyles.lightTextSize14Black,
                        textAlign: TextAlign.left,
                      ),
                    ],);
                  },
                ),
            ],
          ),
        ),
      );
    });
  }
}
