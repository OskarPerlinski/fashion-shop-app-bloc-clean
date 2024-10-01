import 'package:fashion_app/common/widgets/appbar/second_appbar.dart';
import 'package:fashion_app/presentation/all_categories/widgets/categories.dart';
import 'package:fashion_app/presentation/all_categories/widgets/shop_by_categories.dart';
import 'package:flutter/material.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SecondAppbar(),
      body: Column(
        children: [
          ShopByCategories(),
          SizedBox(height: 30),
          Categories()
        ],
      ),
    );
  }
  
}