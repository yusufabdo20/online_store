import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_store/features/categories/data/models/get_categories_response_model/get_categories_response_model.dart';
import 'package:online_store/features/categories/data/repo/categories_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  getCategories() async {
    emit(GetCategoriesLoading());
    var result = await CategoriesRepoImp().getCategories();
    result.fold((l) {
      //l for  Left (Error)
      emit(GetCategoriesError(error: l.errorMessage));
    }, (r) {
      //r for Right GetCategoriesResponseModel
      emit(
        GetCategoriesSuccuss(getCategoriesResponseModel: r),
      );
    });
  }
}
