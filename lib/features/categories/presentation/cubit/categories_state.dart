part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class GetCategoriesSuccuss extends CategoriesState {
  final GetCategoriesResponseModel getCategoriesResponseModel;

  GetCategoriesSuccuss({required this.getCategoriesResponseModel});
}

final class GetCategoriesError extends CategoriesState {
  final String error;

  GetCategoriesError({required this.error});
}

final class GetCategoriesLoading extends CategoriesState {}
