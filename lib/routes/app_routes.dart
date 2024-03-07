import 'package:get/get.dart';
import 'package:linkmanagement/view/home/home_screen.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';
}

class AppPages {
  static var initial = AppRoutes.homeScreen;

  static final routes = [
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
    ),
  ];
}
