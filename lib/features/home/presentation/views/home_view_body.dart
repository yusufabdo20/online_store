import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_store/core/shared/app_methods.dart';

import '../../../categories/presentation/views/categories_screen.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      // color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomeTextField(),
            TextButton(
                onPressed: () {
                  AppMethods.navigateTo(
                    context,
                    const CategoriesScreen(),
                  );
                },
                child: Text("see Categories >>")),
            CarouselSlider(
              options: CarouselOptions(height: 200.0),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ));
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    ));
  }
}

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              100,
            ),
            borderSide: const BorderSide(
              width: 0,
              color: Colors.transparent,
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                100,
              ),
              borderSide: const BorderSide(width: 0)),
          prefixIcon: const Icon(
            Icons.search,
            size: 30,
          )),
    );
  }
}
