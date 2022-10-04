import 'dart:convert';
import 'dart:developer';

import 'package:belajargetx/models/buku_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '';

class BerandaController extends GetxController {
  var listBuku = <Buku>[].obs;
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
  }

  cetak() {
    print("cetak");
  }

  readData(BuildContext context) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    await DefaultAssetBundle.of(context)
        .loadString("/models/buku.json")
        .then((s) {
      // listBuku.value = json.decode(s);
      Map jsonData = jsonDecode(s);
      List<dynamic> listDyn = jsonData["Data"];
      List<Buku> listBuku = [];
      listDyn.forEach(
        (element) {
          listBuku.add(Buku.fromJson(element));
        },
      );

      this.listBuku.value = listBuku;
      log(jsonEncode(jsonData["Data"]), name: "return model buku");
      this.listBuku.refresh();
    });

    isLoading.value = false;
  }
}
