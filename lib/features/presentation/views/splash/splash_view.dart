import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapeats/features/presentation/views/on_boarding/menu_screen.dart';
import 'package:snapeats/utils/app_colors.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.primaryGreen,
      statusBarIconBrightness: Brightness.dark,
    ));
    Future.delayed(Duration(seconds: 2), () => Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: MenuScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryGreen,
      child: Center(
        child: Text(
          'SnapEats',
          style: GoogleFonts.urbanist(
            fontSize: 50,
            color: AppColors.primaryWhite,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
