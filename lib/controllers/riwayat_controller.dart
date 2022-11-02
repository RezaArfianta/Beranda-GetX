import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajargetx/services.dart';
import '../models/riwayat_model.dart';
import 'package:belajargetx/screens/riwayat.dart';

class RiwayatController extends GetxController {
  var listRiwayat = <History>[].obs;
  var isLoading = false.obs;
  var scrollcontroller = ScrollController().obs;
  int page = 1;
  String keyword = '';
  bool hasMore = true;
  final TextEditingController InputController = TextEditingController();
  RiwayatResponse? r;

  @override
  onInit() {
    super.onInit();
    fetch(page, '');
    print('object');
    scrollcontroller.value.addListener(() async {
      if (scrollcontroller.value.position.maxScrollExtent ==
          scrollcontroller.value.offset) {
        page = page + 1;
        print('ok $page ${listRiwayat.length}');
        fetch(page, keyword);
      }
    });
  }

  Future<void> fetch(int page, String keyword) async {
    log('hai');
    try {
      isLoading(true);

      r = await Services().getListHistory(page, keyword);
      r!.data!.forEach((element) {
        print(element);
        listRiwayat.value.add(element);
      });
      listRiwayat.refresh();
      hasMore = page * 10 <= r!.total!;
      print(r!.total);
    } catch (e) {
      print(e);
    }
    isLoading(false);
  }
}
