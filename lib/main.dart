import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:linkmanagement/models/link_list_model.dart';
import 'package:linkmanagement/routes/app_routes.dart';
import 'package:linkmanagement/utils/app_color.dart';
import 'package:linkmanagement/utils/const_strings.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  ///
  WidgetsFlutterBinding.ensureInitialized();

  final document = await getApplicationDocumentsDirectory();

  /// initialize hive
  await Hive.initFlutter(document.path);

  // Registering the adapter
  Hive.registerAdapter(LinkListModelAdapter());

  /// open box
  await Hive.openBox<LinkListModel>("LINKSDATA");

  /*To store data locally like "adding category only one time"*/
  await Hive.openBox("myBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Link Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: ConstantStrings.robotoFontFamily,
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
        ),
        useMaterial3: true,
        dialogBackgroundColor: AppColors.white,
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      // home: const HomeScreen(),
    );
  }
}
