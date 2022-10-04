// import 'package:dio/dio.dart';

// import "models/buku.dart";

// abstract class Services {
//   static Future<List<Buku>?> getListBukuTerbaru() async {
//     try {
//       Response response = await Dio().get(
//           'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerbaru');
//       // ignore: avoid_print
//       print('dapat data terbaru');
//       if (response.statusCode == 200) {
//         return List<Buku>.from(
//             response.data['Data'].map((i) => Buku.fromJson(i)));
//       } else {
//         return null;
//       }
//     } catch (e) {
//       // ignore: avoid_print
//       print(e);
//       return null;
//     }
//   }

//   static Future<List<Buku>?> getListBukuTerlaris() async {
//     try {
//       Response response = await Dio().get(
//           'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerlaris');
//       print('dapat data terlaris');
//       if (response.statusCode == 200) {
//         return List<Buku>.from(
//             response.data['Data'].map((i) => Buku.fromJson(i)));
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
// }
