import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  baseUrl: "https://www.mp3quran.net/api/v3",
  receiveDataWhenStatusError: true,
  connectTimeout: const Duration(seconds: 60),
  receiveTimeout: const Duration(seconds: 60),
);
