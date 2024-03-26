import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyswiss/core/constants/app_size.dart';

import '../../core/constants/app_colors.dart';

class CustomPlainTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onPress;
  final Function(String)? onChanged;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? textColor;
  final Color? fillColor;
  final Color? hintColor;
  final Function? validation;
  final TextInputType? keyboardType;
  final String? errorText;
  final double? prefixIconSize;
  final double? errorTextHeight;
  final double? hintTextSize;
  final double? height;
  final double? weight;
  final double? radius;
  final bool isTextCenter;
  final bool autofocus;
  final bool isError;
  final Function(String)? onSaved;
  final bool? isView;
  final bool? isEmail;
  final TextInputAction? textInputAction;

  CustomPlainTextField(
      {Key? key,
      this.hint,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.onPress,
      this.errorText,
      this.prefixIconColor,
      this.suffixIconColor,
      this.fillColor,
      this.hintColor,
      this.onSaved,
      this.keyboardType,
      this.isView,
      this.isEmail,
      this.isTextCenter = false,
      this.isError = false,
      this.autofocus = false,
      this.validation,
      this.prefixIconSize,
      this.onChanged,
      this.errorTextHeight,
      this.textColor,
      this.hintTextSize,
      this.height,
      this.weight,
      this.textInputAction = TextInputAction.next,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 12.r),
        border: !isError ? null : Border.all(color: AppColors.kErrorColor),
      ),
      child: TextFormField(
        autofocus: autofocus,
        textAlign: isTextCenter ? TextAlign.center : TextAlign.start,
        obscureText: isView != null ? isView! : false,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        textInputAction: textInputAction,
        style: kBodyLarge.copyWith(color: textColor),
        decoration: InputDecoration(
            contentPadding: REdgeInsets.symmetric(
                vertical: height ?? 20.h, horizontal: weight ?? 25.w),
            isDense: true,
            suffixIcon: suffixIcon == null
                ? null
                : InkWell(
                    onTap: onPress,
                    child: Icon(
                      suffixIcon,
                      size: 20.r,
                      color: suffixIconColor,
                    ),
                  ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(radius ?? 12.r),
            ),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(radius ?? 12.r),
            ),
            filled: true,
            errorStyle: const TextStyle(height: 0),
            hintStyle: kBodyLarge.copyWith(
              color: hintColor ?? AppColors.kGrayColor400,
            ),
            hintText: hint,
            errorText: errorText,
            fillColor: fillColor ?? Colors.transparent),
        validator: validation as String? Function(String?)?,
        onSaved: onSaved as String? Function(String?)?,
      ),
    );
  }
}
