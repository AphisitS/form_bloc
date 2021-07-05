import 'package:dio/dio.dart';

class ApiService {
  Dio dio;
  Future getApiService(String path) async{
    var respone = await dio.get(path);
    return respone.data;
  }
}