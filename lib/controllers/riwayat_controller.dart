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
  var isError = false.obs;

  @override
  onInit() {
    super.onInit();
    riwayatLoading();
    fetch(page, '');
    scrollcontroller.value.addListener(() async {
      if (scrollcontroller.value.position.maxScrollExtent ==
          scrollcontroller.value.offset) {
        if (hasMore) {
          page = page + 1;
          fetch(page, keyword);
        }
        print('ok $page ${listRiwayat.length}');
      }
    });
    print('object');
  }

  Future<void> searchRiwayat() async{
    try{
      listRiwayat.clear();
      page = 1;
      keyword = InputController.text;
      fetch(page, keyword);
    }catch(e){
      print(e);
    }finally{

    }
  }

  Future<void> riwayatLoading() async {
    try {
      isLoading(true);
      page = 1;
      listRiwayat.value.clear();
      listRiwayat.refresh();
      await fetch(page, keyword);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetch(int page, String keyword) async {
    log('hai');
    try {
      isError(false);
      isLoading(true);
      r = await Services().getListHistory(page, keyword);
      if (r != null){
        r!.data?.forEach((element) {
          print(element);
          listRiwayat.value.add(element);
        });
        listRiwayat.refresh();
        print('total ${listRiwayat.value.length} < ${r!.total}');
        hasMore = listRiwayat.value.length < r!.total!;
      }else{
        isError(true);
      }
      print(r!.total);
    } catch (e) {
      print(e);
    }finally{
      isLoading(false);
    }
  }
}