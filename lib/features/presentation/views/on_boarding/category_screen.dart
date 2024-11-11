import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:snapeats/features/presentation/views/home/menu_items_screen.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import 'widgets/on_boarding_button.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 8),
                    child: SelectionButton(
                      title: 'Category $index',
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, PageTransition(child: MenuItemsScreen(), type: PageTransitionType.rightToLeft),(route) => false,);
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
