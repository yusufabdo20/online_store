import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/categories/data/models/get_categories_response_model/category.dart';
import 'package:online_store/features/categories/presentation/cubit/categories_cubit.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategories(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
        ),
        body: SafeArea(child: Center(
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is GetCategoriesSuccuss) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return CategoryItemWidget(
                        category: Category(
                          name: "sssss",
                          image:
                              'https://images.pexels.com/photos/6471779/pexels-photo-6471779.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        ),
                      );
                    });
              } else if (state is GetCategoriesLoading) {
                return CircularProgressIndicator();
              } else if (state is GetCategoriesError) {
                return Text(state.error);
              } else {
                return SizedBox();
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
    return Card(
      color: Colors.blueGrey,
      child: Column(
        children: [
          Image.network(category.image ?? ""),
          Text(category.name ?? "")
        ],
      ),
    );
  }
}
