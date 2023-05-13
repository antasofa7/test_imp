import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_apps/services/user_service.dart';
import 'package:my_apps/utils/constans.dart';

class DioHelper {
  static BaseOptions options = BaseOptions(
      baseUrl: Constans.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: Constans.receiveTimeout,
      connectTimeout: Constans.connectionTimeout,
      sendTimeout: Constans.sendTimeout);

  static Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    String? token = (await UserService.getLocalUser()).data?.accessToken;
    try {
      final Response response = await Dio(DioHelper.options).get(
        path,
        queryParameters: queryParameters,
        options: Options(
            contentType: "application/json",
            headers: {"Accept": "*/*", "Authorization": "Bearer $token"}),
      );

      return response;
    } catch (e) {
      debugPrint('error: $e');
      rethrow;
    }
  }

  static Future<Response> post(
    String path, {
    data,
    bool withToken = true,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    String? token;
    if (withToken) {
      token = (await UserService.getLocalUser()).data?.accessToken;
    }
    try {
      final response = await Dio(DioHelper.options).post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: withToken && token != null
            ? Options(contentType: "application/json", headers: {
                "Accept": "application/json",
                "Authorization": "Bearer $token"
              })
            : Options(contentType: "application/json", headers: {
                "Accept": "application/json",
              }),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> delete(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    String? token = (await UserService.getLocalUser()).data?.accessToken;
    try {
      final response = await Dio(DioHelper.options).delete(
        url,
        queryParameters: queryParameters,
        options: Options(contentType: "application/json", headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        }),
        cancelToken: cancelToken,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
