import 'package:belajargetx/screens/beranda.dart';
import 'package:belajargetx/screens/getx_beranda.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => GetxBeranda(),
    ),
  ];
}
