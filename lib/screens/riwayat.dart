import 'package:belajargetx/controllers/riwayat_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajargetx/models/riwayat_model.dart';

import '../widgets/card_riwayat.dart';

class GetXRiwayat extends StatelessWidget {
  const GetXRiwayat({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RiwayatController c = Get.put(RiwayatController());


    return Scaffold(
        appBar: AppBar(
          title: Text('Perpustakaan'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // BerandaController.getListBukuTerbaru();
                c.riwayatLoading();
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

            if (c.listRiwayat.value.isNotEmpty) {
              return Container(
                child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(15),
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Judul Buku / Abstrak',
                                hintStyle: TextStyle(fontSize: 15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                            controller: c.InputController,
                            onSubmitted: (text) {
                              c.searchRiwayat();
                            },
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context)
                                .copyWith(scrollbars: false),
                            child: Obx(() => ListView.builder(
                                  controller: c.scrollcontroller.value,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  itemCount: c.listRiwayat.value.length + 1,
                                  itemBuilder: (context, int index) {
                                    if (index == c.listRiwayat.length) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Center(
                                          child: c.hasMore
                                              ? const CircularProgressIndicator()
                                              : const Text('Data habis'),
                                        ),
                                      );
                                    } else {
                                      return RiwayatCard(
                                        iniRiwayat: c.listRiwayat.value[index],
                                      );
                                    }
                                  },
                                )),
                          ),
                        ))
                      ],
                    )),
              );
            }

            return Container(
              child: Center(
                child: Text("Data tidak ditemukan"),
              ),
            );
          }),
        ));
  }
}
