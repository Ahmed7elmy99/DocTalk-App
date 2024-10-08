import 'package:dio/dio.dart';


class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "",
      receiveDataWhenStatusError: true,
    ));
  }

//130.61.130.252/api/auth/
  static Future<Response> getData(
      {required String url,
       Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
        //  dio.options.headers = { 'Authorization':  CashHelper.getString(key: "token")  };
    return await dio.get(url, queryParameters: queryParameters, data: data,    options: Options(
        headers: headers
      ),);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Map<String, dynamic> ?data}) async {
        // dio.options.headers = { 'Authorization':"Bearer ${ CashHelper.getString(key: "token")}" };
    dynamic response = await dio.post(
      url,
      queryParameters: queryParameters,
      data: data,
      
       options: Options(
        headers: headers
      ),
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
