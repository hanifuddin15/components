import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_size.dart';
import '../../core/constants/app_strings.dart';
import 'custom_button.dart';

showCustomDialogForSevenDayCart({
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
              children: [
                Text(
                  title ?? '',
                  style: kTitleMedium,
                ),
                12.verticalSpace,
                Column(
                  children: List.generate(dummyDay.length, (index) => RPadding(
                    padding: REdgeInsets.symmetric(vertical: 6.0),
                    child: Container(
                      padding: REdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
                      decoration: ShapeDecoration(
                        color: AppColors.kGrayColor50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 115.w,
                            padding: REdgeInsets.symmetric(horizontal: 15,vertical: 16),
                            decoration: ShapeDecoration(
                              color: AppColors.kWhiteColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 0.50.w, color: AppColors.kGrayColor600),
                                borderRadius: BorderRadius.circular(8).r,
                              ),
                            ),
                            child: Text(
                              dummyDay[index].tr(),
                              textAlign: TextAlign.center,
                              style: kBodyMedium.copyWith(
                                  color: AppColors.kGrayColor600
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: REdgeInsets.symmetric(horizontal: 12.0,vertical: 16.0),
                            decoration: ShapeDecoration(
                              color: AppColors.kGrayColor100,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8).r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                    child: Container(
                                      padding: REdgeInsets.symmetric(horizontal: 8.0,vertical: 6.0),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1.w, color: AppColors.kGoldColor),
                                          borderRadius: BorderRadius.circular(4.0.r),
                                        ),
                                      ),
                                      child: Center(
                                          child: Icon(
                                            Icons.remove,
                                            size: 14.r,
                                            color: AppColors.kGoldColor,
                                          )),
                                    ),
                                    onTap: () {}
                                  // => context
                                  //     .read<ShopCubit>()
                                  //     .productDecrementCount(
                                  //     state.selectedProductIndividualData!.id!),
                                ),
                                16.horizontalSpace,
                                Text(
                                  "0",
                                  // (state.selectedProductIndividualData!.productCount >= 0 &&
                                  //     state.selectedProductIndividualData!
                                  //         .productCount <=
                                  //         9)
                                  //     ? "0${state.selectedProductIndividualData!.productCount.toString()}"
                                  //     : state.selectedProductIndividualData!.productCount
                                  //     .toString(),
                                  textAlign: TextAlign.center,
                                  style:
                                  kBodyLarge.copyWith(color: AppColors.kGrayColor800),
                                ),
                                16.horizontalSpace,
                                InkWell(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 6.0),
                                      decoration: ShapeDecoration(
                                        color: AppColors.kPrimaryMeatBrownLightColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4).r,
                                        ),
                                      ),
                                      child: Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 14.r,
                                            color: AppColors.kGrayColor800,
                                          )),
                                    ),
                                    onTap: (){

                                    }
                                  // => context
                                  //     .read<ShopCubit>()
                                  //     .productIncrementCount(
                                  //     state.selectedProductIndividualData!.id!),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

List<String> dummyDay =[
  AppStrings.monday,
  AppStrings.tuesday,
  AppStrings.wednesday,
  AppStrings.thursday,
  AppStrings.friday,
  AppStrings.saturday,
  AppStrings.sunday,
];
