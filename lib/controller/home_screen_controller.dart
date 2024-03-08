import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:linkmanagement/models/link_list_model.dart';
import 'package:linkmanagement/utils/base_image.dart';
import 'package:linkmanagement/utils/const_strings.dart';

class HomeScreenController extends GetxController {
  ///
  Box<LinkListModel> linkDataBox = Hive.box(ConstantStrings.linksData);

  String validateLink(String link) {
    // Regular expressions for Instagram, Facebook, and TikTok links
    RegExp instagramRegex = RegExp(r'instagram\.com\/[a-zA-Z0-9_]+\/?$');
    RegExp facebookRegex = RegExp(r'facebook\.com\/[a-zA-Z0-9_]+\/?$');
    RegExp tiktokRegex = RegExp(r'tiktok\.com\/@([a-zA-Z0-9_]+)\/?$');

    if (instagramRegex.hasMatch(link)) {
      return AppImages.icInstagram;
    } else if (facebookRegex.hasMatch(link)) {
      return AppImages.icFacebook;
    } else if (tiktokRegex.hasMatch(link)) {
      return AppImages.icTiktok;
    } else {
      return AppImages.icOtherLink;
    }
  }

  ///
  addLinksData({required LinkListModel linkData}) {
    linkDataBox.add(linkData).then((value) {
      Get.log("links added successfully --> $value");

      Get.log(linkDataBox.values.toList().length.toString());

      Get.back();
    });
  }

  ///
  updateLinksData({
    required int index,
    required LinkListModel linkData,
  }) {
    linkDataBox.putAt(index, linkData).then((value) {
      Get.log("links update successfully --> ");

      Get.back();
    });
  }
}
