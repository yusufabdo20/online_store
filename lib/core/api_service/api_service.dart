import 'package:dio/dio.dart';
import 'package:online_store/core/utils/app_constants.dart';

class ApiService {
  Dio dio;
  ApiService({required this.dio});

  Future get(
      {required String endPoint,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    // dio.options = BaseOptions(
    //   baseUrl: AppConstants.baseUrl,
    //   contentType: 'application/json',
    //   headers: headers,
    // );
    final response = await dio.get(
      'https://student.valuxapps.com/api/categories',
      options: Options(
        headers: headers,
        contentType: "application/json",
      ),
      queryParameters: queryParameters,
    );
    return response.data ; 
  }
}
