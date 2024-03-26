import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyswiss/core/constants/app_colors.dart';

void showCustomSnackBar({
  required BuildContext context,
  String? message,
  bool isError = false,
  bool isCenterText = false,
}) {
  Flushbar(
    icon: Icon(
      isError ? Icons.warning_amber_rounded : Icons.check_circle_outline,
      color: isError ? AppColors.kErrorColor : AppColors.kRichBlack900,
    ),
    message: message ?? "",
    duration: const Duration(seconds: 3),
    margin: REdgeInsets.all(8.0),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    messageColor: isError ? AppColors.kErrorColor : AppColors.kRichBlack900,
    textDirection: Directionality.of(context),
    boxShadows: [AppColors.kBackGroundShadow],
    borderRadius: BorderRadius.circular(8).r,
    backgroundColor: isError ? AppColors.kWhiteColor : AppColors.kMeatBrown500,
  ).show(context);
}
