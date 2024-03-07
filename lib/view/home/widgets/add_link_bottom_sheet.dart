import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkmanagement/utils/app_color.dart';
import 'package:linkmanagement/utils/math_utils.dart';
import 'package:linkmanagement/view/home/widgets/link_preview_widget.dart';
import 'package:linkmanagement/widgets/app_button.dart';
import 'package:linkmanagement/widgets/base_text.dart';
import 'package:linkmanagement/widgets/base_text_form_field.dart';

class AddLinkBottomSheetWidget extends StatefulWidget {
  const AddLinkBottomSheetWidget({
    super.key,
  });

  @override
  State<AddLinkBottomSheetWidget> createState() =>
      _AddLinkBottomSheetWidgetState();
}

class _AddLinkBottomSheetWidgetState extends State<AddLinkBottomSheetWidget> {
  FocusNode linkTextFocus = FocusNode();
  FocusNode titleTextFocus = FocusNode();

  ///
  TextEditingController linkTextTextController = TextEditingController();
  TextEditingController titleTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    ///
    linkTextTextController.dispose();
    titleTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 36,
              ),
              baseText(
                'Add Link',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close_rounded,
                  color: AppColors.black,
                ),
              )
            ],
          ),

          ///
          // SizedBox(
          //   height: getSizeHeight(context, 1.0),
          // ),

          if (linkTextTextController.text.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getSizeHeight(context, 1.0),
                horizontal: getSizeWidth(context, 4.0),
              ),
              child: LinkPreviewWidget(
                title: titleTextController.text,
                link: linkTextTextController.text,
              ),
            ),

          ///
          Container(
            padding: EdgeInsets.symmetric(
              vertical: getSizeHeight(context, 2),
              horizontal: getSizeWidth(context, 4.0),
            ),
            child: Column(
              children: [
                BaseTextFormField(
                  focusNode: linkTextFocus,
                  textEditingController: linkTextTextController,
                  labelText: 'Enter Url *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter url';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                ),

                ///
                SizedBox(
                  height: getSizeHeight(context, 2.0),
                ),

                BaseTextFormField(
                  focusNode: titleTextFocus,
                  textEditingController: titleTextController,
                  labelText: 'Enter Title (optional)',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter task';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                ),

                ///
                SizedBox(
                  height: getSizeHeight(context, 2.5),
                ),

                ///
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getSizeWidth(context, 0)),
                  child: AppButton(
                    onTap: () {
                      Get.log(titleTextController.text.toString());
                      Get.log(linkTextTextController.text.toString());

                      // Get.back();
                    },
                    buttonHeight: 56.0,
                    buttonTitle: 'Save',
                    fontWeight: FontWeight.w500,
                    titleColor: AppColors.white,
                    borderColor: AppColors.primary,
                    buttonColor: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
