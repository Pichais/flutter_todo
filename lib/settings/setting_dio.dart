import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
      baseUrl: 'https://todo-list-api-mfchjooefq-as.a.run.app', 
      connectTimeout: const Duration(milliseconds: 5000), // กำหนดเวลาเชื่อมต่อสูงสุด (หน่วยเป็นมิลลิวินาที)
      receiveTimeout: const Duration(milliseconds: 3000), // กำหนดเวลารอการรับข้อมูลสูงสุด
    ));

  }

  Dio get dio => _dio;


  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      return await _dio.get(path, queryParameters: queryParams);
    } catch (e) {
      rethrow;
    }
  }
}
