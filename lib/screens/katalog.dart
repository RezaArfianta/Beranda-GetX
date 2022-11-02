import 'package:belajargetx/controllers/katalog_controller.dart';
import 'package:belajargetx/widgets/card_katalog.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajargetx/models/katalog_model.dart';

// class GetxKatalog extends StatelessWidget {
//   const GetxKatalog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     KatalogController c = Get.put(KatalogController());

//     return Container();
//   }
// }
class GetxKatalog extends StatelessWidget {
  const GetxKatalog({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KatalogController c = Get.put(KatalogController());

    // c.getKatalog;
    // c.getPage;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('GetX Perpustakaan'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // BerandaController.getListBukuTerbaru();
                c.fetchkatalog(c.page, '');
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

            if (c.listKatalog.value.isNotEmpty) {
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
                              c.listKatalog.clear();
                              c.page = 1;
                              c.keyword = text;
                              c.fetchkatalog(c.page, c.keyword);

                              print('search oke');
                            },
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context)
                                .copyWith(scrollbars: false),
                            child: Obx(() => ListView.builder(
                                  key: PageStorageKey(0),
                                  controller: c.scrollController.value,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  itemCount: c.listKatalog.value.length,
                                  itemBuilder: (context, int index) {
                                    if (index ==
                                        c.listKatalog.value.length + 1) {
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
                                      return KatalogCard(
                                        iniKatalog: c.listKatalog.value[index],
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
              child: (Center(
                child: Text("Data tidak ditemukan"),
              )),
            );
          }),
        ));
  }
}
