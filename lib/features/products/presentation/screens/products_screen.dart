import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/custom_widgets/custom_floating_action_button.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';
import 'package:mini_ecommerce/features/products/presentation/widgets/product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    Key? key,
    this.allItemEntity,
  }) : super(key: key);
  final List<AllItemsEntity>? allItemEntity;

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
                  SizedBox(
                    height: constraint.maxHeight,
                    width: constraint.maxWidth,
                    child: GridView.builder(
                      itemBuilder: (context, index) {
                        return ProductWidget(
                          allItemEntity: allItemEntity![index],
                          maxHeight: constraint.maxHeight,
                          maxWidth: constraint.maxWidth,
                        );
                      },
                      itemCount: allItemEntity!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: width * 0.02,
                          mainAxisSpacing: width * 0.02),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
