import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "Connection timeout with serverapi");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: "Send Timeout timeout with serverapi");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: "receive timeout with serverapi");
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: "bad Certificate  with serverapi");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: "Connection timeout with serverapi");
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: "There is no internet Connection");
      case DioExceptionType.unknown:
        if (e.message!.contains('SocketException')) {
          return ServerFailure(errMessage: 'No Internet Connection');
        }
        return ServerFailure(errMessage: 'Unexpected Error, Please try again!');
      default:
        return ServerFailure(
            errMessage: 'Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'Internal Server error, Please try later');
    } else {
      return ServerFailure(
          errMessage: 'Opps There was an Error, Please try again');
    }
  }
}
