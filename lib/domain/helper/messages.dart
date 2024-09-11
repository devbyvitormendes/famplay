import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/famplay_icon.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

sealed class Messages {

  static void showError(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        backgroundColor: ColorsConstants.orange,
        textStyle: const TextStyle(
          fontSize: 16,
          color: ColorsConstants.white,
          fontWeight: FontWeight.w900,
        ),
        message: message,
        icon: const Icon(
          FamplayIcons.error,
          size: 120,
          color: ColorsConstants.wine,
        ),
      ),
    );
  }

  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        backgroundColor: ColorsConstants.blue,
        textStyle: const TextStyle(
          fontSize: 16,
          color: ColorsConstants.brown,
          fontWeight: FontWeight.w900,
        ),
        message: message,
        icon: const Icon(
          FamplayIcons.info,
          size: 120,
          color: ColorsConstants.yellow,
        ),
      ),
    );
  }

  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        backgroundColor: ColorsConstants.green,
        textStyle: const TextStyle(
          fontSize: 16,
          color: ColorsConstants.brown,
          fontWeight: FontWeight.w900,
        ),
        message: message,
        icon: const Icon(
          FamplayIcons.success,
          size: 120,
          color: ColorsConstants.blue,
        ),
      ),
    );
  }

  static void showWarning(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        backgroundColor: ColorsConstants.yellow,
        textStyle: const TextStyle(
          fontSize: 16,
          color: ColorsConstants.brown,
          fontWeight: FontWeight.w900,
        ),
        message: message,
        iconRotationAngle: 20,
        iconPositionTop: -20,
        icon: const Icon(
          FamplayIcons.warning,
          size: 120,
          color: ColorsConstants.wine,
        ),
      ),
    );
  }

}