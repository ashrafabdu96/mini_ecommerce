import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:mini_ecommerce/features/cart/presentation/widgets/second/cart_item.dart';
import 'package:mini_ecommerce/features/cart/presentation/widgets/second/custom_buy_button.dart';
import 'package:mini_ecommerce/features/payment/presentation/screen/payment_screen.dart';

class AllCartItems extends StatelessWidget {
  const AllCartItems({Key? key, this.totalPrice}) : super(key: key);
  final int? totalPrice;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ListView(
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: size.height * 0.025,
                );
              },
              itemBuilder: (context, index) {
                return CartItem(
                  cartDataEntity: BlocProvider.of<CartCubit>(context)
                      .cartProductsList[index],
                );
              },
              itemCount:
                  BlocProvider.of<CartCubit>(context).cartProductsList.length,
            ),
            SizedBox(
              height: size.height * 0.18,
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Builder(builder: (context) {
            return CartSummation(
              onTap: () {
                var cartProductsList =
                    BlocProvider.of<CartCubit>(context).cartProductsList;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PaymentScreen(
                        cartDataEntity: cartProductsList,
                        total: totalPrice,
                      );
                    },
                  ),
                );

                ///********************
                // BlocProvider.of<CartCubit>(context).cartProductsList.clear();
                // BlocProvider.of<CartCubit>(context).getCartData(context);
                // var cartProductsList =
                //     BlocProvider.of<CartCubit>(context).cartProductsList;
                //
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return AddressScreen(
                //         cartDataEntity: cartProductsList,
                //       );
                //     },
                //   ),
                // );
              },
              size: size,
              total: totalPrice == null ? 0.toString() : totalPrice.toString(),
            );
          }),
        )
      ],
    );
  }
}

class CartSummation extends StatelessWidget {
  const CartSummation({Key? key, required this.size, this.onTap, this.total})
      : super(key: key);
  final Size size;
  final String? total;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      width: size.width,
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.05,
        top: size.height * 0.01,
      ),
      margin: EdgeInsets.all(
        size.width * 0.015,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        // boxShadow: AppColors.containersShadow,
        borderRadius: BorderRadius.circular(
          size.width * 0.02,
        ),
      ),
      child: LayoutBuilder(builder: (context, constraint) {
        return Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "total".tr(context),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Spacer(),
                Text(
                  "\$ $total",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: size.width * 0.04,
                        color: AppColors.kShapesColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
            Spacer(),
            total == '0'
                ? SizedBox()
                : CustomBuyButton(
                    height: constraint.maxHeight * 0.35,
                    width: constraint.maxWidth * 0.56,
                    title: "confirm_orders".tr(context),
                    onTap: onTap,
                  ),
            Spacer(),
          ],
        );
      }),
    );
  }
}
