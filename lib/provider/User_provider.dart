// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:rathna/models/User_model.dart';

// class UserProvider with ChangeNotifier {
//   Userprofile _models;
//   Userprofile get models {
//     return _models;
//   }

//   Future<Userprofile> getApiCall() async {
//     try {
//       var response = await http.get(Uri.parse(
//           'https://libsitservices.com/core/api/customer/getById?customer_id=RE1234'));
//       var jsonData = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         print(jsonData['customer_getById'].length);
//         var divdata = Userprofile.fromJson(jsonData);

//         _models = divdata;
//         notifyListeners();
//       } else {}
//     } catch (e) {}
//   }
// }
