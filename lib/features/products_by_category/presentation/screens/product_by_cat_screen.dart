import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/custom_widgets/custom_floating_action_button.dart';
import 'package:mini_ecommerce/features/products_by_category/domain/entities/product_by_cat_entity.dart';
import 'package:mini_ecommerce/features/products_by_category/presentation/cubit/product_by_cat_cubit.dart';
import 'package:mini_ecommerce/features/products_by_category/presentation/widgets/categories_section.dart';
import 'package:mini_ecommerce/features/products_by_category/presentation/widgets/product_by_cat_widget.dart';
import 'package:mini_ecommerce/injection_container.dart';

class ProductsByCatScreen extends StatelessWidget {
  const ProductsByCatScreen({
    Key? key,
    this.allProductsByCatEntity,
    required this.categoriesEntity,
    required this.userId,
    required this.selectedCatId,
  }) : super(key: key);
  final List<ProductByCatDataEntity>? allProductsByCatEntity;
  final int userId;
  final List categoriesEntity;
  final int
      selectedCatId; //comes from route and route get it from categoryItemHome and categoryItemHome get it from the home cubit

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: CustomFloatingActionButton(
          width: width,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutesName.cartScreen2);
          }),
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.01,
          vertical: height * 0.002,
        ),
        child: BlocProvider(
          create: (context) => sl<ProductByCatCubit>()
            ..getDataByCat(userId, selectedCatId, context),
          child: Container(
            decoration: const BoxDecoration(color: AppColors.kBackGroundColor),
            height: height,
            width: width,
            child: LayoutBuilder(
              builder: (context, constraint) {
                return ListView(
                  children: [
                    SizedBox(
                      height: constraint.maxHeight * 0.01,
                    ),
                    CategoriesSection(
                      maxWidth: constraint.maxWidth,
                      maxHeight: constraint.maxHeight,
                      categoriesEntity: categoriesEntity,
                    ),
                    BlocBuilder<ProductByCatCubit, ProductByCatState>(
                      builder: (context, state) {
                        if (state is ProductByCatErrorState) {
                          return const Center(child: Text("No Products Yet"));
                        } else if (state is ProductByCatSuccessState) {
                          return SizedBox(
                            height: constraint.maxHeight,
                            width: constraint.maxWidth,
                            child: GridView.builder(
                              padding: EdgeInsets.only(
                                  bottom: constraint.maxHeight * 0.25),
                              itemBuilder: (context, index) {
                                return ProductByCatWidget(
                                  productsDataByCatEntity: state
                                      .productByCatEntity
                                      .productsByCatDataEntity![index],
                                  maxHeight: constraint.maxHeight,
                                  maxWidth: constraint.maxWidth,
                                );
                              },
                              itemCount: state.productByCatEntity
                                  .productsByCatDataEntity!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.7,
                                      crossAxisSpacing: width * 0.02,
                                      mainAxisSpacing: width * 0.02),
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.5,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
