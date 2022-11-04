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
        appBar: AppBar(
          title: Text("Perpustakaan"),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // BerandaController.getListBukuTerbaru();
                c.katalogLoading();
              },
            )
          ],
        ),
        body: Container(
            child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            controller: c.scrollController.value,
            shrinkWrap: true,
            children: [
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
                          borderSide: BorderSide(color: Colors.white))),
                  controller: c.inputController,
                  onSubmitted: (text) {
                    c.searchKatalog();
                  },
                ),
              ),
              Obx(() {
                if (c.isError.value) {
                  return Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Terjadi kesalahan"),
                          IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: () {
                              c.fetchkatalog(c.page, '');
                            },
                          )
                        ],
                      ),
                    ),
                  );
                }
                return Container();
              }),
              Obx(() {
                if (c.listKatalog.value.isNotEmpty) {
                  return ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      itemCount: c.listKatalog.value.length + 1,
                      itemBuilder: (context, int index) {
                        if (index == c.listKatalog.length) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: c.hasMore
                                  ? Container()
                                  : const Text('Data habis'),
                            ),
                          );
                        } else {
                          return KatalogCard(
                            iniKatalog: c.listKatalog.value[index],
                          );
                        }
                      },
                    ),
                  );
                  return Container(
                    child: Text("${c.listKatalog.value.length}"),
                  );
                  return Container(
                    child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              child: ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context)
                                    .copyWith(scrollbars: false),
                                child: Obx(() => ListView.builder(
                                      controller: c.scrollController.value,
                                      shrinkWrap: true,
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      itemCount: c.listKatalog.value.length + 1,
                                      itemBuilder: (context, int index) {
                                        if (index == c.listKatalog.length) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: Center(
                                              child: c.hasMore
                                                  ? const CircularProgressIndicator()
                                                  : const Text('Data habis'),
                                            ),
                                          );
                                        } else {
                                          return KatalogCard(
                                            iniKatalog:
                                                c.listKatalog.value[index],
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

                return Container();
              }),
              Obx(() {
                if (c.isLoading.value) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return Container();
              }),
            ],
          ),
        )
            // child: Obx(() {
            //   if (c.isLoading.value) {
            //     return Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   }

            //   if (c.listKatalog.value.isNotEmpty) {
            //     return Container(
            //       child: ScrollConfiguration(
            //           behavior: ScrollConfiguration.of(context)
            //               .copyWith(scrollbars: false),
            //           child: Column(
            //             children: <Widget>[
            //               Container(
            //                 margin: EdgeInsets.all(15),
            //                 height: 50,
            //                 child: TextField(
            //                   decoration: InputDecoration(
            //                       prefixIcon: Icon(Icons.search),
            //                       hintText: 'Judul Buku / Abstrak',
            //                       hintStyle: TextStyle(fontSize: 15),
            //                       border: OutlineInputBorder(
            //                           borderRadius: BorderRadius.circular(30),
            //                           borderSide:
            //                               BorderSide(color: Colors.white))),
            //                   controller: c.inputController,
            //                   onSubmitted: (text) {
            //                     c.searchKatalog();
            //                   },
            //                 ),
            //               ),
            //               Expanded(
            //                   child: Container(
            //                 child: ScrollConfiguration(
            //                   behavior: ScrollConfiguration.of(context)
            //                       .copyWith(scrollbars: false),
            //                   child: Obx(() => ListView.builder(
            //                         controller: c.scrollController.value,
            //                         shrinkWrap: true,
            //                         padding: EdgeInsets.only(left: 10, right: 10),
            //                         itemCount: c.listKatalog.value.length + 1,
            //                         itemBuilder: (context, int index) {
            //                           if (index == c.listKatalog.length) {
            //                             return Padding(
            //                               padding:
            //                                   EdgeInsets.symmetric(vertical: 20),
            //                               child: Center(
            //                                 child: c.hasMore
            //                                     ? const CircularProgressIndicator()
            //                                     : const Text('Data habis'),
            //                               ),
            //                             );
            //                           } else {
            //                             return KatalogCard(
            //                               iniKatalog: c.listKatalog.value[index],
            //                             );
            //                           }
            //                         },
            //                       )),
            //                 ),
            //               ))
            //             ],
            //           )),
            //     );
            //   }
            //   if (c.listKatalog.value.isEmpty) {
            //     return Container(
            //       child: Center(
            //         child: Text('Data tidak ditemukan'),
            //       ),
            //     );
            //   }

            //   return Container();
            // }),
            ));
  }
}
