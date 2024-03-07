import 'package:flutter/material.dart';
import 'package:linkmanagement/utils/app_color.dart';
import 'package:linkmanagement/utils/base_image.dart';
import 'package:linkmanagement/utils/math_utils.dart';
import 'package:linkmanagement/widgets/base_text.dart';

class LinkPreviewWidget extends StatefulWidget {
  final String title;
  final String link;
  const LinkPreviewWidget({
    super.key,
    required this.title,
    required this.link,
  });

  @override
  State<LinkPreviewWidget> createState() => _LinkPreviewWidgetState();
}

class _LinkPreviewWidgetState extends State<LinkPreviewWidget> {
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
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    AppImages.icFacebook,
                    height: 50,
                  ),
                ),

                SizedBox(
                  width: getSizeWidth(context, 3),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      baseText(
                        widget.title == '' ? 'your title' : widget.title,
                        fontSize: 16,
                        color: AppColors.black,
                        maxLine: 1,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      baseText(
                        widget.link == '' ? 'your link' : widget.link,
                        fontSize: 14,
                        // maxLine: 1,
                        color: AppColors.grey1,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        isUnderline: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          const SizedBox(
            width: 3,
          ),

          //
          IconButton(
            onPressed: () {
              // Get.back();
            },
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
