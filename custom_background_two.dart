import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyswiss/core/constants/app_colors.dart';
import 'package:shopyswiss/features/components/custom_android_statusbar.dart';

class CustomBackGroundTwo extends StatelessWidget {
  final Widget header;
  final Widget body;
  final String bgImage;
  final Widget? floatingActionButton;
  final Color? statusBarColor;

  const CustomBackGroundTwo({
    super.key,
    required this.header,
    required this.body,
    required this.bgImage,
    this.statusBarColor,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Platform.isAndroid
          ? CustomAndroidStatusBar(
              color: statusBarColor ?? AppColors.kWhiteColor)
          : null,
      floatingActionButton: floatingActionButton,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              image:
                  DecorationImage(image: AssetImage(bgImage), fit: BoxFit.fill),
            ),
            child: SafeArea(
              child: header,
            ),
          ),
          Expanded(
            child: RPadding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
