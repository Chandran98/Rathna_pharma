import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/models/Cover_models.dart';
import 'package:rathna/utils/app_url.dart';

// Future<Covermodel> fetchcoverslist() async {
//   try {
//     Response response;

//     var dio = Dio();
//     response = await dio.get(AppURl.coverurl);
//     if (response.statusCode == 200) {
//       var res = Covermodel.fromJson(response.data);
//       print(res.the1.companyName);
//       return res;
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

// Future<Coverdata> fetchcover() async {
//   try {
//     List<Coverdata> loadData = [];
//     var url = Uri.parse(AppURl.coverurl);
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       var res = Coverdata.fromJson(jsonDecode(response.body));
//       for (var i = 0; i < res.coverData.length; i++) {
//         loadData.add(res);
//       }
//       loadData;
//     } else {
//       throw Exception('Server Error');
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

// class Coverproviderlist extends ChangeNotifier {
//   List<Coverdata> _models = [];
//   List<Coverdata> get models {
//     return _models;
//   }

//   Future<Coverdata> getcoverdata() async {
//     try {
//       List<Coverdata> apiuser = fetchcover() as List<Coverdata>;
//         _models=apiuser;
//     } catch (e) {
//       throw (e);
//     }
//   }
// }
