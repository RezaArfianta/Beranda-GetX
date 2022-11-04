import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:belajargetx/models/katalog_model.dart';

import '../services.dart';

class PopupController extends GetxController {
  Katalog? katalog;
  var detail = Rxn<DetailKatalogResponse>();
  var isLoading = false.obs;

  PopupController(this.katalog);
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchPopup();
  }

  Future<void> fetchPopup() async {
    log("hadi");
    print("hadi");
    try {
      isLoading(true);
      // katalog =
      detail.value = await Services().getDetailKatalog(katalog!.id);
      print(jsonEncode(detail.value));
    } catch (e) {
      print(e);
    }
    isLoading(false);
  }
}
