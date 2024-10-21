import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/categories/data/models/get_categories_response_model/category.dart';
import 'package:online_store/features/categories/presentation/cubit/categories_cubit.dart';

import '../../../../core/shared/app_methods.dart';
import 'category_details_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit.instance(context)..getCategories(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
        ),
        body: SafeArea(child: Center(
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is GetCategoriesSuccuss) {
                List<Category> categories =
                    state.getCategoriesResponseModel.data?.categories ?? [];
                return GridView.builder(
                    itemCount: categories.length ?? 0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return CategoryItemWidget(
                        category: categories[index],
                      );
                    });
              } else if (state is GetCategoriesLoading) {
                return const CircularProgressIndicator();
              } else if (state is GetCategoriesError) {
                return Text(state.error);
              } else {
                return const SizedBox();
              }
            },
          ),
        )),
      ),
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // BlocProvider.of<CategoriesCubit>(context)
        //     .getCategoryDetails(categoryId: category.id ?? 0);

        AppMethods.navigateTo(context, CategoryDetailsScreen(category: category,));
      },
      child: Card(
        color: Colors.cyan.shade900,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Image.network(category.image ??
                "https://images.pexels.com/photos/6471779/pexels-photo-6471779.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            Text(
              category.name ?? "",
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
