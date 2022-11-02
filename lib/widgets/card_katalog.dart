import 'package:belajargetx/models/katalog_model.dart';
import 'package:belajargetx/widgets/popupkatalog.dart';
import 'package:flutter/material.dart';
import 'package:belajargetx/models/katalog_model.dart';
import 'package:belajargetx/widgets/popupkatalog.dart';

class KatalogCard extends StatelessWidget {
  KatalogCard({
    Key? key,
    this.iniKatalog,
  }) : super(key: key);
  Katalog? iniKatalog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.fromLTRB(14, 4, 14, 4),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
              width: 200,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 5),
              child: Column(
                children: [
                  Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${iniKatalog?.judulBuku}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  )),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${iniKatalog?.abstrak}',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.grey,
                    ),
                    Expanded(child: Text('${iniKatalog?.lokasi}')),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  KatalogPopup(katalog: iniKatalog));
                        },
                        icon: Icon(
                          Icons.info,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
      // onTap: () {
      //   showDialog(
      //     context: context,
      //     builder: (context) => PopupKatalog(
      //       katalog: iniKatalog,
      //     ),
      //   );
      // },
    );
  }
}
