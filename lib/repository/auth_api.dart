import 'dart:io';

import 'package:dio/dio.dart';
import 'package:moviebook/constans/api_url.dart';
import 'package:moviebook/helpers/user_email.dart';
import 'package:moviebook/models/network_response.dart';

class AuthApi {
  Dio dioApi() {
    BaseOptions options = BaseOptions(
        baseUrl: ApiUrl.baseUrl,
        headers: {
          'x-api-key': ApiUrl.apiKey,
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        responseType: ResponseType.json);
    final dio = Dio(options);
    return dio;
  }

  Future<NetworkResponse?> _getRequest({endpoint, param}) async {
    try {
      final dio = dioApi();
      final result = await dio.get(endpoint, queryParameters: param);
      NetworkResponse.success(result.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        NetworkResponse.error(data: null, message: 'request failed timeout');
        print("error timouer");
        NetworkResponse.error(data: null, message: 'request error dio');
      }
      print("error dio");
    } catch (e) {
      print("error lainnya");
      NetworkResponse.error(data: null, message: 'request error other');
    }
  }

  Future<NetworkResponse?> _postRequest({endpoint, body}) async {
    try {
      final dio = dioApi();
      final result = await dio.post(endpoint, data: body);
      NetworkResponse.success(result.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        NetworkResponse.error(data: null, message: 'request failed timeout');
        print("error timouer");
        NetworkResponse.error(data: null, message: 'request error dio');
      }
      print("error dio");
    } catch (e) {
      print("error lainnya");
      NetworkResponse.error(data: null, message: 'request error other');
    }
  }

  Future<NetworkResponse?> getUserByEmail() async {
    final result = await _getRequest(
        endpoint: ApiUrl.users, param: {"email": UserEmail.getUserEmail()});
    return result;
  }
}
