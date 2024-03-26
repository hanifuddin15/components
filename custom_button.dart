import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyswiss/features/components/custom_svg.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_size.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPress;
  final bool isCenter;
  final double radius;
  final double border;
  final double elevation;
  final Color borderColor;
  final Color splashColor;
  final Color textColor;
  final Color? iconColor;
  final Color btnColor;
  final TextStyle? textStyle;
  final double? padding;
  final Widget? iconGap;
  final bool outlineButton;
  final bool isIconEnable;
  final String? icon;
  final double? iconSize;

  const CustomButton({
    super.key,
    this.title,
    this.textColor = Colors.white,
    this.btnColor = AppColors.kMeatBrown500,
    this.borderColor = AppColors.kMeatBrown500,
    this.splashColor = AppColors.kMeatBrown600,
    this.border = 0,
    this.elevation = 0,
    this.onPress,
    this.textStyle,
    this.outlineButton = false,
    this.isCenter = true,
    this.isIconEnable = false,
    this.icon,
    this.radius = 12.0,
    this.padding,
    this.iconSize,
    this.iconColor,
    this.iconGap,
  });

  @override
  Widget build(BuildContext context) {
    return isIconEnable
        ? TextButton(
            onPressed: onPress,
            style: ButtonStyle(
              overlayColor:
                  MaterialStateColor.resolveWith((states) => splashColor),
              padding:
                  MaterialStateProperty.all(REdgeInsets.all(padding ?? 16)),
              backgroundColor: MaterialStateProperty.all(btnColor),
              elevation: MaterialStateProperty.all(elevation),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius).r,
                  side: BorderSide(
                    width: outlineButton ? 1 : border,
                    color: outlineButton
                        ? borderColor
                        : border == 0
                            ? Colors.transparent
                            : borderColor,
                  ),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                isSvgImage(icon ?? "")
                    ? CustomSvg(
                        icon: icon!,
                        size: iconSize ?? 24.r,
                        color: iconColor,
                      )
                    : Image.asset(
                        icon ?? "",
                        height: iconSize ?? 24.r,
                        width: iconSize ?? 24.r,
                      ),
                iconGap ?? 5.horizontalSpace,
                Text(
                  title ?? "",
                  textAlign: TextAlign.start,
                  style: textStyle ??
                      kButtonLarge.copyWith(
                        color: outlineButton ? textColor : textColor,
                        fontWeight: boldFont,
                      ),
                ),
              ],
            ),
          )
        : TextButton(
            onPressed: onPress,
            style: ButtonStyle(
              overlayColor:
                  MaterialStateColor.resolveWith((states) => splashColor),
              padding:
                  MaterialStateProperty.all(REdgeInsets.all(padding ?? 16)),
              backgroundColor: MaterialStateProperty.all(btnColor),
              elevation: MaterialStateProperty.all(elevation),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(
                    width: outlineButton ? 1 : border,
                    color: outlineButton
                        ? borderColor
                        : border == 0
                            ? Colors.transparent
                            : borderColor,
                  ),
                ),
              ),
            ),
            child: Text(
              title ?? '',
              textAlign: TextAlign.start,
              style: textStyle ??
                  kButtonLarge.copyWith(
                    color: outlineButton ? textColor : textColor,
                    fontWeight: boldFont,
                  ),
            ),
          );
  }

  bool isSvgImage(String imagePath) {
    return imagePath.toLowerCase().endsWith(".svg");
  }
}
