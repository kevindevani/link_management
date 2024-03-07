import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkmanagement/utils/app_color.dart';
import 'package:linkmanagement/utils/const_strings.dart';
import 'package:linkmanagement/widgets/base_text.dart';

void showErrorSnackBar(String message) {
  Get.showSnackbar(
    GetSnackBar(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      borderRadius: 12,
      overlayBlur: 2,
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white, fontSize: 16,
          fontFamily: ConstantStrings.robotoFontFamily,
          // fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 300),
    ),
  );
}

void showSucessSnackBar(
  String message,
) {
  Get.showSnackbar(
    GetSnackBar(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      borderRadius: 12,
      overlayBlur: 2,
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white, fontSize: 16,
          fontFamily: ConstantStrings.robotoFontFamily,
          // fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 300),
    ),
  );
}

SnackBar customSnackBar({required String message}) {
  return SnackBar(
    margin: const EdgeInsets.symmetric(
      horizontal: 70,
      vertical: 10,
    ),
    elevation: 0,
    backgroundColor: AppColors.black.withOpacity(0.8),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    content: baseText(
      message,
      color: AppColors.white,
      fontSize: 14,
      textAlign: TextAlign.center,
    ),
  );
}
