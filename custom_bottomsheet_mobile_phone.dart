import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_country_code_picker/smart_country_code_picker.dart';

import '../../core/constants/app_size.dart';
import '../../core/constants/app_strings.dart';
import 'custom_plain_text_field.dart';

class CustomBottomSheetMobilePhone extends StatefulWidget {
  final String? initialPhone;
  final String? initialCountryCode;
  final String? initialCountryFlag;
  final Function(String, String, String) onSave;
  final TextEditingController? phoneController;
  final TextEditingController? countryCodeController;
  final TextEditingController? countryFlagController;

  final String? customText;
  final double? height;
  final Color? buttonColor;
  final double? buttonWidth;
  final double? buttonHeight;

  const CustomBottomSheetMobilePhone({
    Key? key,
    this.initialPhone,
    this.initialCountryCode,
    this.initialCountryFlag,
    required this.onSave,
    this.phoneController,
    this.countryCodeController,
    this.countryFlagController,
    this.customText,
    this.height,
    this.buttonColor,
    this.buttonWidth,
    this.buttonHeight,
  }) : super(key: key);

  @override
  _CustomBottomSheetMobilePhoneState createState() =>
      _CustomBottomSheetMobilePhoneState();
}

class _CustomBottomSheetMobilePhoneState
    extends State<CustomBottomSheetMobilePhone> {
  late TextEditingController _phoneController;
  late TextEditingController _countryCodeController;
  late TextEditingController _countryFlagController;

  String? countryCode = '+41';
  String? countryFlag;

  @override
  void initState() {
    super.initState();
    _phoneController = widget.phoneController ??
        TextEditingController(text: widget.initialPhone ?? '');
    _countryCodeController = widget.countryCodeController ??
        TextEditingController(text: widget.initialCountryCode);
    _countryFlagController = widget.countryFlagController ??
        TextEditingController(text: widget.initialCountryFlag);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F6FE),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.5),
            offset: const Offset(0, -196),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: FractionallySizedBox(
        heightFactor: 0.9.h,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.customText ?? 'Custom Text:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  SmartCountryCodePicker(
                    padding: EdgeInsets.zero,
                    emptySearchBuilder: (_) => const SizedBox(),
                    textStyle: kBodyLarge,
                    initialSelection: countryCode,
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    flagWidth: 20.w,
                    alignLeft: false,
                    onChanged: (value) {
                      setState(
                        () {
                          countryCode = value.dialCode;
                          countryFlag = value.flagUri;
                          print(value);
                        },
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomPlainTextField(
                      weight: 0,
                      height: 16.h,
                      controller: _phoneController,
                      radius: 12.r,
                      autofocus: true,
                      hint: AppStrings.mobileNumber.tr(),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              180.verticalSpace,
              SizedBox(
                width: widget.buttonWidth ?? double.infinity,
                height: widget.buttonHeight ?? 48.0,
                child: FloatingActionButton(
                  onPressed: () {
                    widget.onSave(
                        countryFlag!, countryCode!, _phoneController.text);
                  },
                  backgroundColor:
                      widget.buttonColor ?? Theme.of(context).primaryColor,
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
