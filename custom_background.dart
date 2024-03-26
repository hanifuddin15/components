import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyswiss/core/constants/app_colors.dart';
import 'package:shopyswiss/features/components/custom_extensions.dart';

enum BackgroundType { splash, intro, welcome, login, homeDelivery }

class CustomBackground extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final BackgroundType backgroundType;
  final bool? isResizeEnable;

  const CustomBackground({
    super.key,
    this.appBar,
    required this.child,
    required this.backgroundType,
    this.isResizeEnable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        image: DecorationImage(
          image: AssetImage(backgroundType.getBackgroundImage()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: isResizeEnable ?? false,
        backgroundColor: Colors.transparent,
        appBar: Platform.isAndroid ? appBar : null,
        body: SafeArea(child: child),
      ),
    );
  }
}
