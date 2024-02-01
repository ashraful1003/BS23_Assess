import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '/app/network/dio_provider.dart';
import '/app/network/error_handlers.dart';
import '/app/network/exceptions/base_exception.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      if (response.statusCode != HttpStatus.ok ||
          (response.data as Map<String, dynamic>)['statusCode'] !=
              HttpStatus.ok) {
        // TODO
      }

      return response;
    } on DioException catch (dioError) {
      Exception exception = handleDioError(dioError);
      throw exception;
    } catch (error) {
      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }

  Future<Map> fetchLocalWithErrorParser<Map>(String local) async {
    try {
      Map response = await jsonDecode(local);
      return response;
    } catch (error) {
      if (error is BaseException) {
        rethrow;
      }
      throw handleError("$error");
    }
  }
}
