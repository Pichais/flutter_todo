import 'package:flutter_todo/settings/setting_dio.dart';

class TodoService {
  final DioClient dioclient = DioClient();

  fetchTodos({required String status, required int offset}) async {
    var body = {
      "offset": offset,
      "limit": 10,
      "sortBy": "createdAt",
      "isAsc": true,
      "status": status,
    };
    try {
      var respon = await dioclient.get('/todo-list', queryParams: body);
      if (respon.data != null) {
        return respon.data;
      }
    } catch (e) {
      print(e);
    }
  }

}
