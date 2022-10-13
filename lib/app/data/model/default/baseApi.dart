import 'package:dio/dio.dart';

class BaseApi {
  static Dio baseDio() {
    var dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (option, handler) {
        print("[BaseApi] Request ---->");
        print(
            "[BaseApi] Request URL (${option.method.toUpperCase()}) ${option.uri}");
        if (option.headers.entries.isNotEmpty) {
          print("[BaseApi] Request Header:");
          print(option.headers.entries);
        } else {
          print("[BaseApi] No headers");
        }

        if (option.data.toString().isNotEmpty) {
          print("[BaseApi] Request Body");
          print(option.data);
        } else {
          print("[BaseApi] No body");
        }

        handler.next(option);
      },
      onResponse: (response, handler) {
        print("[BaseApi] Response <----");
        print(
            "[BaseApi] Response (${response.statusCode}) from ${response.realUri}");
        print("[BaseApi] Response data:");
        print(response.data);

        handler.next(response);
      },
    ));

    return dio;
  }
}
