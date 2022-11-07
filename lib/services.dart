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
                "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjQyNDc0QTY4NDNBM0VBNTc2MTcyNDE2MTIxMEQ2OTlBMEZFNDQ2Q0EiLCJ0eXAiOiJhdCtqd3QiLCJ4NXQiOiJRa2RLYUVPajZsZGhja0ZoSVExcG1nX2tSc28ifQ.eyJuYmYiOjE2Njc4MDQ3NTcsImV4cCI6MTY2NzgyMjc1NywiaXNzIjoiaHR0cHM6Ly9kZW1vLWFjY291bnQua2VtZW5rZXUuZ28uaWQiLCJhdWQiOlsiZnJvbnRlbmQubmFkaW5lIiwiYWdlbmRhLmVrZW1lbmtldSIsInJhcGF0LmVrZW1lbmtldSIsIm5vdGlmaWNhdGlvbi5la2VtZW5rZXUiLCJrZWhhZGlyYW4uZWtlbWVua2V1Iiwib3JnYW5pc2FzaS5ocmlzIiwicHJvZmlsLmhyaXMiLCJqYWJhdGFuLmhyaXMiLCJwYW5na2F0LmhyaXMiLCJkaWtsYXQuaHJpcyIsImtlbHVhcmdhLmhyaXMiLCJwZW5kaWRpa2FuLmhyaXMiLCJla2VtZW5rZXUiLCJrb2xhYm9yYXNpLmVrZW1lbmtldSIsInBlZ2F3YWkuZWtlbWVua2V1Il0sImNsaWVudF9pZCI6ImVrZW1lbmtldS1vYS1kZXYiLCJFbmFibGVNRkEiOiJmYWxzZSIsInN1YiI6IjJiN2EzYmRjLTBlZmYtNGFiMi1iNmI0LWY2MDEzNWRkZTk5OCIsImF1dGhfdGltZSI6MTY2NzgwNDc1NSwiaWRwIjoibG9jYWwiLCJuYW1lIjoiRXJpdGEgWXVsaWFzdHV0aSIsImlkIjoiMTE1Mjc5IiwiYWRkcmVzcyI6IkFwdC4gR2FkaW5nIE5pYXMgUmVzaWRlbmNlIFRvd2VyIENocnlzYW50IE5vLiBDLzE3L0pEIEtlbGFwYSBHYWRpbmcgSmFrYXJ0YSBVdGFyYSIsInBob25lX251bWJlciI6IjA4MTIyNzA3NzQ3NyIsIm5pcCI6IjE5ODUwNzEzMjAxMDEyMjAwMSIsImphYmF0YW4iOiJQZWxha3NhbmEiLCJqZW5pc19qYWJhdGFuIjoiRnVuZ3Npb25hbCBVbXVtIFBOUyIsImtvZGVfb3JnYW5pc2FzaSI6IjM1MDMxMDE4MDIiLCJvcmdhbmlzYXNpIjoiU3ViYmlkYW5nIFBlcmFuY2FuZ2FuIGRhbiBQZW5nZW1iYW5nYW4gQXBsaWthc2kgSSwgQmlkYW5nIEFwbGlrYXNpLCBQdXNhdCBTaXN0ZW0gSW5mb3JtYXNpIGRhbiBUZWtub2xvZ2kgS2V1YW5nYW4sIFNla3JldGFyaWF0IEplbmRlcmFsIiwia29kZV9zYXRrZXIiOiI2NzI5MDYiLCJzYXRrZXIiOiJQdXNhdCBTaXN0ZW0gSW5mb3JtYXNpIGRhbiBUZWtub2xvZ2kgS2V1YW5nYW4iLCJncmF2YXRhciI6Imh0dHBzOi8vYWNjb3VudC5rZW1lbmtldS5nby5pZC9tYW5hZ2UvVXBsb2Fkcy9UaHVtYm5haWxzLzE5ODUwNzEzMjAxMDEyMjAwMS5qcGciLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiIxOTg1MDcxMzIwMTAxMjIwMDEiLCJlbWFpbCI6ImVyaXRhLnlAa2VtZW5rZXUuZ28uaWQiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwianRpIjoibG5QaFJrUEVKb0F3MkJ4c3N6aFRoQSIsInNjb3BlIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJmcm9udGVuZC5uYWRpbmUiLCJhZ2VuZGEuZWtlbWVua2V1IiwicmFwYXQuZWtlbWVua2V1Iiwibm90aWZpY2F0aW9uLmVrZW1lbmtldSIsImtlaGFkaXJhbi5la2VtZW5rZXUiLCJvcmdhbmlzYXNpLmhyaXMiLCJwcm9maWwuaHJpcyIsImphYmF0YW4uaHJpcyIsInBhbmdrYXQuaHJpcyIsImRpa2xhdC5ocmlzIiwia2VsdWFyZ2EuaHJpcyIsInBlbmRpZGlrYW4uaHJpcyIsImVrZW1lbmtldSIsImtvbGFib3Jhc2kuZWtlbWVua2V1IiwicGVnYXdhaS5la2VtZW5rZXUiXSwiYW1yIjpbInB3ZCJdfQ.ObetukvUES-MsIccV4GeAVI6NueHxc2mIHEu3ckKBNSX0o_GJcdrphcxTPrp_J4UP46hnYBpZEpBem5ByJ454wE4Z10WGR-ZRQY14YJe5jFAUrLRMAuc3k3IwV6Ya26y7dkzrCh4GbsTeydqQcfahyhmw2z98lKfnBlJS6f0kBfEiWCek4638xeJ2EqZKYOAJiKs3fWcAipw7L4aTwBELQw1ZiCYqC3d0fDVSmP90lSXayovJnz2ITolpEZvqmCkcxy3UYPbqBxBvM-u8kucAhmuI_7s37xNHCdhaNx9VHnUF-2FzlAMpbj4Y0HDtjxJ7XKGNMqQd6fRhT94Mc-heufiGJFZ3tvECrqUklOJtac1H-g38zmECG_io3Vx7N4P0nbTy04qMLFSSa5mQNiyBothvlO7RKKGYlpa1xgfBoCamgCqKpFOLVau4_C22DDIb7luaOV6ySHeALI4oqbr6bwrrInGJzhqyVyRnNZn98ia_rOnXQ8fLj3D-AbCpEGiQNeb97Ew8BaZDjpdGYrGobp6dcMhZrfww8FzlaVU8Qo9KfwSHMmF4do8DgYXJ-t1xDevS0sihH8tFCMeO18kqVX6bLEhHiIwXSQWIgXrgdATo3S2zgdGfFfP38vZkAdqnM2f4diHWMnw_WA83SoQrAYP6wAhcMpjWG8nmbSkk5M"
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
