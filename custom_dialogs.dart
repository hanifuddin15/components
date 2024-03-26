import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyswiss/core/constants/app_size.dart';
import 'package:shopyswiss/core/constants/app_strings.dart';

import '../../core/constants/app_colors.dart';
import 'custom_button.dart';

showCustomDialog({
  required BuildContext context,
  required VoidCallback onYes,
  String? title,
  String? details,
  String? confirmText,
  String? cancelText,
  bool isCancelDisable = false,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: IntrinsicHeight(
          child: Container(
            padding: REdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12).r,
              color: AppColors.kWhiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? '',
                  style: kTitleMedium,
                ),
                if (details != null) ...[
                  12.verticalSpace,
                  Text(
                    details ?? '',
                    style:
                        kLabelMedium.copyWith(color: AppColors.kGrayColor600),
                  ),
                ],
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (!isCancelDisable) ...[
                      SizedBox(
                        width: 1.sw / 4.5,
                        child: CustomButton(
                          onPress: () => Navigator.of(context).pop(),
                          title: cancelText ?? AppStrings.no.tr(),
                          textColor: AppColors.kGrayColor900,
                          btnColor: AppColors.kGrayColor100,
                          radius: 8.r,
                          padding: 0,
                        ),
                      ),
                      16.horizontalSpace,
                    ],
                    SizedBox(
                      width: 1.sw / 4.5,
                      child: CustomButton(
                        onPress: () {
                          Navigator.of(context).pop();
                          onYes();
                        },
                        title: confirmText ?? AppStrings.yes.tr(),
                        textColor: AppColors.kGrayColor900,
                        radius: 8.r,
                        padding: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
