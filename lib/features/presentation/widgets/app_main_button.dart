import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class AppMainButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String title;
  final Color? color;
  final TextStyle? titleStyle;
  final bool? isEnable;
  final Widget? prefixIcon;
  final double? width;

  const AppMainButton({
    super.key,
    this.onTap,
    required this.title,
    this.color = AppColors.primaryGreen,
    this.titleStyle,
    this.isEnable = true,
    this.prefixIcon,
    this.width,
  });

  @override
  State<AppMainButton> createState() => _AppMainButtonState();
}

class _AppMainButtonState extends State<AppMainButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: const WidgetStatePropertyAll(Size.infinite),
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                vertical: 1.6.h,
                horizontal: 16,
              ),
            ),
            splashFactory: InkRipple.splashFactory,
            backgroundColor: widget.isEnable!
                ? WidgetStatePropertyAll(widget.color)
                : const WidgetStatePropertyAll(
                    AppColors.lightGray,
                  ),
            elevation: const WidgetStatePropertyAll(0),
          ),
          onPressed: widget.isEnable! ? widget.onTap : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.prefixIcon ?? const SizedBox.shrink(),
              widget.prefixIcon != null
                  ? const SizedBox(width: 5)
                  : const SizedBox.shrink(),
              Text(
                widget.title,
                style: widget.isEnable!
                    ? widget.titleStyle ??
                        AppStyles.mediumTextSize16White
                    : AppStyles.mediumTextSize16Gray
              )
            ],
          )),
    );
  }
}
