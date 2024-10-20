import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/categories/data/models/get_categories_response_model/category.dart';
import 'package:online_store/features/categories/presentation/cubit/categories_cubit.dart';

import '../../data/models/get_category_details_response_model/product.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key ,required  this.category});
final Category category ; 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategoryDetails(categoryId:category.id??0 ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Category Details"),
        ),
        body: SafeArea(child: Center(
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is GetCategoryDetailsSuccuss) {
                List<Product> products =
                    state.getCategoryDetailsResponseModel.data?.products ?? [];
                return GridView.builder(
                    itemCount: products.length ?? 0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7,
                      crossAxisCount: 1,
                    ),
                    itemBuilder: (context, index) {
                      return ProductItemWidget(
                        product: products[index],
                      );
                    });
              } else if (state is GetCategoryDetailsLoading) {
                return const CircularProgressIndicator();
              } else if (state is GetCategoryDetailsError) {
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

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.cyan.shade900,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Image.network(product.image ??
              "https://images.pexels.com/photos/6471779/pexels-photo-6471779.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" , width: 300,height: 300,),
          Text(
            product.name ?? "",
            style: TextStyle(color: Colors.white, fontSize: 30),
          )
        ],
      ),
    );
  }
}
