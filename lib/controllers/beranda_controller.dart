import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:belajargetx/models/buku_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajargetx/services.dart';

class BerandaController extends GetxController {
  var listTerbaru = <Buku>[].obs;
  var listTerlaris = <Buku>[].obs;
  BukuResponse? bukuResponse;
  // BukuResponse? bukuResponse2;
  // Buku? listBuku;
  var isLoading = false.obs;
  @override
  onInit() async {
    super.onInit();
    await getBukuTerlaris();
    await getBukuTerbaru();
  }

  cetak() {
    print("cetak");
  }

  Future<void> getBukuTerlaris() async {
    try {
      Future.delayed(Duration(seconds: 2));
      isLoading(true);
      bukuResponse = await Services().getBukuTerlaris();
      // print(bukuResponse!.data);
      bukuResponse!.data.forEach((element) {
        listTerlaris.value.add(element);
      });

      // this.listTerlaris.value = listTerlaris;

      listTerlaris.refresh();
      print('dapet bukuTerlaris');
    } catch (e) {
      print('error controller bukuTerlaris');
    } finally {
      isLoading(false);
    }
  }

  Future<void> getBukuTerbaru() async {
    try {
      isLoading(true);

      bukuResponse = await Services().getBukuTerbaru();
      // listTerbaru = (await Services().getBukuTerbaru()) as RxList<Buku>;

      bukuResponse!.data.forEach((element) {
        listTerbaru.value.add(element);
      });
      // this.listTerbaru.value = listTerbaru;

      listTerbaru.refresh();
      print('dapet bukuTerbaru');
    } catch (e) {
      print('error controller bukuTerbaru');
    } finally {
      isLoading(false);
    }
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

//   Future<void> getBuku() async {
//     try {
//       isLoading(true);
//       http.Response response1 = await http.get(Uri.tryParse(
//           'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerbaru')!);
//       print('konek api 1');

//       http.Response response2 = await http.get(Uri.tryParse(
//           'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerlaris')!);
//       print('konek api 2');

//       if (response1.statusCode == 200 && response2.statusCode == 200) {
//         Map result1 = jsonDecode(response1.body);
//         Map result2 = jsonDecode(response2.body);
//         print('dapet data1');

//         List<dynamic> listDyn1 = result1["Data"];
//         List<dynamic> listDyn2 = result2["Data"];

//         List<Buku> listTerbaru = [];
//         List<Buku> listTerlaris = [];

//         listDyn1.forEach((element) {
//           listTerbaru.add(Buku.fromJson(element));
//         });
//         listDyn2.forEach((element) {
//           listTerlaris.add(Buku.fromJson(element));
//         });

//         this.listTerbaru.value = listTerbaru;
//         this.listTerlaris.value = listTerlaris;

//         this.listTerbaru.refresh();
//         this.listTerlaris.refresh();
//         print('sampe sini1');

//         print('kebaca');
//       } else {}
//     } finally {
//       isLoading(false);
//     }
//   }
// }
