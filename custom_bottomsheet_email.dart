import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheetEmail extends StatefulWidget {
  final String? initialEmail;
  final Function(String) onSave;
  final TextEditingController? controller;
  final String? customText;
  final double? height;
  final Color? buttonColor;
  final double? buttonWidth;
  final double? buttonHeight;

  const CustomBottomSheetEmail({
    Key? key,
    this.initialEmail,
    required this.onSave,
    this.controller,
    this.customText,
    this.height,
    this.buttonColor,
    this.buttonWidth,
    this.buttonHeight,
  }) : super(key: key);

  @override
  _CustomBottomSheetEmailState createState() => _CustomBottomSheetEmailState();
}

class _CustomBottomSheetEmailState extends State<CustomBottomSheetEmail> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = widget.controller ??
        TextEditingController(text: widget.initialEmail ?? '');
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
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
              180.verticalSpace,
              SizedBox(
                width: widget.buttonWidth ?? double.infinity,
                height: widget.buttonHeight ?? 48.0,
                child: FloatingActionButton(
                  onPressed: () {
                    widget.onSave(_emailController.text);
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
