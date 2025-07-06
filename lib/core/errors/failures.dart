import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;
  const Failures({required this.errorMessage});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioExeption(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: "Connection timed out. Please try again.",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errorMessage: "Send request timed out. Please check your network.",
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMessage: "Receive timeout from server. Try again later.",
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          errorMessage: "Bad SSL certificate. Cannot verify server identity.",
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request was cancelled.");

      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage:
              "Connection error. Please check your internet connection.",
        );
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(
            errorMessage:
                "No internet connection. Please check your internet connection.",
          );
        }
        return ServerFailure(
          errorMessage: "Unexpected error occurred. Please try again later.",
        );
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
        errorMessage: 'Your request was not found, please try again later.',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: 'Internal server error, please try again later.',
      );
    } else {
      return ServerFailure(
        errorMessage: 'Opps something went wrong, please try again later',
      );
    }
  }
}
