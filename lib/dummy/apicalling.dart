// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;

// class NetworkApiService extends BaseApiServices {
//   @override
//   Future getGetApiResponse(
//     String url,
//   ) async {
//     dynamic responseJson;
//     try {
//       final response =
//           await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet Connection');
//     }

//     return responseJson;
//   }

//   @override
//   Future getPostApiResponse(String url, data) async {
//     dynamic responseJson;
//     try {
//       Response response =
//           await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));

//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet Connection');
//     }

//     return responseJson;
//   }

//   dynamic returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         dynamic responseJson = jsonDecode(response.body);
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 500:
//       case 404:
//         throw UnauthorisedException(response.body.toString());
//       default:
//         throw FetchDataException(
//             'Error accured while communicating with server' +
//                 'with status code' +
//                 response.statusCode.toString());
//     }
//   }
// }

// class AppException implements Exception {
//   final _message;
//   final _prefix;
//   AppException([this._message, this._prefix]);

//   String toString() {
//     return '$_prefix$_message';
//   }
// }

// class FetchDataException extends AppException {
//   FetchDataException([String message])
//       : super(message, 'Error During Communication');
// }

// class BadRequestException extends AppException {
//   BadRequestException([String message]) : super(message, 'Invalid request');
// }

// class UnauthorisedException extends AppException {
//   UnauthorisedException([String message])
//       : super(message, 'Unauthorised request');
// }

// class InvalidInputException extends AppException {
//   InvalidInputException([String message]) : super(message, 'Invalid Inpit');
// }

// abstract class BaseApiServices {
//   Future<dynamic> getGetApiResponse(
//     String url,
//   );

//   Future<dynamic> getPostApiResponse(String url, Map data);
// }
