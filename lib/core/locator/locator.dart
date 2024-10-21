import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:online_store/core/api_service/api_service.dart';

GetIt getIt = GetIt.instance;

void locator(){
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: Dio()));

}