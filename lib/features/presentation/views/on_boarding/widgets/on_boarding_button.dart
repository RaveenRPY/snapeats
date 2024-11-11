import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';

class SelectionButton extends StatelessWidget {
  final Function? onTap;
  final String title;

  const SelectionButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as GestureTapCallback,
      borderRadius: BorderRadius.circular(60),
      splashColor: AppColors.primaryGreen.withOpacity(0.7),
      highlightColor: AppColors.transparent,
      radius: 120,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: Border.all(
            color: AppColors.primaryGreen,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.mediumTextSize15Black,
          ),
        ),
      ),
    );
  }
}
