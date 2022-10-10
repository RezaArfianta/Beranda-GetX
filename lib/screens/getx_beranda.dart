import 'package:belajargetx/controllers/beranda_controller.dart';
import 'package:belajargetx/widgets/card_buku.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajargetx/models/buku_model.dart';

class GetxBeranda extends StatelessWidget {
  const GetxBeranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BerandaController c = Get.put(BerandaController());
    // c.getBukuTerbaru();
    // c.getBukuTerlaris();
    c.getBuku();

    return Scaffold(
        appBar: AppBar(
          title: Text("Getx Perpustakaan"),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // BerandaController.getListBukuTerbaru();
              },
            )
          ],
        ),
        body: Container(
          child: Obx(() {
            if (c.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (c.listTerbaru.value.isNotEmpty) {
              return Container(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: ListView(children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 40,
                      child: Text(
                        'Buku Terbaru',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: 320,
                      child: ListView.separated(
                        padding: EdgeInsets.all(10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, index) => SizedBox(
                          width: 12,
                        ),
                        itemBuilder: (_, index) {
                          return CardBuku(
                            buku: c.listTerbaru.value[index],
                          );
                          // return ListTile(
                          //   title: Text(c.listBuku.value[index].judulBuku),
                          //   subtitle: Text(c.listBuku.value[index].namaPengarang),
                          // );
                          // return Text(c.listBuku.value[index].judulBuku);
                        },
                        itemCount: c.listTerbaru.value.length,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 40,
                      child: Text(
                        'Buku Terlaris',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: 320,
                      child: ListView.separated(
                        padding: EdgeInsets.all(10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, index) => SizedBox(
                          width: 12,
                        ),
                        itemBuilder: (_, index) {
                          return CardBuku(
                            buku: c.listTerlaris.value[index],
                          );
                          // return ListTile(
                          //   title: Text(c.listTerlaris.value[index].judulBuku),
                          //   subtitle: Text(c.listTerlaris.value[index].namaPengarang),
                          // );
                          // return Text(c.listTerlaris.value[index].judulBuku);
                        },
                        itemCount: c.listTerlaris.value.length,
                      ),
                    ),
                  ]),
                ),
              );
            }

            return Container(
              child: Center(
                child: Text('Data gakebaca'),
              ),
            );
          }),
        ));
  }
}
