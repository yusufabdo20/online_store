import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:online_store/core/api_service/api_service.dart';
import 'package:online_store/core/errors/failures.dart';
import 'package:online_store/core/utils/app_constants.dart';
import 'package:online_store/features/categories/data/models/get_categories_response_model/get_categories_response_model.dart';

import '../models/get_category_details_response_model/get_category_details_response_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failures, GetCategoriesResponseModel>> getCategories();
  Future<Either<Failures, GetCategoryDetailsResponseModel>> getCategoyDetails({required num categoryId});
}

class CategoriesRepoImp extends CategoriesRepo {
  @override
  Future<Either<Failures, GetCategoriesResponseModel>> getCategories() async {
    try {
      Map<String, dynamic> jsonData = await ApiService(dio: Dio()).get(
        endPoint: AppConstants.categoryEndPoint,
        headers: {
          'lang': 'ar',
        },
      );
      print(jsonData);
      GetCategoriesResponseModel getCategoriesResponseModel =
          GetCategoriesResponseModel.fromJson(jsonData);
      return Right(getCategoriesResponseModel);
    } on DioException catch (e) {
      print(e.toString());
      return Left(ServerError.fromDioError(e));
    }
  }
  
  @override
  Future<Either<Failures, GetCategoryDetailsResponseModel>> getCategoyDetails({required num categoryId})async {
    try {
      Map<String, dynamic> jsonData = await ApiService(dio: Dio()).get(
        endPoint:'${AppConstants.categoryEndPoint}/$categoryId',
        headers: {
          'lang': 'ar',
        },
      );
      print(jsonData);
      GetCategoryDetailsResponseModel getCategoriesDetailsResponseModel =
          GetCategoryDetailsResponseModel.fromJson(jsonData);
      return Right(getCategoriesDetailsResponseModel);
    } on DioException catch (e) {
      print(e.toString());
      return Left(ServerError.fromDioError(e));
    }
  }
}
