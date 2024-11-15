import 'package:flutter/material.dart';
import 'package:snapeats/utils/app_colors.dart';
import 'package:snapeats/utils/app_styles.dart';

class CustomCategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomCategoryButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15,5,10,5),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryGreen : AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:
                isSelected ? AppColors.primaryGreen : AppColors.separationColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppStyles.boldTextSize12Black.copyWith(
                color: isSelected
                    ? AppColors.primaryWhite
                    : AppColors.darkTextColor,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              const Icon(
                Icons.close,
                color: AppColors.primaryWhite,
                size: 15,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
