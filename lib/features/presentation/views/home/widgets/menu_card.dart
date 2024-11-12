import 'package:flutter/material.dart';
import 'package:snapeats/utils/app_constants.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';

class MenuCard extends StatefulWidget {
  final String title;
  final int index;
  final Function? onTap;
  final bool? isSelected;

  const MenuCard(
      {super.key, required this.title, required this.index, this.onTap, this.isSelected = false});

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  late int? _selectedIndex;
  bool isSelected = false;

  @override
  void initState() {
    setState(() {
      _selectedIndex = AppConstants.currentMenuIndex;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: (){
          setState(() {
            _selectedIndex = widget.index;
            isSelected = !isSelected;
          });
          widget.onTap!();
        },
        splashColor: AppColors.primaryGreen.withOpacity(0.2),
        radius: 120,
        highlightColor: AppColors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.transparent,
            border: Border.all(
              color: AppColors.separationColor,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: AppStyles.boldTextSize16Black,
                ),
                Radio(
                  value: widget.index,
                  toggleable: true,
                  groupValue: widget.isSelected! ? widget.index : null,
                  onChanged: (_) {
                    setState(() {
                      isSelected = !isSelected;
                    });
                    widget.onTap!();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
