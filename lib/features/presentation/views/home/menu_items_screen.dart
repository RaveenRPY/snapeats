import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snapeats/features/data/models/data_model.dart';
import 'package:snapeats/features/presentation/views/home/widgets/custom_category_button.dart';
import 'package:snapeats/features/presentation/views/home/widgets/menu_card.dart';
import 'package:snapeats/features/presentation/views/home/widgets/menu_item_card.dart';
import 'package:snapeats/features/presentation/widgets/app_main_button.dart';
import 'package:snapeats/utils/app_colors.dart';
import 'package:snapeats/utils/app_constants.dart';
import 'package:snapeats/utils/app_images.dart';
import 'package:snapeats/utils/app_styles.dart';

class MenuItemsScreen extends StatefulWidget {
  final List<Category> currentCategoryList;

  const MenuItemsScreen({super.key, required this.currentCategoryList});

  @override
  State<MenuItemsScreen> createState() => _MenuItemsScreenState();
}

class _MenuItemsScreenState extends State<MenuItemsScreen> {
  int selectedMenuIndex = AppConstants.currentMenuIndex!;
  List<Category> newCategoryList = [];

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      systemNavigationBarColor: AppColors.primaryWhite,
      statusBarIconBrightness: Brightness.dark,
    ));
    setState(() {
      newCategoryList = widget.currentCategoryList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Image.network(
                  'https://loremflickr.com/640/480/shop',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryBlack,
                          AppColors.primaryBlack.withOpacity(0.6),
                          AppColors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 92, left: 24, right: 24),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'El Cabanyal',
                              style: AppStyles.boldTextSize32White,
                            ),
                            Text(
                              'FASTFOOD · BURGERS',
                              style: AppStyles.mediumTextSize14White,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://loremflickr.com/100/100/food'),
                          backgroundColor: AppColors.darkTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryWhite,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColors.separationColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 50,
                              child: SvgPicture.asset(AppImages.icMode1),
                            ),
                            ColoredBox(
                              color: AppColors.separationColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 18),
                                child: SvgPicture.asset(AppImages.icMode3),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: SvgPicture.asset(AppImages.icMode2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _showBottomSheet(context);
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.separationColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(13,0,5,0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            AppConstants.allMenuList![AppConstants.currentMenuIndex!].title!.en ?? '',
                            style: AppStyles.boldTextSize14Black,
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.keyboard_arrow_down_rounded)
                        ],
                      ),
                    ),
                  ),
                ),
                SvgPicture.asset(AppImages.icSearch),
              ],
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 35,
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: newCategoryList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(index == 0 ? 16 : 0, 0, 8, 0),
                    child: CustomCategoryButton(
                      label: newCategoryList[index].title!.en ?? '',
                      isSelected: AppConstants.currentCategoryIndex == index,
                      onPressed: () {},
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MenuItemCard(
                  title: 'Bacon Wrapped Hotdog',
                  price: 'LKR 3200.00',
                  description: 'Classic sandwich with cheese',
                  isDeal: true,
                  isLastItem: index == 10,
                  image: 'https://loremflickr.com/50/50/food',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      useSafeArea: true,
      barrierColor: AppColors.primaryBlack.withOpacity(0.8),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 13),
          width: double.infinity,
          height: 68.h,
          decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select menu',
                      style: AppStyles.boldTextSize24Black,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppColors.lightGray,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: AppColors.separationColor,
                thickness: 1,
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: AppConstants.allMenuList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: MenuCard(
                          title: AppConstants.allMenuList![index].title!.en ?? '',
                          index: index,
                          onTap: () {
                            log('sd');
                            setState(() {
                            });
                          },
                          isSelected: selectedMenuIndex == index,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: AppMainButton(
                  title: 'Done',
                  onTap: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
