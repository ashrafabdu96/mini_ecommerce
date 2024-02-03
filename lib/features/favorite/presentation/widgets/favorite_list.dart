import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_entity.dart';
import 'package:mini_ecommerce/features/favorite/presentation/widgets/favorite_widget.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    Key? key,
    required this.height,
    required this.width,
    required this.allFavoriteData,
  }) : super(key: key);

  final double height;
  final double width;
  final List<FavoriteDataEntity> allFavoriteData;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: ),
      width: double.infinity,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: height * 0.01,
          // mainAxisExtent: height * 0.42,
          crossAxisSpacing: height * 0.01,
          childAspectRatio: height * 0.001,
        ),
        itemBuilder: (context, index) {
          return Container(
            // width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              top: height * 0.003,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              //   boxShadow: AppColors.containersShadow,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Color(0xffedecf1),
                  offset: Offset(-2, -2),
                ),
                // inner
                BoxShadow(
                  blurRadius: 5.0,
                  color: Color(0xffedecf1),
                  offset: Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(
                width * 0.035,
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraint) {
                //  this what will go as a widget
                return FavoriteWidget(
                  index: index,
                  height: constraint.maxHeight,
                  width: constraint.maxWidth,
                  favoriteData: allFavoriteData[index],
                );
              },
            ),
          );
        },
        itemCount: allFavoriteData.length,
      ),
    );
  }
}
