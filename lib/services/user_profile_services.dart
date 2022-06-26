
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:rathna/models/User_model.dart';
import 'package:rathna/utils/app_url.dart';


// Future<Usermodel> fetchuserprofile() async {
//   try {
//     Response response;

//     var dio = Dio();
//     response = await dio.get(AppURl.coverurl);
//     if (response.statusCode == 200) {
//       var res = Usermodel.fromJson(response.data);
//       return res;
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

// Future<Userprofile> fetchuserprofile() async {
//   try {
//     var url = Uri.parse(AppURl.userprofileurl);
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       var res = Userprofile.fromJson(jsonDecode(response.body));
//       return res;
//     } else {
//       throw Exception('Server Error');
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }
