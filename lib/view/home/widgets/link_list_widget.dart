import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkmanagement/controller/home_screen_controller.dart';
import 'package:linkmanagement/utils/app_color.dart';
import 'package:linkmanagement/utils/base_image.dart';
import 'package:linkmanagement/utils/math_utils.dart';
import 'package:linkmanagement/widgets/base_text.dart';

class LinkListWidget extends StatefulWidget {
  final bool isFromEdit;
  final int? linkId;
  final int? index;
  final String title;
  final String link;
  final void Function()? onPressed;
  const LinkListWidget({
    super.key,
    this.linkId,
    required this.index,
    required this.title,
    required this.link,
    required this.isFromEdit,
    required this.onPressed,
  });

  @override
  State<LinkListWidget> createState() => _LinkListWidgetState();
}

class _LinkListWidgetState extends State<LinkListWidget> {
  HomeScreenController homeScreenController = Get.find();

  // String validateLink(String link) {
  //   RegExp instagramRegex =
  //       RegExp(r'^https?:\/\/(?:www\.)?instagram\.com\/[a-zA-Z0-9_]+\/?$');
  //   RegExp facebookRegex =
  //       RegExp(r'^https?:\/\/(?:www\.)?facebook\.com\/[a-zA-Z0-9_]+\/?$');
  //   RegExp tiktokRegex =
  //       RegExp(r'^https?:\/\/(?:www\.)?tiktok\.com\/@([a-zA-Z0-9_]+)\/?$');

  //   if (instagramRegex.hasMatch(link)) {
  //     return AppImages.icInstagram;
  //   } else if (facebookRegex.hasMatch(link)) {
  //     return AppImages.icFacebook;
  //   } else if (tiktokRegex.hasMatch(link)) {
  //     return AppImages.icTiktok;
  //   } else {
  //     return AppImages.icOtherLink;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Expanded(
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [

          //     ],
          //   ),
          // ),

          ///
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              homeScreenController.validateLink(widget.link),
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
                if (widget.title != '')
                  baseText(
                    widget.title,
                    fontSize: 16,
                    color: AppColors.black,
                    maxLine: 1,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                if (widget.title != '')
                  const SizedBox(
                    height: 2,
                  ),
                baseText(
                  widget.link,
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

          const SizedBox(
            width: 3,
          ),

          //
          if (widget.isFromEdit)
            IconButton(
              onPressed: widget.onPressed,
              icon: Image.asset(
                AppImages.icEdit,
                color: AppColors.black,
                height: 24,
              ),
            )
        ],
      ),
    );
  }
}
