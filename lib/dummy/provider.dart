// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:rathna/dummy/new_model.dart';

// import 'model_dummy.dart';

// class ApiCallProvider with ChangeNotifier {
//   List<DataModel> _models = [];
//   List<DataModel> get models {
//     return _models;
//   }

//   Future<void> getApiCall() async {
//     try {
//       List<DataModel> loadData = [];
//       var response = await http.get(Uri.parse(
//           'https://libsitservices.com/core/api/cover/getById?customer_id=RE1234'));
//       var jsonData = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         print(jsonData['cover_data'].length);
//         for (var i = 0; i < jsonData['cover_data'].length; i++) {
//           // print(jsonData['cover_data'][i]['no_of_data']);
//           // print(jsonData['cover_data'][i]['type']);
//           // print(jsonData['cover_data'][i]['courier_no']);
//           loadData.add(DataModel(
//               id: jsonData['cover_data'][i]['no_of_data'],
//               type: jsonData['cover_data'][i]['type'],
//               curierNo: jsonData['cover_data'][i]['courier_no'],
//               companyName: jsonData['cover_data'][i]['company_name'],
//               customerName: jsonData['cover_data'][i]['customer_name'],
//               customerCity: jsonData['cover_data'][i]['customer_city'],
//               customerId: jsonData['cover_data'][i]['customer_id'],
//               comment: jsonData['cover_data'][i]['comments'],
//               transportName: jsonData['cover_data'][i]['transport_name'],
//               createddate: jsonData['cover_data'][i]['created_date']));
//         }
//         _models = loadData;
//         notifyListeners();
//       } else {}
//     } catch (e) {}
//   }
// }
