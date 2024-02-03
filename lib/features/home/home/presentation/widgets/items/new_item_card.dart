import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/custom_widgets/custom_row_icons.dart';
import 'package:mini_ecommerce/core/helpers/translate_data_base_lang.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';

class NewItemCardHome extends StatelessWidget {
  const NewItemCardHome(
      {Key? key,
      required this.maxWidth,
      required this.maxHeight,
      required this.allItemsEntity})
      : super(key: key);
  final double maxWidth;
  final double maxHeight;
  final AllItemsEntity allItemsEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.itemDetails,
            arguments: [allItemsEntity.itemsId, allItemsEntity]);
      },
      child: Container(
        height: maxHeight,
        width: maxWidth,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.0),
          boxShadow: AppColors.containersShadow,
          borderRadius: BorderRadius.all(
            Radius.circular(maxWidth * 0.02),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: maxWidth * 0.025,
          vertical: maxHeight * 0.025,
        ),
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(constraint.maxWidth * 0.04),
                child: Stack(
                  children: [
                    Center(
                      child: Image.network(
                        height: constraint.maxHeight * 0.65,
                        "${ApiLinks.kLinkItemsImages}/${allItemsEntity.itemsImage}",
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                    ),
                    Container(
                      height: constraint.maxHeight * 0.7,
                      color: AppColors.grey2800.withOpacity(0.3),
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.symmetric(
                          horizontal: constraint.maxWidth * 0.04,
                          vertical: constraint.maxWidth * 0.04),
                      child: CustomRowIcons(
                        maxWidth: maxWidth,
                        isInFav: allItemsEntity.isInFav.toString(),
                        isInCart: allItemsEntity.isInCart.toString(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: constraint.maxWidth * 0.05),
                child: Text(
                  translateDataBaseLang(allItemsEntity.itemsNameAr.toString(),
                      allItemsEntity.itemsName.toString()),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              SizedBox(
                height: maxHeight * 0.01,
              ),
              SizedBox(
                height: constraint.maxHeight * 0.13,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${allItemsEntity.itemsPrice.toString()}\$",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: constraint.maxHeight * 0.07,
                            color: AppColors.kShapesColor,
                          ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight,
                      child: Row(
                        children: [
                          Text(
                            allItemsEntity.stars ?? '0.0',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Colors.greenAccent,
                                    fontSize: constraint.maxWidth * 0.08),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellowAccent.shade700,
                            size: maxWidth * 0.055,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
