import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/base_home_cubit/categories_cubit/categories_cubit.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/allcategories/all_categories.dart';
import 'package:mini_ecommerce/injection_container.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.01,
        vertical: size.height * 0.01,
      ),
      child: BlocProvider(
        create: (context) => sl<CategoriesCubit>()..getAllCategories(context),
        child: Builder(builder: (context) {
          return BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
            if (state is CategoriesErrorState) {
              return Center(
                child: Text(state.status),
              );
            } else if (state is CategoriesSuccessState) {
              return AllCategories(
                categoryItemsEntity: state.categoryItemsEntity,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
        }),
      ),
    );
  }
}
