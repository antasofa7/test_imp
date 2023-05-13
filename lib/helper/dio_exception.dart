import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.connectionError:
        message = 'No internet connection!';
        break;
      case DioErrorType.badCertificate:
        message = "badCertificate";
        break;
      case DioErrorType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        // return 'Bad request';
        return 'Bad request, ${error['message']}';
      case 401:
        // return 'Unauthorized';
        return 'Unauthorized, ${error['message']}';
      case 403:
        // return 'Forbidden';
        return 'Forbidden, ${error['message']}';
      case 404:
        return 'Not found, ${error['message']}';
      case 500:
        // return 'Internal server error';
        return 'Internal server error, ${error['message']}';
      case 502:
        return 'Bad gateway, ${error['message']}';
      // return 'Bad gateway';
      default:
        return 'Oops something went wrong, ${error['message']}';
      // return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
