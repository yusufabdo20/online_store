import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:online_store/core/api_service/api_service.dart';
import 'package:online_store/core/errors/failures.dart';
import 'package:online_store/core/utils/app_constants.dart';
import 'package:online_store/features/categories/data/models/get_categories_response_model/get_categories_response_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failures, GetCategoriesResponseModel>> getCategories();
}

class CategoriesRepoImp extends CategoriesRepo {
  @override
  Future<Either<Failures, GetCategoriesResponseModel>> getCategories() async {
    try {
      final data = await ApiService(dio: Dio())
          .get(endPoint: AppConstants.categoryEndPoint);
      GetCategoriesResponseModel getCategoriesResponseModel =
          GetCategoriesResponseModel.fromJson(data);
      return Right(getCategoriesResponseModel);
    } on DioException catch (e) {
      return Left(ServerError.fromDioError(e));
    }
  }
}
