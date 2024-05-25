import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:carlog/core/constants/constants.dart';
import 'package:carlog/core/constants/durations.dart';

class SnackbarsK extends Constants {
  static AnimatedSnackBar infoSnackbar(String text) =>
      AnimatedSnackBar.material(
        text,
        type: AnimatedSnackBarType.info,
        duration: DurationsK.d3000,
        mobilePositionSettings: const MobilePositionSettings(
          topOnAppearance: 50,
        ),
        mobileSnackBarPosition: MobileSnackBarPosition.top,
      );

  static AnimatedSnackBar errorSnackbar(String text) =>
      AnimatedSnackBar.material(
        text,
        type: AnimatedSnackBarType.warning,
        duration: DurationsK.d3000,
        mobilePositionSettings: const MobilePositionSettings(
          topOnAppearance: 50,
        ),
        mobileSnackBarPosition: MobileSnackBarPosition.top,
      );

  static AnimatedSnackBar successSnackbar(String text) =>
      AnimatedSnackBar.material(
        text,
        type: AnimatedSnackBarType.success,
        duration: DurationsK.d3000,
        mobilePositionSettings: const MobilePositionSettings(
          topOnAppearance: 50,
        ),
        mobileSnackBarPosition: MobileSnackBarPosition.top,
      );
}
