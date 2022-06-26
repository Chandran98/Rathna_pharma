import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/models/Cover_models.dart';
import 'package:rathna/models/Return_model.dart';
import 'package:rathna/utils/app_url.dart';

// Future<Returnsmodel> fetchreturnslist() async {
//   try {
//     Response response;

//     var dio = Dio();
//     response = await dio.get(AppURl.coverurl);
//     if (response.statusCode == 200) {
//       var res = Returnsmodel.fromJson(response.data);
//       return res;
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

Future<ReturnsDatum> fetchreturns() async {
  try {
    var url = Uri.parse(AppURl.returnsurl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var res = ReturnsDatum.fromJson(jsonDecode(response.body));
      return res;
    } else {
      throw Exception('Server Error');
    }
  } catch (e) {
    print(e.toString());
  }
}
