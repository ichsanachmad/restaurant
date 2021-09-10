import 'package:dio/dio.dart';
import 'package:restaurant/utils/utils.dart';

class ApiClient {
  static Dio dio() {
    BaseOptions _baseOptions = BaseOptions(
      baseUrl: Env.apiUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
    return Dio(_baseOptions);
  }
}