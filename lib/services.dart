import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:developer';

import "package:belajargetx/models/buku_model.dart";
import "package:belajargetx/models/katalog_model.dart";
import "package:belajargetx/models/riwayat_model.dart";

class Services {
  //SERVICE UNTUK BUKU
  final dio = Dio();
  Future<BukuResponse?> getBukuTerbaru() async {
    try {
      var response = await dio.get(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerbaru');

      return BukuResponse.fromJson(response.data);
      print('service terbaru');
    } catch (e) {
      print('error pada service getBukuTerbaru');
    }
    return null;
  }

  Future<BukuResponse?> getBukuTerlaris() async {
    try {
      var response = await dio.get(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerlaris');

      return BukuResponse.fromJson(response.data);
      print('services Terlaris');
    } catch (e) {
      print('error pada service getBukuTerlaris');
    }
    return null;
  }
  // ========

  //SERVICE UNTUK KATALOG
  Future<KatalogResponse?> getListKatalog(int page, String keyword) async {
    // return null;
    try {
      print("$page $keyword");
      print(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetAll?PageSize=10&Page=$page&keyword=$keyword');
      var response = await dio.get(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetAll?PageSize=10&Page=$page&keyword=$keyword');

      // print('data katalog ${response.data}');
      // log(jsonEncode(response.data), name: "data katalog");

      // if (response.statusCode == 200) {
      return KatalogResponse.fromJson(response.data);
      // } else {
      //   return null;
      // }
    } catch (e) {
      print("eror pada service ${e.toString()}");
      return null;
    }
  }

  Future<DetailKatalogResponse?> getDetailKatalog(int id) async {
    try {
      print("$id");
      Response response = await Dio()
          .get('https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/$id');
      print('popup katalog');
      print(jsonEncode(response.data));
      if (response.statusCode == 200) {
        return DetailKatalogResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
  // ======

  //SERVICE UNTUK RIWAYAT
  Future<RiwayatResponse?> getListHistory(int page, String keyword) async {
    try {
      Response response = await Dio().get(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Sirkulasi/GetAll?PageSize=10&Page=$page&keyword=$keyword',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjQyNDc0QTY4NDNBM0VBNTc2MTcyNDE2MTIxMEQ2OTlBMEZFNDQ2Q0EiLCJ0eXAiOiJhdCtqd3QiLCJ4NXQiOiJRa2RLYUVPajZsZGhja0ZoSVExcG1nX2tSc28ifQ.eyJuYmYiOjE2Njc1NDU4NDcsImV4cCI6MTY2NzU2Mzg0NywiaXNzIjoiaHR0cHM6Ly9kZW1vLWFjY291bnQua2VtZW5rZXUuZ28uaWQiLCJhdWQiOlsiZnJvbnRlbmQubmFkaW5lIiwiYWdlbmRhLmVrZW1lbmtldSIsInJhcGF0LmVrZW1lbmtldSIsIm5vdGlmaWNhdGlvbi5la2VtZW5rZXUiLCJrZWhhZGlyYW4uZWtlbWVua2V1Iiwib3JnYW5pc2FzaS5ocmlzIiwicHJvZmlsLmhyaXMiLCJqYWJhdGFuLmhyaXMiLCJwYW5na2F0LmhyaXMiLCJkaWtsYXQuaHJpcyIsImtlbHVhcmdhLmhyaXMiLCJwZW5kaWRpa2FuLmhyaXMiLCJla2VtZW5rZXUiLCJrb2xhYm9yYXNpLmVrZW1lbmtldSIsInBlZ2F3YWkuZWtlbWVua2V1Il0sImNsaWVudF9pZCI6ImVrZW1lbmtldS1vYS1kZXYiLCJFbmFibGVNRkEiOiJmYWxzZSIsInN1YiI6IjJiN2EzYmRjLTBlZmYtNGFiMi1iNmI0LWY2MDEzNWRkZTk5OCIsImF1dGhfdGltZSI6MTY2NzUyNTAwOCwiaWRwIjoibG9jYWwiLCJuYW1lIjoiRXJpdGEgWXVsaWFzdHV0aSIsImlkIjoiMTE1Mjc5IiwiYWRkcmVzcyI6IkFwdC4gR2FkaW5nIE5pYXMgUmVzaWRlbmNlIFRvd2VyIENocnlzYW50IE5vLiBDLzE3L0pEIEtlbGFwYSBHYWRpbmcgSmFrYXJ0YSBVdGFyYSIsInBob25lX251bWJlciI6IjA4MTIyNzA3NzQ3NyIsIm5pcCI6IjE5ODUwNzEzMjAxMDEyMjAwMSIsImphYmF0YW4iOiJQZWxha3NhbmEiLCJqZW5pc19qYWJhdGFuIjoiRnVuZ3Npb25hbCBVbXVtIFBOUyIsImtvZGVfb3JnYW5pc2FzaSI6IjM1MDMxMDE4MDIiLCJvcmdhbmlzYXNpIjoiU3ViYmlkYW5nIFBlcmFuY2FuZ2FuIGRhbiBQZW5nZW1iYW5nYW4gQXBsaWthc2kgSSwgQmlkYW5nIEFwbGlrYXNpLCBQdXNhdCBTaXN0ZW0gSW5mb3JtYXNpIGRhbiBUZWtub2xvZ2kgS2V1YW5nYW4sIFNla3JldGFyaWF0IEplbmRlcmFsIiwia29kZV9zYXRrZXIiOiI2NzI5MDYiLCJzYXRrZXIiOiJQdXNhdCBTaXN0ZW0gSW5mb3JtYXNpIGRhbiBUZWtub2xvZ2kgS2V1YW5nYW4iLCJncmF2YXRhciI6Imh0dHBzOi8vYWNjb3VudC5rZW1lbmtldS5nby5pZC9tYW5hZ2UvVXBsb2Fkcy9UaHVtYm5haWxzLzE5ODUwNzEzMjAxMDEyMjAwMS5qcGciLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiIxOTg1MDcxMzIwMTAxMjIwMDEiLCJlbWFpbCI6ImVyaXRhLnlAa2VtZW5rZXUuZ28uaWQiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwianRpIjoiT0ZNcDBSeWtRdWVCYWtUU2cxa3k2ZyIsInNjb3BlIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJmcm9udGVuZC5uYWRpbmUiLCJhZ2VuZGEuZWtlbWVua2V1IiwicmFwYXQuZWtlbWVua2V1Iiwibm90aWZpY2F0aW9uLmVrZW1lbmtldSIsImtlaGFkaXJhbi5la2VtZW5rZXUiLCJvcmdhbmlzYXNpLmhyaXMiLCJwcm9maWwuaHJpcyIsImphYmF0YW4uaHJpcyIsInBhbmdrYXQuaHJpcyIsImRpa2xhdC5ocmlzIiwia2VsdWFyZ2EuaHJpcyIsInBlbmRpZGlrYW4uaHJpcyIsImVrZW1lbmtldSIsImtvbGFib3Jhc2kuZWtlbWVua2V1IiwicGVnYXdhaS5la2VtZW5rZXUiXSwiYW1yIjpbInB3ZCJdfQ.kQ2eYTGY_pTfR-WldTNaHIY_DvGgB0sAu_dHh5fJ5eeCN6mnjnBjJ_FoQTIkXRvY582nU1ppeVSvkozIOwar4ymU33X9g8yFtKjAaMcqVUaPQOTVJr7YQBTiwIkaR5O_lQgDQ1omGacrZcyoUpxZfeNadpjj3XNE1tgCWuwp_g2I0WrvMOcyh6YWqjYD2MoTRXuwOEm8D8u34yc3GbJSuiw0TS-b2taRZCRgk4zTfWMhgHhgWbaxF5iZ6MiXVOiu31o7ab-Ap153Jqw1NBqcShc7WZE_RZtx9nguqwHgCWlHLVQ2XKERIKPNw6h7yfCtpx38Mb0PXvp7YPzyt8kkwLPRVrWcFyEOjzAqwyntT-N_2Utu5sf6_akq8P6WwATHGhegUy7Rhm_5BLXbId90DRkwp4FfJ3lYiCetH8fi-Frd5JFhpzC5WxkmYpnoqhjx2KtMksLbS3qXrTNw6vzy4NL3gi1tlsCNTuTE6_2A_3oSK-aE1n0VL1zbN22G6Tr0l3iDsmGa-4SBqvojDUPDQkx19SYmPcsV_QtakVjSr5F-K7skySpE4VyYc5Nb0LTsdGjTkK-Bz1b1SExGaUqv5CNbrQT7DTD4v5MfmJ6gvRCnuDOb1nHJ-3PQtiDnME4f8iux7HBhaShqO9xIoqOPLBAg3yOjzyUIvPfefiDg9Ts"
          }));
      print('data riwayat');
      if (response.statusCode == 200) {
        print("$response.data");
        return RiwayatResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
  // =====
}
