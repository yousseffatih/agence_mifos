
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';


class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late final Dio dio;
  final storage = GetStorage();

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://dev.mifos.io/fineract-provider/api/v1', // Your API base URL
      headers: {'Content-Type': 'application/json'},
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = storage.read('token');
        if (token != null) {
          options.headers['Authorization'] = 'Basic $token';
        }
        return handler.next(options);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          // Handle token expiration
          storage.erase();
          // Redirect to login
        }
        return handler.next(error);
      },
    ));
  }

  Future<Response> post(String path, Map<String, dynamic> data) async {
    return dio.post(path, data: data);
  }

  Future<Response> get(String path) async {
    return dio.get(path);
  }

  Future<Response> delete(String path) async {
    return dio.delete(path);
  }
}
