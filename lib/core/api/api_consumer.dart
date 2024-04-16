import 'package:dio/dio.dart';
import 'package:zain_alhuda/core/api/api_strings.dart';

class ApiConsumer {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: EndPoints.quranBaseUrl,
  ));

  Future<dynamic> get({required String path}) async {
    Response response = await _dio.get(path);
    return response.data;
  }
}
