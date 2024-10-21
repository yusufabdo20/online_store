import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_store/features/categories/data/models/get_categories_response_model/get_categories_response_model.dart';
import 'package:online_store/features/categories/data/models/get_category_details_response_model/get_category_details_response_model.dart';
import 'package:online_store/features/categories/data/repo/categories_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  static CategoriesCubit instance (context) => BlocProvider.of<CategoriesCubit>(context) ; 

  getCategories() async {
    emit(GetCategoriesLoading());
    var result = await CategoriesRepoImp().getCategories();
    result.fold((l) {
      print("In CategoriesCubit in ERROR ");

      emit(GetCategoriesError(error: l.errorMessage));
    }, (r) {
      print("In CategoriesCubit in getCategories ");
      print(r.data!.categories);

      emit(
        GetCategoriesSuccuss(getCategoriesResponseModel: r),
      );
    });
  }

  getCategoryDetails({required num categoryId}) async {
    emit(GetCategoryDetailsLoading());
    var result =
        await CategoriesRepoImp().getCategoyDetails(categoryId: categoryId);
    result.fold((l) {
      print("In CategoriesCubit in ERROR ");

      emit(GetCategoryDetailsError(error: l.errorMessage));
    }, (r) {
      print("In CategoriesCubit in getCategories ");
      print(r.data!.products);

      emit(
        GetCategoryDetailsSuccuss(getCategoryDetailsResponseModel: r),
      );
    });
  }
}
