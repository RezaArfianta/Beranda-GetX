import 'dart:developer';
import 'package:belajargetx/services.dart';
// import 'package:http/http.dart' as http;

import 'package:belajargetx/models/katalog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KatalogController extends GetxController {
  final TextEditingController InputController = TextEditingController();
  var listKatalog = <Katalog>[].obs;
  var isLoading = false.obs;
  KatalogResponse? katalogResponse;
  var scrollController = ScrollController().obs;
  int page = 1;
  String keyword = '';
  bool hasMore = true;

  @override
  onInit() {
    super.onInit();
    fetchkatalog(page, '');
    // getPage(page, '');
    print('object');
    scrollController.value.addListener(() async {
      if (scrollController.value.position.maxScrollExtent ==
          scrollController.value.offset) {
        page = page + 1;
        print('ok $page ${listKatalog.length}');
        fetchkatalog(page, keyword);

        // getPage(page, keyword);
      }
    });
    // print(katalogResponse!.total!);

    // getKatalog();
  }

  cetak() {
    print("cetak");
  }

  Future<void> fetchkatalog(int page, String keyword) async {
    log("halo");
    try {
      isLoading(true);
      katalogResponse = await Services().getListKatalog(page, keyword);

      katalogResponse!.data.forEach((element) {
        print(element.id);
        listKatalog.value.add(element);
      });
      // listKatalog.value.addAll(katalogResponse!.data!);
      // listKatalog.refresh();
      hasMore = page * 10 <= katalogResponse!.total;
      print(katalogResponse!.total);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  // fetch(int page, String keyword) async {
  //   katalogResponse = await KatalogController.getKatalog(page, keyword);
  // if (katalogResponse != null) {
  //   listKatalog.addAll(inikatalog!.data!);
  //   inikatalog!.data!.forEach((element) {});
  //   hasMore = page * 10 <= inikatalog!.total!;
  // }
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

}
    // fetch(page, '');

    // scrollController.addListener(() {
    //   if (scrollController.position.maxScrollExtent ==
    //       scrollController.offset) {
    //     page = page + 1;
    //     print('ok $page ${listKatalog.length}');
    //     fetch(page, keyword);
    //   }
    // });