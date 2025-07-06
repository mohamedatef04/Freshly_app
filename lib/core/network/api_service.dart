import 'package:dio/dio.dart';
import 'package:freshly_app/core/network/api_constants.dart';
import 'package:freshly_app/core/network/supabase_constants.dart';

class ApiService {
  final dio = Dio(
    BaseOptions(baseUrl: baseUrl, headers: {'apikey': supabaseAnonKey}),
  );

  Future<Response> get({required String endPoint}) async {
    final response = await dio.get(endPoint);
    return response;
  }

  Future<Response> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.post(endPoint, data: data);
    return response;
  }

  Future<Response> update({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.patch(endPoint, data: data);
    return response;
  }

  Future<Response> delete({required String endPoint}) async {
    final response = await dio.delete(endPoint);
    return response;
  }
}
