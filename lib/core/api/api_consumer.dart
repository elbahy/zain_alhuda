import 'package:dio/dio.dart';

class ApiConsumer {
  late Dio _dio;
  final String endpoint;

  ApiConsumer({required this.endpoint}) {
    _dio = Dio(BaseOptions(
      baseUrl: endpoint,
    ));
  }
  Future<dynamic> get({String path = ''}) async {
    Response response = await _dio.get(path);
    return response.data;
  }
}
