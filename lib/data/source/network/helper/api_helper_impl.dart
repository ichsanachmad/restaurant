import 'dart:io';

import 'package:dio/dio.dart';
import 'package:restaurant/data/source/network/helper/api_client.dart';
import 'package:restaurant/data/source/network/helper/api_helper_interface.dart';

class ApiHelperImpl implements ApiHelperInterface {
  Dio get _dio => ApiClient.dio();

  @override
  Future<Response> delete(String url) async {
    try {
      Response res = await _dio.delete(url);
      return res;
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response res = await _dio.get(url, queryParameters: queryParameters);
      return res;
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  @override
  Future<Response> post(String url, FormData body) async {
    try {
      Response res = await _dio.post(url, data: body);
      return res;
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  @override
  Future<Response> put(String url, Map<String, dynamic> body) async {
    try {
      Response res = await _dio.put(
        url,
        data: body,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      return res;
    } on SocketException {
      throw 'No Internet Connection';
    }
  }
}
