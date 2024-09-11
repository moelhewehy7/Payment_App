import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> post(
      {required String url,
      required body,
      required token,
      Map<String, dynamic>? headers}) async {
    var response = await _dio.post(url,
        data: body,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: headers ??
                {
                  'Authorization': 'Bearer $token',
                }));

    return response;
  }
}
