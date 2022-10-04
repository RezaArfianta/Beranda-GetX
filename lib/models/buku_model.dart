// To parse this JSON data, do
//
//     final buku = bukuFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Buku bukuFromJson(String str) => Buku.fromJson(json.decode(str));

String bukuToJson(Buku data) => json.encode(data.toJson());

class Buku {
  Buku({
    required this.id,
    required this.judulBuku,
    required this.fileCover,
    required this.createdDate,
    required this.namaPengarang,
    required this.namaPenerbit,
    // required this.jumlah,
    required this.lokasiRak,
    required this.lokasi,
  });

  int id;
  String judulBuku;
  String fileCover;
  String createdDate;
  String namaPengarang;
  String namaPenerbit;
  // int jumlah;
  String lokasiRak;
  String lokasi;

  factory Buku.fromJson(Map<String, dynamic> json) => Buku(
        id: json["Id"] == null ? null : json["Id"],
        judulBuku: json["JudulBuku"] == null ? null : json["JudulBuku"],
        fileCover: json["FileCover"] == null ? null : json["FileCover"],
        createdDate: json["CreatedDate"] == null ? null : json["CreatedDate"],
        namaPengarang:
            json["NamaPengarang"] == null ? null : json["NamaPengarang"],
        namaPenerbit:
            json["NamaPenerbit"] == null ? null : json["NamaPenerbit"],
        // jumlah: json["Jumlah"] == null ? null : json["Jumlah"],
        lokasiRak: json["LokasiRak"] == null ? null : json["LokasiRak"],
        lokasi: json["Lokasi"] == null ? null : json["Lokasi"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "JudulBuku": judulBuku == null ? null : judulBuku,
        "FileCover": fileCover == null ? null : fileCover,
        "CreatedDate": createdDate == null ? null : createdDate,
        "NamaPengarang": namaPengarang == null ? null : namaPengarang,
        "NamaPenerbit": namaPenerbit == null ? null : namaPenerbit,
        // "Jumlah": jumlah,
        "LokasiRak": lokasiRak == null ? null : lokasiRak,
        "Lokasi": lokasi == null ? null : lokasi,
      };
}
