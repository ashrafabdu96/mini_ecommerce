import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/helpers/translate_data_base_lang.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';
import 'package:mini_ecommerce/features/payment/presentation/screen/payment_screen.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({
    Key? key,
    required this.height,
    required this.width,
    required this.itemsEntity,
  }) : super(key: key);
  final ItemsEntity itemsEntity;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.itemDetails,
            arguments: [itemsEntity.itemsId]);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "${ApiLinks.kLinkItemsImages}/${itemsEntity.itemsImage}",
              ),
              fit: BoxFit.contain),
        ),
        child: DefaultTextStyle(
          style: TextStyle(
              color: AppColors.white,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w700),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.05),
                  color: const Color.fromRGBO(0, 0, 0, 0.15),
                ),
              ),
              Positioned(
                top: height * 0.1,
                left: width * 0.10,
                right: width * 0.10,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translateDataBaseLang(itemsEntity.itemsNameAr.toString(),
                          itemsEntity.itemsName.toString()),
                    ),
                    Text(
                      translateDataBaseLang(
                          itemsEntity.itemsDescriptionAr.toString(),
                          itemsEntity.itemsDescription.toString()),
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: width * 0.034,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            color: AppColors.kWhiteFonts,
                            // shadows: AppColors.boxShadows,
                          ),
                      maxLines: 2,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        List<CartDataEntity> items = [
                          CartDataEntity(
                            itemsId: itemsEntity.itemsId,
                            itemsDiscount: itemsEntity.itemsDiscount,
                            itemsCount: itemsEntity.itemsCount,
                            cartQuantity: 1,
                            status: '',
                            isInCart: itemsEntity.isInCart,
                            isInFav: itemsEntity.isInFav,
                            itemsActive: itemsEntity.itemsActive,
                            itemsCategoriesId: itemsEntity.itemsCategoriesId,
                            itemsDateCreate: itemsEntity.itemsDateCreate,
                            itemsDescription: itemsEntity.itemsDescription,
                            itemsDescriptionAr: itemsEntity.itemsDescriptionAr,
                            itemsImage2: itemsEntity.itemsImage2,
                            itemsImage3: itemsEntity.itemsImage3,
                            itemsImage4: itemsEntity.itemsImage4,
                            itemsImage: itemsEntity.itemsImage,
                            itemsName: itemsEntity.itemsName,
                            itemsNameAr: itemsEntity.itemsNameAr,
                            itemsPrice: itemsEntity.itemsPrice,
                          ),
                        ];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                maintainState: true,
                                builder: (_) => PaymentScreen(
                                      cartDataEntity: items,
                                      total: (itemsEntity.itemsPrice! -
                                          (itemsEntity.itemsPrice! *
                                              itemsEntity.itemsDiscount! ~/
                                              100)),
                                    )));
                      },
                      style: Theme.of(context)
                          .elevatedButtonTheme
                          .style!
                          .copyWith(
                              backgroundColor: const MaterialStatePropertyAll(
                                AppColors.white,
                              ),
                              fixedSize: MaterialStatePropertyAll<Size>(
                                Size.fromWidth(
                                  width * 0.24,
                                ),
                              ),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.all(width * 0.02))),
                      child: Text(
                        "buy_now".tr(context),
                        style: TextStyle(
                            color: AppColors.kShapesColor,
                            fontSize: width * 0.03),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
