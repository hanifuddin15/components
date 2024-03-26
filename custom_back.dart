import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import 'custom_svg.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: CustomSvg(icon: Assets.iconsBack));
  }
}
