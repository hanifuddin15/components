import 'package:easy_localization/easy_localization.dart';
import 'package:shopyswiss/features/components/custom_background.dart';
import 'package:shopyswiss/generated/assets.dart';

extension StringNumberExtraction on dynamic {
  String getBackgroundImage() {
    if (this == BackgroundType.splash) {
      return Assets.imagesSplashBg;
    } else if (this == BackgroundType.intro) {
      return Assets.imagesIntroBg;
    } else if (this == BackgroundType.login) {
      return Assets.imagesLoginBg;
    } else if (this == BackgroundType.welcome) {
      return Assets.imagesWelcomeBackground;
    } else if (this == BackgroundType.homeDelivery) {
      return Assets.imagesHomeBackgroundDelmodule;
    } else {
      return Assets.imagesSplashBg;
    }
  }
}

extension DateTimeParsingExtension on String? {
  String toCustomDateFormat() {
    // Assuming the input string is in a recognizable format like "yyyy-MM-ddTHH:mm:ss"
    // Adjust the pattern as necessary to match your input string format
    DateTime parsedDate = DateFormat("yyyy-MM-ddTHH:mm:ss")
        .parse(this ?? DateTime.now().toString(), true);
    final DateFormat formatter = DateFormat('HH:mm dd MMM yyyy');
    return formatter.format(parsedDate);
  }

  String toDateMonthYearTime() {
    // Assuming the input string is in a recognizable format like "yyyy-MM-ddTHH:mm:ss"
    // Adjust the pattern as necessary to match your input string format
    DateTime parsedDate = DateFormat("yyyy-MM-ddTHH:mm:ss")
        .parse(this ?? DateTime.now().toString(), true);
    final DateFormat formatter = DateFormat('dd MMM yyyy, HH:mm');
    return formatter.format(parsedDate);
  }

  String toDateMonthYear() {
    final parsedDate = DateTime.parse(this ?? DateTime.now().toString());
    return DateFormat('dd MMM, yyyy').format(parsedDate);
  }

  String toDateMonth() {
    final parsedDate = DateTime.parse(this ?? DateTime.now().toString());
    return DateFormat('dd MMM').format(parsedDate);
  }
}
