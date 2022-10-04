import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  List buku = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perpustakaan'),
        centerTitle: true,
      ),
      body: Container(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              height: 40,
              child: Text(
                'Buku Terbaru',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 320,
              child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemCount: buku.length,
                  separatorBuilder: (context, _) => SizedBox(
                        width: 12,
                      ),
                  itemBuilder: (context, i) => InkWell(
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
                                  )),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: 150,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      buku[i]['JudulBuku'],
                                      // '${buku?.judulBuku}',
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
            ),
            SizedBox(
              height: 25,
            ),
          ]),
        ),
      ),
    );
  }
}
