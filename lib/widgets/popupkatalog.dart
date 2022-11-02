import 'package:belajargetx/controllers/popupC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajargetx/models/katalog_model.dart';
import 'package:belajargetx/widgets/popupiten.dart';

class KatalogPopup extends StatelessWidget {
  KatalogPopup({super.key, this.isikatalog, this.katalog});
  IsiKatalog? isikatalog;
  Katalog? katalog;

  @override
  Widget build(BuildContext context) {
    PopupController popupC =
        Get.put(PopupController(katalog), tag: "${katalog!.id}");
    // PopupController popupC = Get.put(PopupController(katalog));

    return Dialog(child: Obx(() {
      if (popupC.detail.value != null) {
        return PopUpIten(
          katalog: katalog,
        );
      } else {
        return Container(
            height: 450,
            width: 200,
            child: Center(child: CircularProgressIndicator()));
      }
    }));
  }
}
