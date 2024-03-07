import 'package:flutter/material.dart';
import 'package:linkmanagement/utils/app_color.dart';

class BaseTextFormField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final String labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final Function(String)? onChanged;
  final bool? obscureText;
  final bool? enabled;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;

  const BaseTextFormField(
      {super.key,
      required this.focusNode,
      required this.textEditingController,
      required this.validator,
      required this.labelText,
      this.suffixIcon,
      this.prefixIcon,
      this.maxLines,
      this.onChanged,
      this.obscureText = false,
      this.enabled = true,
      this.keyboardType,
      this.contentPadding});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      cursorColor: AppColors.black,
      controller: textEditingController,
      obscureText: obscureText!,
      obscuringCharacter: '*',
      keyboardType: keyboardType,
      style: const TextStyle(
        fontSize: 16,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        enabled: enabled!,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        isDense: true,
        labelStyle: TextStyle(
          fontSize: 16,
          color: !enabled! ? AppColors.black : null,
        ),
        // hintText: 'a',
        // hintStyle: const TextStyle(
        //   fontSize: 16,
        //   color: AppColors.grey,
        // ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 2,
            color: AppColors.black,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1.0,
            color: AppColors.grey2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.grey4,
          ),
        ),
        errorStyle: const TextStyle(
          fontSize: 12,
        ),
      ),
      maxLines: maxLines ?? 1,
      minLines: 1,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
    );
  }
}
