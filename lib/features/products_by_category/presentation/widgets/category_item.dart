import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/helpers/translate_data_base_lang.dart';
import 'package:mini_ecommerce/features/products_by_category/presentation/cubit/product_by_cat_cubit.dart';
import 'package:mini_ecommerce/injection_container.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.categoryEntity,
    required this.height,
    required this.width,
  }) : super(key: key);
  final categoryEntity;
  final double height;

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.12,
        ),
        //categories image
        InkWell(
          onTap: () {
            // categoryEntity.categoriesId!.toInt();
            BlocProvider.of<ProductByCatCubit>(context).getDataByCat(
                int.parse(getUserId()),
                categoryEntity.categoriesId!.toInt(),
                context);
          },
          child: BlocBuilder<ProductByCatCubit, ProductByCatState>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.05),
                  border: Border.all(color: AppColors.grey2800),
                  boxShadow: AppColors.containersShadow,
                  // shape: BoxShape.circl,
                  color: categoryEntity.categoriesId ==
                          BlocProvider.of<ProductByCatCubit>(context).catId
                      ? AppColors.grey
                      : AppColors.grey2800.withOpacity(0.01),
                ),
                height: height,
                width: width * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(width * 0.08),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: SvgPicture.network(
                      "${ApiLinks.kLinkCategoriesImages}/${categoryEntity.categoriesImage}",
                      alignment: Alignment.center,
                      placeholderBuilder: (context) =>
                          const Icon(Icons.account_balance),
                      fit: BoxFit.scaleDown,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      // height: 0.5,
                      // width: 0.5,
                      // color: AppColors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        //categories name
        SizedBox(
          height: height * 0.08,
        ),
        Text(
          translateDataBaseLang(categoryEntity.categoriesNameAr.toString(),
              categoryEntity.categoriesName.toString()),
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.grey2800,
                fontSize: width * 0.03,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        )
      ],
    );
  }
}
