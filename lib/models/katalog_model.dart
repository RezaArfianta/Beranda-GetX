import 'dart:convert';

class DetailKatalogResponse {
  IsiKatalog? data;
  String? errors;
  bool? success;
  String? message;

  DetailKatalogResponse({this.data, this.errors, this.success, this.message});

  DetailKatalogResponse.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new IsiKatalog.fromJson(json['Data']) : null;
    errors = json['Errors'] == null ? null : json['Errors'];
    success = json['Success'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Errors'] = this.errors;
    data['Success'] = this.success;
    data['Message'] = this.message;
    return data;
  }
}

class IsiKatalog {
  String? judulBuku;
  String? abstrak;
  String? lokasi;
  String? subyek;
  String? fileCover;
  String? namaPenerbit;
  String? isbn;
  String? namaPengarang;
  String? tahunTerbit;
  String? lokasiRak;

  IsiKatalog(
      {this.judulBuku,
      this.abstrak,
      this.lokasi,
      this.subyek,
      this.fileCover,
      this.namaPenerbit,
      this.isbn,
      this.namaPengarang,
      this.tahunTerbit,
      this.lokasiRak});

  IsiKatalog.fromJson(Map<String, dynamic> json) {
    judulBuku = json['JudulBuku'];
    abstrak = json['Abstrak'] == null ? null : json['Abstrak'];
    lokasi = json['Lokasi'];
    subyek = json['Subyek'];
    fileCover = json['FileCover'];
    namaPenerbit = json['NamaPenerbit'];
    isbn = json['Isbn'];
    namaPengarang = json['NamaPengarang'];
    tahunTerbit = json['TahunTerbit'];
    lokasiRak = json['LokasiRak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JudulBuku'] = this.judulBuku;
    data['Abstrak'] = this.abstrak;
    data['Lokasi'] = this.lokasi;
    data['Subyek'] = this.subyek;
    data['FileCover'] = this.fileCover;
    data['NamaPenerbit'] = this.namaPenerbit;
    data['Isbn'] = this.isbn;
    data['NamaPengarang'] = this.namaPengarang;
    data['TahunTerbit'] = this.tahunTerbit;
    data['LokasiRak'] = this.lokasiRak;
    return data;
  }
}

KatalogResponse katalogResponseFromJson(String str) =>
    KatalogResponse.fromJson(json.decode(str));

String katalogResponseToJson(KatalogResponse data) =>
    json.encode(data.toJson());

class KatalogResponse {
  KatalogResponse({
    required this.data,
    required this.errors,
    required this.total,
    required this.success,
    required this.message,
  });

  List<Katalog> data;
  dynamic errors;
  int total;
  bool success;
  String message;

  factory KatalogResponse.fromJson(Map<String, dynamic> json) =>
      KatalogResponse(
        data: List<Katalog>.from(json["Data"].map((x) => Katalog.fromJson(x))),
        errors: json["Errors"],
        total: json["Total"] == null ? null : json["Total"],
        success: json["Success"] == null ? null : json["Success"],
        message: json["Message"] == null ? null : json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "Errors": errors,
        "Total": total == null ? null : total,
        "Success": success == null ? null : success,
        "Message": message == null ? null : message,
      };
}

class Katalog {
  Katalog({
    required this.id,
    required this.judulBuku,
    required this.abstrak,
    required this.lokasi,
  });

  int id;
  String judulBuku;
  String? abstrak;
  String lokasi;

  factory Katalog.fromJson(Map<String, dynamic> json) => Katalog(
        id: json["Id"] == null ? null : json["Id"],
        judulBuku: json["JudulBuku"] == null ? null : json["JudulBuku"],
        abstrak: json["Abstrak"] == null ? null : json["Abstrak"],
        lokasi: json["Lokasi"] == null ? null : json["Lokasi"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "JudulBuku": judulBuku == null ? null : judulBuku,
        "Abstrak": abstrak == null ? null : abstrak,
        "Lokasi": lokasi == null ? null : lokasi,
      };
}
