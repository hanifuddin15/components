import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyswiss/core/constants/app_size.dart';
import 'package:shopyswiss/features/components/custom_svg.dart';
import 'package:shopyswiss/generated/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onPress;
  final bool isBackDisable;
  const CustomAppBar({
    super.key,
    this.title,
    this.onPress,
    this.isBackDisable = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (!isBackDisable) ...[
          InkWell(
            onTap: onPress ?? () => Navigator.pop(context),
            child: CustomSvg(
              icon: Assets.iconsArrowLeft,
            ),
          ),
          15.horizontalSpace,
        ],
        Text(title ?? ' ', style: kLargeProminent),
      ],
    );
  }
}
