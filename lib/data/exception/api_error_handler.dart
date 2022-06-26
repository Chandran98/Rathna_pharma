// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:dio/dio.dart';
import 'package:rathna/data/response/error_response.dart';

class ApiErrorhandler {
  static dynamic getmessage(error) {
    dynamic errordescription = "";
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errordescription = "Request to API server was cancelled";
              break;
            case DioErrorType.connectTimeout:
              errordescription = "Connection timeout with API server";
              break;
            case DioErrorType.other:
              errordescription =
                  "Connection to API server failed due to internet connection";
              break;
            case DioErrorType.receiveTimeout:
              errordescription =
                  "Receive timeout in connection with API server";
              break;
            case DioErrorType.response:
              switch (error.response.statusCode) {
                case 404:
                case 500:
                case 503:
                  errordescription = error.response.statusMessage;
                  break;
                default:
                  ErrorResponse errorResponse;
                  try {
                    errorResponse = ErrorResponse.fromJson(error.response.data);
                  } catch (e) {}
                  if (errorResponse != null &&
                      errorResponse.errors != null &&
                      errorResponse.errors.length > 0)
                    errordescription = errorResponse;
                  else
                    errordescription =
                        "Failed to load data -status code: ${error.response.data}";
              }
              break;
            case DioErrorType.sendTimeout:
              errordescription = "Send timeout with server";
              break;
          }
        } else {
          errordescription = "Unexcepted error occured";
        }
      } on FormatException catch (e) {
        errordescription = e.toString();
      }
    } else {
      errordescription = "is not a subtype of exception";
    }
    return errordescription;
  }
}
