import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/home_cubit.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/categories/category_item_home.dart';

class CategorySectionHome extends StatelessWidget {
  const CategorySectionHome(
      {Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.012),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccessState) {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: width * 0.02,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryItemHome2(
                    categoryEntity: state.homeEntity.categories![
                        index], //send just the entity to send it to getData in productByCat
                    height: height,
                    width: width,
                    categoriesEntity: state.homeEntity
                        .categories!, //send the list to display in productByCat
                  );
                },
                itemCount: state.homeEntity.categories!.length,
              );
            } else if (state is HomeErrorState) {
              return Text(state.status);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
