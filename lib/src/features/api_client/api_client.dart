import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiClientProvider = Provider((ref) => ApiClient());

/// Dio: https://pub.dev/packages/dio
class ApiClient with DioMixin implements Dio {
  ApiClient() {
    options = BaseOptions(
      baseUrl: 'https://api.github.com/',
      contentType: ContentType.json.value,
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    interceptors.add(InterceptorsWrapper(
      // Before request is sent
      onRequest: (options, handler) async {
        handler.next(options);
      },
      // with Response Data
      onResponse: (response, handler) {
        handler.next(response);
      },
      // with Response Error
      onError: (error, handler) {
        handler.next(error);
      },
    ));

    if (kDebugMode) {
      interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  void setAuthorization(String token) {
    options.headers.addAll(<String, Object?>{
      'Authorization': 'Bearer $token',
    });
  }
}
