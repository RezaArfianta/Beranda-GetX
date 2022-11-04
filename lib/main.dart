import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:belajargetx/routes/app_pages.dart';
import 'package:belajargetx/screens/beranda.dart';
import 'package:belajargetx/screens/katalog.dart';
import 'package:belajargetx/screens/riwayat.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "GetX Perpustakaan",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Lobby extends StatefulWidget {
  const Lobby({super.key});

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  int currentIndex = 0;

  final List<Widget> children = [
    GetxBeranda(
      title: 'GetX Perpustakaan',
    ),
    GetxKatalog(title: 'GetX Perpustakaan'),
    GetXRiwayat(title: 'GetX Perpustakaan')
  ];

  void onTappedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTappedBar,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Katalog'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'Riwayat')
          ]),
    );
  }
}
