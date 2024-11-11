import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snapeats/features/presentation/views/home/widgets/custom_category_button.dart';
import 'package:snapeats/features/presentation/views/home/widgets/menu_item_card.dart';
import 'package:snapeats/utils/app_colors.dart';
import 'package:snapeats/utils/app_images.dart';
import 'package:snapeats/utils/app_styles.dart';

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
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 134,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.separationColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'LUNCH MENU',
                            style: AppStyles.lightTextSize12White.copyWith(
                                color: AppColors.darkTextColor,
                                fontWeight: FontWeight.w600),
                          ),
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(index == 0 ? 16 : 0, 0, 8, 0),
                  child: CustomCategoryButton(
                      label: 'label', isSelected: false, onPressed: () {}),
                );
              },
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
}
