import 'package:dio/dio.dart';

class RecitersService {
  late Dio dio;

  RecitersService() {
    dio = Dio();
  }

  Future<List<dynamic>> getReciters() async {
    final response = await dio.get('https://www.mp3quran.net/api/v3/reciters');
    return response.data;
  }
}
