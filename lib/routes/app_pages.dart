import 'package:belajargetx/screens/beranda.dart';
import 'package:belajargetx/main.dart';
import 'package:belajargetx/screens/katalog.dart';
import 'package:belajargetx/screens/riwayat.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => Lobby(),
    ),
    GetPage(
        name: _Paths.BERANDA, page: (() => GetxBeranda(title: "Perpustakaan"))),
    GetPage(
        name: _Paths.KATALOG, page: (() => GetxKatalog(title: "Perpustakaan"))),
    GetPage(
        name: _Paths.RIWAYAT, page: (() => GetXRiwayat(title: "Perpustakaan")))
  ];
}
