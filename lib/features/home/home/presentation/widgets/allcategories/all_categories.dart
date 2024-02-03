import 'package:flutter/material.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/CategoryItemsEntity.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/allcategories/category_widget.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({Key? key, required this.categoryItemsEntity})
      : super(key: key);
  final CategoryItemsEntity categoryItemsEntity;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return CategoryWidget(
          categoryItemEntity: categoryItemsEntity.categoryItems![index],
          categoryItemsEntity: categoryItemsEntity.categoryItems!,
        );
      },
      itemCount: categoryItemsEntity.categoryItems!.length,
    );
  }
}
