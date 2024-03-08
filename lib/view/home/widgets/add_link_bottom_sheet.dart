import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkmanagement/controller/home_screen_controller.dart';
import 'package:linkmanagement/models/link_list_model.dart';
import 'package:linkmanagement/utils/app_color.dart';
import 'package:linkmanagement/utils/math_utils.dart';
import 'package:linkmanagement/widgets/app_button.dart';
import 'package:linkmanagement/widgets/base_text.dart';
import 'package:linkmanagement/widgets/base_text_form_field.dart';
import 'package:linkmanagement/widgets/common_snackbar.dart';

class AddLinkBottomSheetWidget extends StatefulWidget {
  final bool isFromEdit;
  final int? linkId;
  final int? index;
  final String? linkText;
  final String? titleText;
  const AddLinkBottomSheetWidget({
    super.key,
    required this.isFromEdit,
    this.index,
    this.linkId,
    this.linkText,
    this.titleText,
  });

  @override
  State<AddLinkBottomSheetWidget> createState() =>
      _AddLinkBottomSheetWidgetState();
}

class _AddLinkBottomSheetWidgetState extends State<AddLinkBottomSheetWidget> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  FocusNode linkTextFocus = FocusNode();
  FocusNode titleTextFocus = FocusNode();

  ///
  TextEditingController linkTextTextController = TextEditingController();
  TextEditingController titleTextController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.isFromEdit) {
      linkTextTextController.text = widget.linkText!;
      titleTextController.text = widget.titleText!;
    }
  }

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
      child: Form(
        key: formKey,
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
                  !widget.isFromEdit ? 'Add Link' : 'Update Link',
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

            linkTextTextController.text.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getSizeHeight(context, 1.0),
                      horizontal: getSizeWidth(context, 4.0),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: getSizeHeight(context, 1),
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.grey5),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              homeScreenController
                                  .validateLink(linkTextTextController.text),
                              height: 50,
                            ),
                          ),

                          SizedBox(
                            width: getSizeWidth(context, 3),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (titleTextController.text != '')
                                  baseText(
                                    titleTextController.text,
                                    fontSize: 16,
                                    color: AppColors.black,
                                    maxLine: 1,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w500,
                                  ),
                                if (titleTextController.text != '')
                                  const SizedBox(
                                    height: 2,
                                  ),
                                baseText(
                                  linkTextTextController.text,
                                  fontSize: 14,
                                  // maxLine: 1,
                                  color: AppColors.grey1,
                                  // overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                  isUnderline: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),

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
                      }
                      if (value.length > 25) {
                        return 'You add upto 25 chracters only';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        formKey.currentState!.validate();
                      });
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
                      return null;
                      // if (value == null || value.isEmpty) {
                      //   return 'Please enter task';
                      // } else {
                      //   return null;
                      // }
                    },
                    onChanged: (value) {
                      setState(() {
                        // formKey.currentState!.validate();
                      });
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
                        if (formKey.currentState!.validate()) {
                          _handleSubmit();
                        }
                      },
                      buttonHeight: 56.0,
                      buttonTitle: !widget.isFromEdit ? 'Save' : 'Update',
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
      ),
    );
  }

  _handleSubmit() {
    if (!widget.isFromEdit) {
      if (homeScreenController.linkDataBox.values.toList().length < 3) {
        int uniqueId = UniqueKey().hashCode;
        homeScreenController.addLinksData(
          linkData: LinkListModel(
            linkId: uniqueId,
            link: linkTextTextController.text.toString(),
            title: titleTextController.text,
          ),
        );
      } else {
        showErrorSnackBar(
          'You can add upto 3 links for now!',
        );
      }
    } else {
      homeScreenController.updateLinksData(
        index: widget.index!,
        linkData: LinkListModel(
          linkId: widget.linkId!, // takes from data
          link: linkTextTextController.text.toString(),
          title: titleTextController.text,
        ),
      );
    }
  }
}
