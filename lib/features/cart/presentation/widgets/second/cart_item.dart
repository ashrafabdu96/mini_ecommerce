import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/custom_widgets/snack_bar_message.dart';
import 'package:mini_ecommerce/core/helpers/translate_data_base_lang.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:mini_ecommerce/features/cart/presentation/widgets/delete_button.dart';
import 'package:mini_ecommerce/features/cart/presentation/widgets/second/custom_add_or_remove_button.dart';
import 'package:mini_ecommerce/features/cart/presentation/widgets/second/custom_buy_button.dart';
import 'package:mini_ecommerce/features/cart/presentation/widgets/second/custom_image_cart.dart';
import 'package:mini_ecommerce/features/payment/presentation/screen/payment_screen.dart';
import 'package:mini_ecommerce/injection_container.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.cartDataEntity,
  }) : super(key: key);
  final CartDataEntity cartDataEntity;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.18,
      width: size.width * 0.9,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            size.width * 0.03,
          ),
          boxShadow: AppColors.containersShadow,
        ),
        child: LayoutBuilder(builder: (context, constraint) {
          return Stack(
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageCart(
                    height: constraint.maxHeight,
                    width: constraint.maxWidth,
                    imgUrl: cartDataEntity.itemsImage.toString(),
                  ),
                  SizedBox(
                    width: constraint.maxWidth * 0.04,
                  ),
                  // name ,price,description and icons + ,-
                  //expanded to take all the width
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text(
                          translateDataBaseLang(
                            cartDataEntity.itemsNameAr.toString(),
                            cartDataEntity.itemsName.toString(),
                          ),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(height: constraint.maxHeight * 0.05),
                        //description
                        Text(
                          translateDataBaseLang(
                            cartDataEntity.itemsDescriptionAr.toString(),
                            cartDataEntity.itemsDescription.toString(),
                          ),
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: constraint.maxHeight * 0.09,
                                  fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(height: constraint.maxHeight * 0.05),
                        //price
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: constraint.maxWidth * 0.015),
                          decoration: BoxDecoration(
                            boxShadow: AppColors.containersShadow,
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(
                              constraint.maxWidth * 0.02,
                            ),
                          ),
                          // alignment: Alignment.center,
                          child: Text(
                            "${cartDataEntity.itemsPrice.toString()}\$",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: constraint.maxHeight * 0.11,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.kShapesColor),
                          ),
                        ),

                        Expanded(
                          child: CounterText(
                            cartDataEntity: cartDataEntity,
                            // itemId: cartDataEntity.itemsId,
                            constraint: constraint,
                            // cartItemQuantity:cartDataEntity.cartQuantity!.toInt(),
                            // itemDataBaseQuantity: cartDataEntity.itemsCount,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Transform.translate(
                offset: Offset(
                  getLang() == 'en'
                      ? constraint.maxWidth * 0.87
                      : constraint.maxWidth * -0.87,
                  constraint.maxHeight * 0.03,
                  // constraint.maxHeight * 0.05,
                ),
                child: DeleteButton(
                    width: constraint.maxWidth,
                    height: constraint.maxHeight,
                    onTap: () {
                      //delete From the dataBase
                      BlocProvider.of<CartCubit>(context).deleteCartData(
                        context,
                        cartDataEntity.itemsId.toString(),
                      );
                      //delete From List

                      BlocProvider.of<CartCubit>(context)
                          .cartProductsList
                          .removeWhere((element) =>
                              element.itemsId == cartDataEntity.itemsId);
                      // print(
                      // "Cart ->>List->> ${BlocProvider.of<CartCubit>(context).cartProductsList}");
                    }),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class CounterText extends StatefulWidget {
  const CounterText({
    Key? key,
    // required this.cartItemQuantity,
    required this.constraint,
    // this.itemDataBaseQuantity,
    // this.itemId,
    required this.cartDataEntity,
  }) : super(key: key);
  final CartDataEntity cartDataEntity;
  final BoxConstraints constraint;
  // final int cartItemQuantity;
  // final int? itemDataBaseQuantity;
  // final int? itemId;

  @override
  State<CounterText> createState() => _CounterTextState();
}

class _CounterTextState extends State<CounterText> {
  int quantity = 0;
  int? itemDataBaseQuantity;
  @override
  void initState() {
    quantity = widget.cartDataEntity.cartQuantity!.toInt();
    // quantity = widget.cartItemQuantity;
    // itemDataBaseQuantity = widget.itemDataBaseQuantity;
    itemDataBaseQuantity = widget.cartDataEntity.itemsCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomAddOrRemoveButton(
          height: widget.constraint.maxHeight,
          width: widget.constraint.maxWidth,
          icon: Icons.add,
          onPressed: () {
            if (quantity >= itemDataBaseQuantity!.toInt()) {
              showSnackMessage(
                context: context,
                bkgColor: AppColors.kShapesColor,
                textColor: AppColors.kWhiteFonts,
                message: "This_quantity_is_not_available".tr(context),
              );
              quantity;
              // setState(() {});
            } else {
              setState(() {
                quantity++;
              });

              BlocProvider.of<CartCubit>(context).updateCartItemQuantity(
                context: context,
                itemId: widget.cartDataEntity.itemsId!.toInt(),
                // itemId: widget.itemId!.toInt(),
                quantity: quantity,
              );

              BlocProvider.of<CartCubit>(context).cartProductsList.clear();
              BlocProvider.of<CartCubit>(context).getCartData(context);
            }
          },
        ),
        Text(
          quantity.toString(),
          style: TextStyle(
            fontSize: widget.constraint.maxHeight * 0.15,
          ),
        ),
        CustomAddOrRemoveButton(
          height: widget.constraint.maxHeight,
          width: widget.constraint.maxWidth,
          icon: Icons.remove,
          onPressed: () {
            if (quantity == 1) {
              showSnackMessage(
                context: context,
                bkgColor: AppColors.kShapesColor,
                textColor: AppColors.kWhiteFonts,
                message: "Minimum_one_piece".tr(context),
              );
              setState(() {});
              quantity = 1;
            } else {
              setState(() {
                quantity--;
              });
              BlocProvider.of<CartCubit>(context).updateCartItemQuantity(
                context: context,
                itemId: widget.cartDataEntity.itemsId!.toInt(),
                // itemId: widget.itemId!.toInt(),
                quantity: quantity,
              );

              BlocProvider.of<CartCubit>(context).cartProductsList.clear();
              BlocProvider.of<CartCubit>(context).getCartData(context);
            }
          },
        ),
        const Spacer(),
        CustomBuyButton(
          height: widget.constraint.maxHeight * 0.2,
          width: widget.constraint.maxWidth * 0.3,
          title: "buy_now".tr(context),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PaymentScreen(
                    cartDataEntity: [widget.cartDataEntity],
                    total: (widget.cartDataEntity.itemsPrice)! * (quantity),
                  );
                },
              ),
            );
          },
        ),
        const Spacer(),
      ],
    );
  }
}
