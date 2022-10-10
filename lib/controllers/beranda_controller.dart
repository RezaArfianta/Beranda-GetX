import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:belajargetx/models/buku_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BerandaController extends GetxController {
  var listTerbaru = <Buku>[].obs;
  var listTerlaris = <Buku>[].obs;
  // Buku? listBuku;
  var isLoading = false.obs;
  @override
  onInit() {
    super.onInit();
  }

  cetak() {
    print("cetak");
  }

  // Future<void> getBukuTerlaris() async {
  //   try {
  //     isLoading(true);
  //     http.Response response = await http.get(Uri.tryParse(
  //         'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerlaris')!);
  //     print('konek api');

  //     if (response.statusCode == 200) {
  //       Map result = jsonDecode(response.body);
  //       print('dapet data');

  //       List<dynamic> listDyn = result["Data"];
  //       List<Buku> listTerlaris = [];
  //       listDyn.forEach((element) {
  //         listTerlaris.add(Buku.fromJson(element));
  //       });

  //       this.listTerlaris.value = listTerlaris;
  //       this.listTerlaris.refresh();
  //       print('sampe sini');

  //       print('kebaca');
  //     } else {}
  //   } catch (e) {
  //     print('error');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // Future<void> getBukuTerbaru() async {
  //   try {
  //     isLoading(true);
  //     http.Response response = await http.get(Uri.tryParse(
  //         'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerbaru')!);
  //     print('konek api');

  //     if (response.statusCode == 200) {
  //       Map result = jsonDecode(response.body);
  //       print('dapet data');

  //       List<dynamic> listDyn = result["Data"];
  //       List<Buku> listTerbaru = [];
  //       listDyn.forEach((element) {
  //         listTerbaru.add(Buku.fromJson(element));
  //       });

  //       this.listTerbaru.value = listTerbaru;
  //       this.listTerbaru.refresh();
  //       print('sampe sini');

  //       print('kebaca');
  //     } else {}
  //   } catch (e) {
  //     print('error');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

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

  Future<void> getBuku() async {
    try {
      isLoading(true);
      http.Response response1 = await http.get(Uri.tryParse(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerbaru')!);
      print('konek api 1');

      http.Response response2 = await http.get(Uri.tryParse(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerlaris')!);
      print('konek api 2');

      if (response1.statusCode == 200 && response2.statusCode == 200) {
        Map result1 = jsonDecode(response1.body);
        Map result2 = jsonDecode(response2.body);
        print('dapet data1');

        List<dynamic> listDyn1 = result1["Data"];
        List<dynamic> listDyn2 = result2["Data"];

        List<Buku> listTerbaru = [];
        List<Buku> listTerlaris = [];
        listDyn1.forEach((element) {
          listTerbaru.add(Buku.fromJson(element));
        });
        listDyn1.forEach((element) {
          listTerlaris.add(Buku.fromJson(element));
        });
        this.listTerbaru.value = listTerbaru;
        this.listTerlaris.value = listTerlaris;
        this.listTerbaru.refresh();
        this.listTerlaris.refresh();
        print('sampe sini1');

        print('kebaca');
      } else {}
    } finally {
      isLoading(false);
    }
  }
}
