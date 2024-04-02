import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static init(){
    dio = Dio(
        BaseOptions(
            baseUrl: "http://130.61.130.252/api/auth/",
            receiveDataWhenStatusError: true
        )
    );
  }

  static Future<Response>getData({required String url , required Map<String,dynamic> queryParameters}) async{
    return await  dio.get(
        url,
        queryParameters:queryParameters
    );
  }

  static Future<Response>postData({required String url ,  Map<String,dynamic>? queryParameters, required Map<String,dynamic> data}) async{
    return await  dio.post(
        url,
        queryParameters:queryParameters,
      data: data,
    );
  }

  static Future<Response>patchData({required String url ,  Map<String,dynamic>? queryParameters, required Map<String,dynamic> data}) async{
    return await  dio.patch(
        url,
        queryParameters:queryParameters,
      data: data,
    );
  }
}