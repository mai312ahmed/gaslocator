import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import '../error/exceptions.dart';
import 'api_consumer.dart';
import 'app_interceptors.dart';
import 'end_points.dart';
import 'status_code.dart';
import 'package:gaslocator/injection_container.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio client;
  DioConsumer({
    required this.client,
  }) {
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient;
    (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }
  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioException(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(path,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioException(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    final response = await client.put(path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body);
    return _handleResponseAsJson(response);
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    return jsonDecode(response.data.toString());
  }

  dynamic _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forBidden:
            throw const UnauthorizedException();
          case StatusCode.notfound:
            throw const NotFoundException();
          case StatusCode.confilct:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
      case DioExceptionType.cancel:
      default:
        throw const NoInternetConnectionException();
    }
  }
}
