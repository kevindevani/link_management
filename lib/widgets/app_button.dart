import 'package:flutter/material.dart';
import 'package:linkmanagement/utils/app_color.dart';
import 'package:linkmanagement/utils/const_strings.dart';

class AppButton extends StatelessWidget {
  final void Function() onTap;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonRadius;
  final Color? buttonColor;
  final String buttonTitle;
  final Color? titleColor;
  final Color? borderColor;
  final FontWeight fontWeight;
  final double titleSize;
  final EdgeInsetsGeometry margin;

  const AppButton({
    Key? key,
    required this.onTap,
    required this.buttonTitle,
    this.buttonHeight = 56.0,
    this.buttonWidth = double.infinity,
    this.buttonColor,
    this.buttonRadius = 12,
    this.borderColor,
    this.titleSize = 16,
    this.fontWeight = FontWeight.w400,
    this.titleColor,
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(buttonRadius),
      ),
      child: Material(
        color: buttonColor ?? AppColors.grey4,
        child: InkWell(
          onTap: onTap,
          overlayColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              return Colors.black.withOpacity(0.1);
            },
          ),
          child: Container(
            alignment: Alignment.center,
            margin: margin,
            // padding: const EdgeInsets.symmetric(vertical: 18),
            height: buttonHeight,
            width: buttonWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(buttonRadius),
              ),
              border: Border.all(
                color: borderColor ?? AppColors.grey4,
              ),
              color: Colors.transparent,
            ),
            child: Text(
              buttonTitle,
              style: TextStyle(
                fontWeight: fontWeight,
                fontSize: titleSize,
                color: titleColor ?? AppColors.white,
                fontFamily: ConstantStrings.robotoFontFamily,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
