import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
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
    int _mainQty = 1;

    return StatefulBuilder(builder: (BuildContext context, setState) {

      return Container(
        padding: const EdgeInsets.only(top: 13),
        width: double.infinity,
        // height: 68.h,
        decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(25)),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                              image:  DecorationImage(
                                image: NetworkImage(
                                  menuItem.imageUrl ?? 'https://loremflickr.com/640/480/food',
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
                    if (menuItem.modifierGroupRules!.iDs!.isNotEmpty &&
                        menuItem.modifierGroupRules!.iDs!.first != '')
                      Divider(
                        thickness: 5,
                        color: AppColors.separationColor.withOpacity(0.7),
                      ),
                    const SizedBox(height: 20),
                    if (menuItem.modifierGroupRules!.iDs!.isNotEmpty &&
                        menuItem.modifierGroupRules!.iDs!.first != '')
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: menuItem.modifierGroupRules!.iDs!.length,
                          itemBuilder: (context, index) {
                            String id =
                                menuItem.modifierGroupRules!.iDs![index];
                            ModifierGroup group = AppConstants.allModifierList!
                                .firstWhere(
                                    (element) => id == element.modifierGroupId);

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    group.title!.en ?? '',
                                    style: AppStyles.boldTextSize16Black,
                                    textAlign: TextAlign.left,
                                  ),
                                  if (group.modifierOptions!.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 0, 20),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              group.modifierOptions!.length,
                                          itemBuilder: (context, index) {
                                            String id =
                                                group.modifierOptions![index].id!;
                                            Item item = AppConstants
                                                .allMenuItemList!
                                                .firstWhere((element) =>
                                                    id == element.menuItemId, orElse: () => Item());

                                            return item != -1 ? Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  0, 0, 0, 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        item.title?.en ?? group.title!.en!.split(' ')[1],
                                                        style: AppStyles
                                                            .mediumTextSize14Black,
                                                      ),
                                                      Text(
                                                        'Rs. ${item.priceInfo?.price?.pickupPrice ?? '0.00'}',
                                                        style: AppStyles
                                                            .regularTextSize12Black,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize: MainAxisSize.min ,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons.remove_circle_outline_rounded,
                                                          color:
                                                              AppColors.lightGray,
                                                          size: 20,
                                                        ),
                                                      ),
                                                      Text('1'),
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons.add_circle_outline_rounded,
                                                          color:
                                                              AppColors.lightGray,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ) : const SizedBox.shrink();
                                          },),
                                    )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.separationColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState((){
                              if(_mainQty != 1){
                                _mainQty--;
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: AppColors.primaryGreen,
                          ),
                        ),
                        Text(
                          _mainQty.toString(),
                          style: AppStyles.boldTextSize16Black,
                        ),
                        IconButton(
                          onPressed: () {
                            setState((){
                              _mainQty++;
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            color: AppColors.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppMainButton(
                      title: 'Add to Cart',
                      onTap: () {},
                      borderRadius: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
