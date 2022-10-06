import 'dart:convert';
import 'dart:developer';
import 'package:belajargetx/services/beranda_service.dart';
import 'package:http/http.dart' as http;

import 'package:belajargetx/models/buku_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BerandaController extends GetxController {
  var listBuku = <Buku>[].obs;
  // Buku? listBuku;
  var isLoading = false.obs;
  @override
  onInit() {
    super.onInit();
    getBukuTerbaru();
  }

  cetak() {
    print("cetak");
  }

  Future<void> getBukuTerbaru() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerbaru')!);
      print('konek api');

      if (response.statusCode == 200) {
        Map result = jsonDecode(response.body);
        print('dapet data');

        List<dynamic> listDyn = result["Data"];
        List<Buku> listBuku = [];
        listDyn.forEach((element) {
          listBuku.add(Buku.fromJson(element));
        });

        this.listBuku.value = listBuku;
        this.listBuku.refresh();
        print('sampe sini');

        print('kebaca');
      } else {}
    } catch (e) {
      print('error');
    } finally {
      isLoading(false);
    }
  }

  // readData(BuildContext context) async {
  //   isLoading.value = true;
  //   await Future.delayed(Duration(seconds: 2));
  //   await DefaultAssetBundle.of(context)
  //       .loadString("/models/buku.json")
  //       .then((s) {
  //     // listBuku.value = json.decode(s);
  //     Map jsonData = jsonDecode(s);
  //     List<dynamic> listDyn = jsonData["Data"];
  //     List<Buku> listBuku = [];
  //     listDyn.forEach(
  //       (element) {
  //         listBuku.add(Buku.fromJson(element));
  //       },
  //     );

  //     this.listBuku.value = listBuku;
  //     log(jsonEncode(jsonData["Data"]), name: "return model buku");
  //     this.listBuku.refresh();
  //   });

  //   isLoading.value = false;
  // }
}
