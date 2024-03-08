import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:linkmanagement/controller/home_screen_controller.dart';
import 'package:linkmanagement/models/link_list_model.dart';
import 'package:linkmanagement/utils/app_color.dart';
import 'package:linkmanagement/utils/const_strings.dart';
import 'package:linkmanagement/utils/math_utils.dart';
import 'package:linkmanagement/view/home/widgets/add_link_bottom_sheet.dart';
import 'package:linkmanagement/view/home/widgets/link_list_widget.dart';
import 'package:linkmanagement/widgets/base_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  TabController? tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: baseText(
          'HOME',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
          letterSpacing: 1,
        ),
        bottom: TabBar(
          controller: tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.black,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: ConstantStrings.robotoFontFamily,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: ConstantStrings.robotoFontFamily,
          ),
          indicatorColor: AppColors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 2.0,
            ),
          ),
          dividerColor: AppColors.grey5,
          automaticIndicatorColorAdjustment: false,
          tabs: const [
            Tab(text: 'Empty'),
            Tab(text: 'Links'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(
            child: baseText('Empty'),
          ),

          //2
          ValueListenableBuilder(
              valueListenable: homeScreenController.linkDataBox.listenable(),
              builder: (context, box, child) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: getSizeWidth(context, 4),
                  ),
                  child: ListView.builder(
                    itemCount: box.values.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                      top: getSizeHeight(context, 2),
                      bottom: getSizeHeight(context, 10),
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      LinkListModel linkData = box.values.toList()[index];
                      return LinkListWidget(
                        isFromEdit: true,
                        index: index,
                        linkId: linkData.linkId,
                        title: linkData.title,
                        link: linkData.link,
                        onPressed: () async {
                          await showModalBottomSheet(
                            context: context,
                            backgroundColor: AppColors.white,
                            isScrollControlled: true,
                            useSafeArea: true,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: AddLinkBottomSheetWidget(
                                    isFromEdit: true,
                                    index: index,
                                    linkId: linkData.linkId,
                                    linkText: linkData.link,
                                    titleText: linkData.title,
                                  ),
                                );
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            backgroundColor: AppColors.white,
            isScrollControlled: true,
            useSafeArea: true,
            builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddLinkBottomSheetWidget(
                    isFromEdit: false,
                  ),
                );
              });
            },
          );
        },
        // tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
