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
                "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjQyNDc0QTY4NDNBM0VBNTc2MTcyNDE2MTIxMEQ2OTlBMEZFNDQ2Q0EiLCJ0eXAiOiJhdCtqd3QiLCJ4NXQiOiJRa2RLYUVPajZsZGhja0ZoSVExcG1nX2tSc28ifQ.eyJuYmYiOjE2Njc4OTE2MzYsImV4cCI6MTY2NzkwOTYzNiwiaXNzIjoiaHR0cHM6Ly9kZW1vLWFjY291bnQua2VtZW5rZXUuZ28uaWQiLCJhdWQiOlsiZnJvbnRlbmQubmFkaW5lIiwiYWdlbmRhLmVrZW1lbmtldSIsInJhcGF0LmVrZW1lbmtldSIsIm5vdGlmaWNhdGlvbi5la2VtZW5rZXUiLCJrZWhhZGlyYW4uZWtlbWVua2V1Iiwib3JnYW5pc2FzaS5ocmlzIiwicHJvZmlsLmhyaXMiLCJqYWJhdGFuLmhyaXMiLCJwYW5na2F0LmhyaXMiLCJkaWtsYXQuaHJpcyIsImtlbHVhcmdhLmhyaXMiLCJwZW5kaWRpa2FuLmhyaXMiLCJla2VtZW5rZXUiLCJrb2xhYm9yYXNpLmVrZW1lbmtldSIsInBlZ2F3YWkuZWtlbWVua2V1Il0sImNsaWVudF9pZCI6ImVrZW1lbmtldS1vYS1kZXYiLCJFbmFibGVNRkEiOiJmYWxzZSIsInN1YiI6IjJiN2EzYmRjLTBlZmYtNGFiMi1iNmI0LWY2MDEzNWRkZTk5OCIsImF1dGhfdGltZSI6MTY2Nzg5MTYzNCwiaWRwIjoibG9jYWwiLCJuYW1lIjoiRXJpdGEgWXVsaWFzdHV0aSIsImlkIjoiMTE1Mjc5IiwiYWRkcmVzcyI6IkFwdC4gR2FkaW5nIE5pYXMgUmVzaWRlbmNlIFRvd2VyIENocnlzYW50IE5vLiBDLzE3L0pEIEtlbGFwYSBHYWRpbmcgSmFrYXJ0YSBVdGFyYSIsInBob25lX251bWJlciI6IjA4MTIyNzA3NzQ3NyIsIm5pcCI6IjE5ODUwNzEzMjAxMDEyMjAwMSIsImphYmF0YW4iOiJQZWxha3NhbmEiLCJqZW5pc19qYWJhdGFuIjoiRnVuZ3Npb25hbCBVbXVtIFBOUyIsImtvZGVfb3JnYW5pc2FzaSI6IjM1MDMxMDE4MDIiLCJvcmdhbmlzYXNpIjoiU3ViYmlkYW5nIFBlcmFuY2FuZ2FuIGRhbiBQZW5nZW1iYW5nYW4gQXBsaWthc2kgSSwgQmlkYW5nIEFwbGlrYXNpLCBQdXNhdCBTaXN0ZW0gSW5mb3JtYXNpIGRhbiBUZWtub2xvZ2kgS2V1YW5nYW4sIFNla3JldGFyaWF0IEplbmRlcmFsIiwia29kZV9zYXRrZXIiOiI2NzI5MDYiLCJzYXRrZXIiOiJQdXNhdCBTaXN0ZW0gSW5mb3JtYXNpIGRhbiBUZWtub2xvZ2kgS2V1YW5nYW4iLCJncmF2YXRhciI6Imh0dHBzOi8vYWNjb3VudC5rZW1lbmtldS5nby5pZC9tYW5hZ2UvVXBsb2Fkcy9UaHVtYm5haWxzLzE5ODUwNzEzMjAxMDEyMjAwMS5qcGciLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiIxOTg1MDcxMzIwMTAxMjIwMDEiLCJlbWFpbCI6ImVyaXRhLnlAa2VtZW5rZXUuZ28uaWQiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwianRpIjoieXZ0NHNIcGpZSE5mTnRXYUFnRnFwUSIsInNjb3BlIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJmcm9udGVuZC5uYWRpbmUiLCJhZ2VuZGEuZWtlbWVua2V1IiwicmFwYXQuZWtlbWVua2V1Iiwibm90aWZpY2F0aW9uLmVrZW1lbmtldSIsImtlaGFkaXJhbi5la2VtZW5rZXUiLCJvcmdhbmlzYXNpLmhyaXMiLCJwcm9maWwuaHJpcyIsImphYmF0YW4uaHJpcyIsInBhbmdrYXQuaHJpcyIsImRpa2xhdC5ocmlzIiwia2VsdWFyZ2EuaHJpcyIsInBlbmRpZGlrYW4uaHJpcyIsImVrZW1lbmtldSIsImtvbGFib3Jhc2kuZWtlbWVua2V1IiwicGVnYXdhaS5la2VtZW5rZXUiXSwiYW1yIjpbInB3ZCJdfQ.MRCfNZfV9U_0A_Y-pNh6OEouk7o8bJffLPddxDZ6tOl4ittphwsBKA-jZsoaJ6AKexGg7bBDOvoIDKcFhItz_R2bSYp095cPqfv5OA64WMpjaBA-zd_yTKNvfIEdrFvEJCINVACt46hxFnU-5CPCd-ndp_HW-yw5lLaG2DJ2Sr2nK83CeeYt0mTO3oGKHTDfOAX1-JMb5Z3gKU7B_KKMOLwbCe8wD_w4bHEpReUQ3Pow4p7d9tv-hP_SUOs-sZ9GPlx6rn-jQ32f34vM99XvBjmj7HDKxVg-gKVjMsK9-akY2WwuF9QkBKTQMDyAS5gGsnlB6_QCrtHx4-6Xa6YlQJ9bB8hmBLurAAHaotq6AEKiyuDoTW0Wafju59NOpnT8giXdh_f2hTFRif1fhZaQi4igtxnISgShM7M98Q0aISVznPgPQVVM6t9rJNv1thCKfdB1xPiTzr-9SQnPZNrjlXFN15022Y1TyyINQaXrGoMN4RoV4c-_o3OlmRh0h9GFAhbXBS-1ileBN1w-Vwqk1kPPGGKr2AVTdA9H-8fEIKu_I0Him59Uz7UoawJjaXFC8-oE_zG3SvY2GMMMGvBDIB_RS0R9FcV8jxXtf-t6o29QAun_UM-v3YMmel_8ZU8qY5yQF7KaObsxsgTSvZoKvyL2MAt2nB5U4cSp0CHKwSc"
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
