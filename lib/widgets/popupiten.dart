import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:belajargetx/controllers/popupC.dart';
import 'package:belajargetx/models/katalog_model.dart';
import 'package:get/get.dart';

class PopUpIten extends StatelessWidget {
  Katalog? katalog;

  PopUpIten({super.key, required this.katalog});
  @override
  Widget build(BuildContext context) {
    PopupController popupC = Get.find(tag: "${katalog!.id}");
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      decoration: BoxDecoration(color: Colors.white),
      height: 450,
      width: 200,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView(
          children: <Widget>[
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                        Get.delete<PopupController>();
                      },
                      icon: Icon(Icons.close))
                ],
              ),
            ),
            Text(
              '${popupC.detail.value!.data!.judulBuku!}',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  EdgeInsets.only(right: 30, left: 30, bottom: 20, top: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image(
                  image: NetworkImage(
                    'https://perpustakaan.kemenkeu.go.id/img/FileCover/${popupC.detail.value!.data!.fileCover}',
                  ),
                  fit: BoxFit.fill,
                ),
              ),

              // width: 50,
              // height: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Text('${popupC.detail.value!.data!.abstrak!}',
                style: TextStyle(), textAlign: TextAlign.justify),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: Text('Penulis'),
                  flex: 3,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(':'),
                Expanded(
                  child: Text(
                    popupC.detail.value!.data!.namaPengarang != null
                        ? '${popupC.detail.value!.data!.namaPengarang}'
                        : '',
                  ),
                  flex: 4,
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: Text('Penerbit'),
                  flex: 3,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(':'),
                Expanded(
                  child: Text(
                    '${popupC.detail.value!.data!.namaPenerbit}',
                  ),
                  flex: 4,
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: Text('ISBN'),
                  flex: 3,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(':'),
                Expanded(
                  child: Text(
                    '${popupC.detail.value!.data!.isbn}',
                  ),
                  flex: 4,
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: Text('Lokasi Rak'),
                  flex: 3,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(':'),
                Expanded(
                  child: Text(popupC.detail.value!.data!.lokasiRak != null
                      ? '${popupC.detail.value!.data!.lokasiRak}'
                      : ''),
                  flex: 4,
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: Text('Lokasi Perpustakaan'),
                  flex: 3,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(':'),
                Expanded(
                  child: Text('${popupC.detail.value!.data!.lokasi}'),
                  flex: 4,
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text('Subyek'),
                    flex: 3,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(':'),
                  Expanded(
                    child: Text(popupC.detail.value!.data!.subyek != null
                        ? '${popupC.detail.value!.data!.subyek}'
                        : ''),
                    flex: 4,
                  )
                ]),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
