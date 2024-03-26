import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyswiss/core/constants/app_colors.dart';
import 'package:shopyswiss/core/constants/app_strings.dart';
import 'package:shopyswiss/features/components/custom_button.dart';
import 'package:shopyswiss/generated/assets.dart';

class CustomSuccessBtn extends StatelessWidget {
  const CustomSuccessBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: CustomButton(
        elevation: .5,
        isIconEnable: true,
        padding: 10,
        splashColor: Colors.transparent,
        icon: Assets.iconsCheckCircle,
        textColor: AppColors.kRichBlack900,
        btnColor: AppColors.kWhiteColor,
        title: AppStrings.done.tr(),
        onPress: () {},
      ),
    );
  }
}
