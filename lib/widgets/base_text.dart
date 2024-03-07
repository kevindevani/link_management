import 'package:flutter/material.dart';
import 'package:linkmanagement/utils/app_color.dart';
import 'package:linkmanagement/utils/const_strings.dart';

Text baseText(
  String? text, {
  FontStyle? fontStyle,
  Color? color = AppColors.black,
  Color underLineColor = AppColors.black,
  bool isUnderline = false,
  bool isLineThrough = false,
  double? fontSize = 16,
  FontWeight? fontWeight = FontWeight.normal,
  double? letterSpacing = 0.0,
  TextAlign? textAlign = TextAlign.start,
  int? maxLine,
  TextOverflow? overflow,
  TextDecoration? textDecoration,
  double? height,
  TextStyle? textStyle,
}) {
  return Text(
    text!,
    // overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
    maxLines: maxLine,
    overflow: overflow,
    style: textStyle ??
        TextStyle(
          fontStyle: fontStyle,
          color: color,
          decoration: isUnderline
              ? TextDecoration.underline
              : isLineThrough
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
          decorationStyle: TextDecorationStyle.solid,
          decorationColor: underLineColor,
          fontSize: fontSize!,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing!,
          fontFamily: ConstantStrings.robotoFontFamily,
          height: height,
        ),
  );
}
