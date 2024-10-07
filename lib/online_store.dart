import 'package:flutter/material.dart';

import 'features/home/presentation/views/layout_view.dart';

class OnlineStore extends StatelessWidget {
  const OnlineStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Store',
      home: LayoutView(),
    );
  }
}
