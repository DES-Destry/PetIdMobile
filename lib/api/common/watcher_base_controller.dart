import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pet_id_mobile/api/dto/responses/error_response.dto.dart';
import 'package:pet_id_mobile/api/exceptions/api.exception.dart';
import 'package:pet_id_mobile/api/exceptions/connection.exception.dart';

abstract class WatcherBaseController {
  final Dio _dio = Dio();
  late String _baseUrl;

  bool _isSuccessfulStatus(int status) => status >= 200 && status < 300;

  WatcherBaseController() {
    _baseUrl = dotenv.env['WATCHER_BACKEND_URL'] ?? '';
  }

  @protected
  Future<Response> get(String path) async {
    try {
      final Response response = await _dio.get('$_baseUrl/$path',
          options: Options(validateStatus: (_) => true));

      if (response.statusCode == null || response.data == null) {
        throw ConnectionException();
      }

      if (_isSuccessfulStatus(response.statusCode!)) {
        return response;
      }

      final errorResponse = ErrorResponseDto.fromJson(response.data);
      throw ApiException(errorResponse: errorResponse);
    } catch (err) {
      throw ConnectionException();
    }
  }
}
