import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> post({
    required String url,
    required body,
    required token,
  }) async {
    var response = await _dio.post(url,
        data: body,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {'Authorization': 'Bearer $token'}));

    return response;
  }
}
