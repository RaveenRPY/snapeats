import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  ///fontSize - 12
  static TextStyle lightTextSize12White = GoogleFonts.urbanist(
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: AppColors.primaryWhite,
  );
  ///fontSize - 14
  static TextStyle mediumTextSize14Black = GoogleFonts.urbanist(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColors.darkTextColor,
  );
  ///fontSize - 15
  static TextStyle regularTextSize15Black = GoogleFonts.urbanist(
    fontWeight: FontWeight.w300,
    fontSize: 15,
    color: AppColors.darkTextColor,
  );
  static TextStyle mediumTextSize15Black = GoogleFonts.urbanist(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: AppColors.darkTextColor,
  );

  ///fontSize - 20
  static TextStyle mediumTextSize20White = GoogleFonts.urbanist(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: AppColors.primaryWhite,
  );

}
