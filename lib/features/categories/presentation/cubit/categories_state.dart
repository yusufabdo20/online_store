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




final class GetCategoryDetailsSuccuss extends CategoriesState {
  final GetCategoryDetailsResponseModel getCategoryDetailsResponseModel;

  GetCategoryDetailsSuccuss({required this.getCategoryDetailsResponseModel});
}

final class GetCategoryDetailsError extends CategoriesState {
  final String error;

  GetCategoryDetailsError({required this.error});
}

final class GetCategoryDetailsLoading extends CategoriesState {}
