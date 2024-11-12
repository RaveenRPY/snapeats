import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:snapeats/features/data/models/data_model.dart';
import 'package:snapeats/features/presentation/views/on_boarding/category_screen.dart';
import 'package:snapeats/features/presentation/views/on_boarding/widgets/on_boarding_button.dart';
import 'package:snapeats/utils/app_colors.dart';
import 'package:snapeats/utils/app_styles.dart';

import '../../../../utils/app_constants.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Menu> menuList = [];

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      systemNavigationBarColor: AppColors.primaryWhite,
      statusBarIconBrightness: Brightness.dark,
    ));
    setState(() {
      menuList = AppConstants.allMenuList!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        centerTitle: true,
        toolbarHeight: 65,
        title: Text(
          'Menu',
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
              'Please select a Menu',
              style: AppStyles.mediumTextSize14Black,
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                itemCount: menuList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 8),
                    child: SelectionButton(
                      title: menuList[index].title!.en ?? '',
                      onTap: () {
                        setState(() {
                          AppConstants.currentMenuIndex = index;
                        });
                        Navigator.push(context, PageTransition(child: CategoryScreen(selectedMenuIndex: index,), type: PageTransitionType.rightToLeft));
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
