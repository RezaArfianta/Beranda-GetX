import 'package:flutter/material.dart';
import 'package:belajargetx/models/buku_model.dart';
import 'package:get/get.dart';

import '../controllers/beranda_controller.dart';

class CardBuku extends StatelessWidget {
  CardBuku({Key? key, this.buku}) : super(key: key);
  Buku? buku;

  @override
  Widget build(BuildContext context) {
    BerandaController c = Get.find();

    return InkWell(
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              spreadRadius: 3,
              blurRadius: 5,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                width: 180,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image(
                    image: NetworkImage(
                        // 'https://perpustakaan.kemenkeu.go.id/img/FileCover/${buku?.fileCover}'
                        'https://picsum.photos/200/300'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: 150,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Angkasa GetX',
                    // '${buku?.judulBuku}',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        c.cetak();
        // showDialog(
        //   context: context,
        //   builder: (context) => Dialog(
        //     child: Container(
        //       margin: EdgeInsets.all(8),
        //       decoration: BoxDecoration(color: Colors.white),
        //       height: 450,
        //       width: 200,
        //       child: ScrollConfiguration(
        //         behavior:
        //             ScrollConfiguration.of(context).copyWith(scrollbars: false),
        //         child: ListView(
        //           children: <Widget>[
        //             Container(
        //               height: 50,
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.end,
        //                 children: [
        //                   IconButton(
        //                       hoverColor: Colors.transparent,
        //                       splashColor: Colors.transparent,
        //                       highlightColor: Colors.transparent,
        //                       onPressed: () {
        //                         Navigator.pop(context);
        //                       },
        //                       icon: Icon(Icons.close))
        //                 ],
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(right: 30, left: 30, bottom: 20),
        //               child: ClipRRect(
        //                 borderRadius: BorderRadius.only(
        //                     topLeft: Radius.circular(10),
        //                     topRight: Radius.circular(10),
        //                     bottomLeft: Radius.circular(10),
        //                     bottomRight: Radius.circular(10)),
        //                 child: Image(
        //                   image: NetworkImage(
        //                     // 'https://perpustakaan.kemenkeu.go.id/img/FileCover/${buku?.fileCover}',
        //                     'https://picsum.photos/200/300',
        //                   ),
        //                   // width: 100,
        //                   // height: 250,
        //                   fit: BoxFit.fill,
        //                 ),
        //               ),
        //             ),
        //             SizedBox(
        //               height: 30,
        //             ),
        //             Text(
        //               // '${buku?.judulBuku}',
        //               'Angkasa GetX',
        //               style:
        //                   TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        //             ),
        //             SizedBox(
        //               height: 7,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               crossAxisAlignment: CrossAxisAlignment.baseline,
        //               textBaseline: TextBaseline.alphabetic,
        //               children: [
        //                 Expanded(
        //                   child: Text('Penulis'),
        //                   flex: 3,
        //                 ),
        //                 Spacer(
        //                   flex: 1,
        //                 ),
        //                 Text(':'),
        //                 Expanded(
        //                   child: Text(
        //                     //'${buku?.namaPengarang}'
        //                     'Angkasa GetX',
        //                   ),
        //                   flex: 4,
        //                 )
        //               ],
        //             ),
        //             SizedBox(
        //               height: 5,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               crossAxisAlignment: CrossAxisAlignment.baseline,
        //               textBaseline: TextBaseline.alphabetic,
        //               children: [
        //                 Expanded(
        //                   child: Text('Penerbit'),
        //                   flex: 3,
        //                 ),
        //                 Spacer(
        //                   flex: 1,
        //                 ),
        //                 Text(':'),
        //                 Expanded(
        //                   child: Text(
        //                       // '${buku?.namaPenerbit}'
        //                       'Angkasa GetX'),
        //                   flex: 4,
        //                 )
        //               ],
        //             ),
        //             SizedBox(
        //               height: 5,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               crossAxisAlignment: CrossAxisAlignment.baseline,
        //               textBaseline: TextBaseline.alphabetic,
        //               children: [
        //                 Expanded(
        //                   child: Text('Lokasi Rak'),
        //                   flex: 3,
        //                 ),
        //                 Spacer(
        //                   flex: 1,
        //                 ),
        //                 Text(':'),
        //                 Expanded(
        //                   child: Text(
        //                       // '${buku?.lokasiRak}'
        //                       'Angkasa GetX'),
        //                   flex: 4,
        //                 )
        //               ],
        //             ),
        //             SizedBox(
        //               height: 5,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               crossAxisAlignment: CrossAxisAlignment.baseline,
        //               textBaseline: TextBaseline.alphabetic,
        //               children: [
        //                 Expanded(
        //                   child: Text('Lokasi Perpustakaan'),
        //                   flex: 3,
        //                 ),
        //                 Spacer(
        //                   flex: 1,
        //                 ),
        //                 Text(':'),
        //                 Expanded(
        //                   child: Text(
        //                       // '${buku?.lokasi}'
        //                       'Angkasa ble ble'),
        //                   flex: 4,
        //                 )
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // );
      },
    );
  }
}
