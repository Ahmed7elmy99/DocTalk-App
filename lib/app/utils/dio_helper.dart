import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "",
        receiveDataWhenStatusError: true));
  }

//130.61.130.252/api/auth/
  static Future<Response> getData(
      {required String url,
       Map<String, dynamic>?   queryParameters,
      Map<String, dynamic>? data}) async {
    dio.options.headers = {
      "Content-Type": " application/json",
      "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNzEzNDUzMTYxLCJleHAiOjE3MTM0ODkxNjF9.9Qfp_ZX3l0gJGk0RAdtda1nrhkjWCE_zqtSRu43KrPs",
    };
    return await dio.get(
        url, queryParameters: queryParameters, data: data,
    );
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? queryParameters,
      required Map<String, dynamic> data}) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNzEzNDUzMTYxLCJleHAiOjE3MTM0ODkxNjF9.9Qfp_ZX3l0gJGk0RAdtda1nrhkjWCE_zqtSRu43KrPs",
    };
  dynamic   response = await dio.post(
      url,
      queryParameters: queryParameters,
      data: data,
    );
    return response;
  }

  static Future<Response> patchData(
      {required String url,
      Map<String, dynamic>? queryParameters,
      required Map<String, dynamic> data}) async {
    return await dio.patch(
      url,
      queryParameters: queryParameters,
      data: data,
    );
  }
}
