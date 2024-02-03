import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/custom_widgets/snack_bar_message.dart';
import 'package:mini_ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:mini_ecommerce/features/cart/presentation/widgets/second/all_cart_items.dart';
import 'package:mini_ecommerce/injection_container.dart';

class CartScreen2 extends StatelessWidget {
  const CartScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.01,
        ),
        child: BlocProvider(
          create: (context) => sl<CartCubit>()..getCartData(context),
          child: Builder(builder: (context) {
            return BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartDeleteSuccessState) {
                  showSnackMessage(
                      context: context,
                      message: "deleted SuccessFully",
                      textColor: AppColors.white,
                      bkgColor: AppColors.kShapesColor);
                } else if (state is CartDeleteErrorState) {
                  showSnackMessage(
                      context: context,
                      message: "failed",
                      textColor: AppColors.white,
                      bkgColor: AppColors.kShapesColor);
                }
              },
              builder: (context, state) {
                if (state is CartErrorState) {
                  return Center(
                    child: Text(state.status),
                  );
                } else if (state is CartLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                } else if (state is CartSuccessState) {
                  return AllCartItems(
                    //from the dataBase
                    totalPrice: state.cartEntity.total,
                    // totalPrice: int.parse(BlocProvider.of<CartCubit>(context)
                    //     .getTheTotalPriceOFProducts()),
                  );
                } else {
                  return const SizedBox();
                }
              },
            );
          }),
        ),
      ),
    );
  }
}
