import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
      // baseUrl: 'YOUR_BASE_URL', 
      connectTimeout: const Duration(milliseconds: 5000), // กำหนดเวลาเชื่อมต่อสูงสุด (หน่วยเป็นมิลลิวินาที)
      receiveTimeout: const Duration(milliseconds: 3000), // กำหนดเวลารอการรับข้อมูลสูงสุด
    ));

  }

  Dio get dio => _dio;

  // สร้าง Method สำหรับการร้องขอข้อมูลต่างๆ เช่น GET, POST
  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      return await _dio.get(path, queryParameters: queryParams);
    } catch (e) {
      rethrow;
    }
  }

  // เพิ่ม method อื่นๆ เช่น PUT, DELETE ตามความต้องการ
}
