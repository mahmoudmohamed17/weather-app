import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMsg;

  const Failure({required this.errorMsg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMsg});
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMsg: 'Connection timeout with server.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMsg: 'Send data timeout with server.');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMsg: 'Receive data timeout with server.');

      case DioExceptionType.badCertificate:
        return ServerFailure(errorMsg: 'Bad certificate.');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure(errorMsg: 'Connection canceled.');

      case DioExceptionType.connectionError:
        return ServerFailure(errorMsg: 'No internet connection.');

      case DioExceptionType.unknown:    
          return ServerFailure(errorMsg: dioException.toString());
        
      default:
        return ServerFailure(
            errorMsg: 'Oops! there was an error, please try again.');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMsg: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(errorMsg: 'Request not found, try again later.');
    } else if (statusCode == 500) {
      return ServerFailure(errorMsg: 'Internal server error, try again later.');
    } else {
      return ServerFailure(
          errorMsg: 'Oops! there was an error, please try again.');
    }
  }
}
