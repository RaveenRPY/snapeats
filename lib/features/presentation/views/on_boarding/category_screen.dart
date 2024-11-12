import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:snapeats/features/data/models/data_model.dart';
import 'package:snapeats/features/presentation/views/home/menu_items_screen.dart';
import 'package:snapeats/utils/app_constants.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import 'widgets/on_boarding_button.dart';

class CategoryScreen extends StatefulWidget {
  final int selectedMenuIndex;

  const CategoryScreen({super.key, required this.selectedMenuIndex});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> categoryList = [];

  @override
  void initState() {
    setState(() {
      String menuCategoryId = AppConstants
          .allMenuList![widget.selectedMenuIndex].menuCategoryIDs![0];
       categoryList = AppConstants.allCategoryList!.where(
        (element) => element.menuCategoryId == menuCategoryId
      ).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.primaryWhite,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 65,
        centerTitle: true,
        title: Text(
          'Category',
          style: AppStyles.mediumTextSize20White,
        ),
      ),
      backgroundColor: AppColors.primaryWhite,
      body: Padding(
        padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please select a Category',
              style: AppStyles.mediumTextSize14Black,
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                itemCount: categoryList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 8),
                    child: SelectionButton(
                      title: categoryList[index].title!.en ?? '',
                      onTap: () {
                        setState(() {
                          AppConstants.currentCategoryIndex = index;
                          AppConstants.currentCategoryList = categoryList;
                        });
                        Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: MenuItemsScreen(currentCategoryList: categoryList),
                              type: PageTransitionType.rightToLeft),
                          (route) => false,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
