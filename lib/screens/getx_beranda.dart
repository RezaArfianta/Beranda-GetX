import 'package:belajargetx/controllers/beranda_controller.dart';
import 'package:belajargetx/widgets/card_buku.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxBeranda extends StatelessWidget {
  const GetxBeranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BerandaController c = Get.put(BerandaController());
    c.readData(context);

    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text("Getx beranda ${c.listBuku.value.length}")),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                c.readData(context);
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

            if (c.listBuku.value.isNotEmpty) {
              return ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, index) => SizedBox(
                  width: 12,
                ),
                itemBuilder: (_, index) {
                  return CardBuku(
                    buku: c.listBuku.value[index],
                  );
                  return ListTile(
                    title: Text(c.listBuku.value[index].judulBuku),
                    subtitle: Text(c.listBuku.value[index].namaPengarang),
                  );
                  return Text(c.listBuku.value[index].judulBuku);
                },
                itemCount: c.listBuku.value.length,
              );
            }

            return Container();
          }),
        ));
  }
}
