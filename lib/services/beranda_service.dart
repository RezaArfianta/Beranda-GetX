// import 'package:dio/dio.dart';
// import 'package:belajargetx/models/buku_model.dart';

// abstract class BerandaService {
//   static Future<List<Buku>?> getListBukuTerbaru() async {
//     await Future.delayed(Duration(seconds: 1));
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
// }
