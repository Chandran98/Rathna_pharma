// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:rathna/models/LR_update_model.dart';
// import 'package:rathna/utils/app_url.dart';

// // Future<LRupdatemodel> fetchLrupdatelist() async {
// //   // LRupdatemodel _lrup;
// //   // get ressa => _lrup;
// //   try {
// //     Response response;

// //     var dio = Dio();
// //     response = await dio.get(AppURl.lrupdateurl);
// //     if (response.statusCode == 200) {
// //       var res = LRupdatemodel.fromJson(response.data);
// //       return res;
// //     }
// //   } catch (e) {
// //     print(e.toString());
// //   }
// // }


// Future<LRupdatemodel> fetchlrupdate() async {
//   try {
//     var url = Uri.parse(AppURl.returnsurl);
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       var res = LRupdatemodel.fromJson(jsonDecode(response.body));
//       return res;
//     } else {
//       throw Exception('Server Error');
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }