import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/helpers/translate_data_base_lang.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';

class CartComponents extends StatefulWidget {
  const CartComponents({
    Key? key,
    required this.cartDataEntity,
    required this.width,
    required this.height,
  }) : super(key: key);

  final CartDataEntity cartDataEntity;
  final double width;
  final double height;

  @override
  State<CartComponents> createState() => _CartComponentsState();
}

class _CartComponentsState extends State<CartComponents> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // image
        Column(
          children: [
            ImageCart(
                width: widget.width,
                height: widget.height * 0.9,
                imgUrl: widget.cartDataEntity.itemsImage.toString()),
            Expanded(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: widget.height * 0.1,
                      width: widget.width * 0.1,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: AppColors.kShapesColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          color: AppColors.white,
                          shadows: const [
                            BoxShadow(
                                color: AppColors.white,
                                blurRadius: 10,
                                spreadRadius: 4)
                          ],
                          size: widget.width * 0.06, //**
                        ),
                      ),
                    ),
                  ),
                  //counter text
                  SizedBox(
                    height: widget.height * 0.07,
                    width: widget.width * 0.1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        // shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(
                          widget.width * 0.02,
                        ),
                      ),
                      child: Text(
                        "1",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  //removeIcon
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: widget.height * 0.1,
                      width: widget.width * 0.1,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: AppColors.kShapesColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.remove,
                          color: AppColors.white,
                          shadows: const [
                            BoxShadow(
                                color: AppColors.white,
                                blurRadius: 10,
                                spreadRadius: 4)
                          ],
                          size: widget.width * 0.06, //**
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: widget.width * 0.015,
        ),

        //name, description, price
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: widget.height * 0.12,
              ),
              //name
              Text(
                translateDataBaseLang(
                    widget.cartDataEntity.itemsNameAr.toString(),
                    widget.cartDataEntity.itemsName.toString()),
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 19,
                      shadows: AppColors.boxCategoriesShadows,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: widget.height * 0.042,
              ),
              //description
              Text(
                translateDataBaseLang(
                  widget.cartDataEntity.itemsDescriptionAr.toString(),
                  widget.cartDataEntity.itemsDescription.toString(),
                ),
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 17,
                      shadows: [
                        BoxShadow(
                            color: AppColors.white,
                            spreadRadius: widget.width * 0.02,
                            blurRadius: widget.width * 0.01)
                      ],
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: widget.height * 0.05,
              ),
              //price
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "100\$",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppColors.kShapesColor,
                        shadows: AppColors.boxCategoriesShadows,
                        fontSize: widget.width * 0.04,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: widget.height * 0.045,
              ),
              Center(
                child: SizedBox(
                  height: widget.height * 0.18,
                  width: widget.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: const MaterialStatePropertyAll(
                                AppColors.kShapesColor,
                              ),

                              elevation: const MaterialStatePropertyAll(5),
                              overlayColor:
                                  MaterialStatePropertyAll(AppColors.grey),
                              shadowColor: const MaterialStatePropertyAll(
                                  AppColors.kShapesColor),
                              // side: MaterialStatePropertyAll(BorderSide(
                              //     width: widget.width * 0.00,
                              //     color: AppColors.grey2800)),
                              fixedSize: MaterialStatePropertyAll<Size>(
                                Size.fromWidth(
                                  widget.width * 0.07,
                                ),
                              ),
                            ),
                    child: Text(
                      "buy_now".tr(context),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ImageCart extends StatelessWidget {
  const ImageCart({
    Key? key,
    required this.width,
    required this.height,
    required this.imgUrl,
  }) : super(key: key);

  final double width;
  final double height;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: width * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppColors.boxShadows,
        borderRadius: BorderRadius.circular(
          width * 0.02,
        ),
      ),
      height: height * 0.82,
      width: width * 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          width * 0.02,
        ),
        child: Image.network(
          "${ApiLinks.kLinkItemsImages}/$imgUrl",
          fit: BoxFit.contain,
          // height: height * 0.8,
          // width: constraint.width * 0.3,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
