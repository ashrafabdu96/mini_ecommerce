import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/custom_widgets/snack_bar_message.dart';
import 'package:mini_ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:mini_ecommerce/features/cart/presentation/widgets/cart_widget.dart';
import 'package:mini_ecommerce/features/cart/presentation/widgets/delete_button.dart';
import 'package:mini_ecommerce/injection_container.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, AppRoutesName.homeScreen,
                arguments: getUserId());
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: BlocProvider<CartCubit>(
        create: (context) => sl<CartCubit>()..getCartData(context),
        child: BlocConsumer<CartCubit, CartState>(
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
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.only(bottom: height * 0.1),
                itemBuilder: (context, index) {
                  return Dismissible(
                    direction: DismissDirection.startToEnd,
                    key: UniqueKey(),
                    background: SizedBox(
                      height: height * 0.4,
                      width: width * 0.05,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: AppColors.kBackGroundColor,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.delete_outline_rounded,
                            size: width * 0.1,
                          ),
                        ),
                      ),
                    ),
                    onDismissed: (dir) {
                      if (dir == DismissDirection.startToEnd) {
                        BlocProvider.of<CartCubit>(context).deleteCartData(
                          context,
                          BlocProvider.of<CartCubit>(context)
                              .cartProductsList[index]
                              .itemsId
                              .toString(),
                        );
                        BlocProvider.of<CartCubit>(context)
                            .cartProductsList
                            .removeAt(index);
                        print(
                            "Cart ->>List->> ${BlocProvider.of<CartCubit>(context).cartProductsList}");
                      } else {
                        null;
                      } // dir == DismissDirection.startToEnd ? print(deletedIndex) : null;
                    },
                    child: Stack(
                      children: [
                        CartWidget(
                          width: width,
                          height: height,
                          cartDataEntity: BlocProvider.of<CartCubit>(context)
                              .cartProductsList[index],
                          deletedIndex: index,
                        ),
                        Positioned(
                          top: width * 0.02,
                          right: getLang() == "en" ? width * 0.042 : null,
                          left: getLang() == "ar" ? width * 0.042 : null,
                          child: DeleteButton(
                            height: height,
                            width: width,
                            onTap: () {
                              //delete From the dataBase
                              BlocProvider.of<CartCubit>(context)
                                  .deleteCartData(
                                context,
                                BlocProvider.of<CartCubit>(context)
                                    .cartProductsList[index]
                                    .itemsId
                                    .toString(),
                              );
                              //delete From List

                              BlocProvider.of<CartCubit>(context)
                                  .cartProductsList
                                  .removeAt(index);
                              print(
                                  "Cart ->>List->> ${BlocProvider.of<CartCubit>(context).cartProductsList}");
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount:
                    BlocProvider.of<CartCubit>(context).cartProductsList.length,
              );
            }
          },
        ),
      ),
    );
  }
}
