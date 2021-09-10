import 'package:dio/dio.dart';

abstract class ApiHelperInterface {
  Future<Response> get(String url, {Map<String, dynamic>? queryParameters});
  Future<Response> post(String url, FormData body);
  Future<Response> put(String url, Map<String, dynamic> body);
  Future<Response> delete(String url);
}
