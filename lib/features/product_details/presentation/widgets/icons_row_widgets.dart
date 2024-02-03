import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/custom_widgets/snack_bar_message.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/operations/item_details_operation_cubit.dart';
import 'package:mini_ecommerce/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IconsRow extends StatefulWidget {
  const IconsRow({
    Key? key,
    required this.screenWidth,
    required this.isInCart,
    required this.itemId,
    required this.isInFav,
  }) : super(key: key);

  final double screenWidth;
  final String isInCart;
  final String itemId;
  final String isInFav;

  @override
  State<IconsRow> createState() => _IconsRowState();
}

class _IconsRowState extends State<IconsRow> {
  late bool isCart;
  late String userId;
  late bool isFav;

  @override
  void initState() {
    isCart = widget.isInCart == "inCart" ? true : false;
    isFav = widget.isInFav == "inFav" ? true : false;
    userId = jsonDecode(
        sl<SharedPreferences>().getString("CACHED_USER").toString())["userId"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(isCart);
    return BlocListener<ItemDetailsOperationCubit, ItemDetailsOperationState>(
      listener: (context, state) {
        if (state is ItemDetailsOperationSuccessState) {
          showSnackMessage(
            bkgColor: AppColors.kShapesColor,
            textColor: AppColors.white,
            message:
                isCart || isFav ? "Added Successfully" : "Deleted Successfully",
            context: context,
          );
          //still the improve ment between the messages of the cart and favorite
        } else if (state is ItemDetailsOperationErrorState) {
          showSnackMessage(
            bkgColor: Colors.red,
            textColor: AppColors.white,
            message: "Failed",
            context: context,
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // favorite icon button
          CircleAvatar(
            backgroundColor: AppColors.white,
            child: InkWell(
              onTap: () {
                isFav == true
                    ? BlocProvider.of<ItemDetailsOperationCubit>(context)
                        .deleteFromFavorite(isFav, int.parse(userId),
                            int.parse(widget.itemId), context)
                        .then((value) {
                        isFav = value;
                      }).whenComplete(() => setState(() {}))
                    : BlocProvider.of<ItemDetailsOperationCubit>(context)
                        .addToFavorite(isFav, int.parse(userId),
                            int.parse(widget.itemId), context)
                        .then((value) {
                        isFav = value;
                      }).whenComplete(() {
                        setState(() {});
                      });
              },
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: Icon(
                  // Icons.favorite,
                  isFav ? Icons.favorite : Icons.favorite_outline,
                  size: widget.screenWidth * 0.04,
                  color: AppColors.kShapesColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: widget.screenWidth * 0.025,
          ),
          // cart icon button
          InkWell(
            onTap: () {
              isCart == true
                  ? BlocProvider.of<ItemDetailsOperationCubit>(context)
                      .deleteFromCart(isCart, userId, widget.itemId, context)
                      .then((value) {
                      isCart = value;
                    }).whenComplete(() => setState(() {}))
                  : BlocProvider.of<ItemDetailsOperationCubit>(context)
                      .addToCart(isCart, userId, widget.itemId, context)
                      .then((value) {
                      isCart = value;
                    }).whenComplete(() => setState(() {}));
            },
            child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: Icon(
                  // Icons.shopping_cart,
                  isCart ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                  size: widget.screenWidth * 0.04,
                  color: AppColors.kShapesColor,
                )),
          ),
        ],
      ),
    );
  }
}
