import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snapeats/utils/app_colors.dart';

class MenuItemsScreen extends StatefulWidget {
  const MenuItemsScreen({super.key});

  @override
  State<MenuItemsScreen> createState() => _MenuItemsScreenState();
}

class _MenuItemsScreenState extends State<MenuItemsScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      systemNavigationBarColor: AppColors.primaryWhite,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                Image.network(
                  'https://loremflickr.com/640/480/girl',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    child: Container(
                      height: 250,
                  decoration:  BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryBlack,
                        AppColors.primaryBlack.withOpacity(0.5),
                        // AppColors.transparent,
                        AppColors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
