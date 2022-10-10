import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxRiwayat extends StatelessWidget {
  const GetxRiwayat({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {

   return Scaffold(
    appBar: AppBar(
      title: (Text("")),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: (() {
            
          }),
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
      }) ),
   );
  }
}