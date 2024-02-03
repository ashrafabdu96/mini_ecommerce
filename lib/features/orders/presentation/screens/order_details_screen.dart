import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/features/orders/domain/entities/order_details_entity.dart';
import 'package:mini_ecommerce/features/orders/presentation/cubit/order_details_cubit/order_details_cubit.dart';
import 'package:mini_ecommerce/injection_container.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key, required this.orderId}) : super(key: key);
  final int orderId;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => sl<OrderDetailsCubit>()
          ..getOrderData(
            context: context,
            orderId: orderId,
          ),
        child: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
              builder: (context, state) {
                if (state is OrderDetailsSuccessState) {
                  return ListView(
                    children: [
                      ...List.generate(
                        state.orderDetailsEntity.orderDetailDataEntity!.length,
                        (index) => OrderDetailItem(
                          height: size.height * 0.2,
                          width: size.width,
                          orderDetailDataEntity: state
                              .orderDetailsEntity.orderDetailDataEntity![index],
                        ),
                      )
                    ],
                  );
                } else if (state is OrderDetailsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is OrderDetailsErrorState) {
                  return Center(
                    child: Text(state.status),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          );
        }),
      ),
    );
  }
}

class OrderDetailItem extends StatelessWidget {
  const OrderDetailItem(
      {Key? key,
      required this.height,
      required this.width,
      required this.orderDetailDataEntity})
      : super(key: key);
  final double height;
  final double width;
  final OrderDetailDataEntity orderDetailDataEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.itemDetails,
            arguments: [orderDetailDataEntity.itemIdOrder, null]);
      },
      child: Container(
          margin: EdgeInsets.only(
            top: height * 0.02,
            right: width * 0.01,
            left: width * 0.01,
          ),
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          height: height,
          width: width,
          decoration: BoxDecoration(
              // color: AppColors.white,
              color: AppColors.white,
              borderRadius: BorderRadius.circular(width / 45),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10.0,
                  color: Color(0xffedecf1),
                  offset: Offset(-8, -8),
                ),
                // inner
                BoxShadow(
                  blurRadius: 10.0,
                  color: Color(0xffedecf1),
                  offset: Offset(8, 8),
                ),
              ]),
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(width * 0.02),
                    child: SizedBox(
                      height: constraint.maxHeight * 0.95,
                      width: constraint.maxWidth * 0.4,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(
                            color: AppColors.grey,
                            width: height * 0.01,
                          ),
                        ),
                        child: Image.network(
                          "${ApiLinks.kLinkItemsImages}/${orderDetailDataEntity.itemsImage}",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: constraint.maxWidth * 0.02,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderInfoText(
                          text: orderDetailDataEntity.itemNameOrder.toString(),
                          textColor: AppColors.kShapesColor,
                          fonSize: width * 0.04,
                        ),
                        OrderInfoText(
                          text:
                              "Quantity : ${orderDetailDataEntity.quantity.toString()}",
                          textColor: AppColors.kBlackFonts,
                          fonSize: width * 0.03,
                        ),
                        OrderInfoText(
                          text:
                              "Price : ${orderDetailDataEntity.untiPrice.toString()} \$",
                          textColor: AppColors.kBlackFonts,
                          fonSize: width * 0.03,
                        ),
                        OrderInfoText(
                          text:
                              "Discount :  ${orderDetailDataEntity.discount.toString()}",
                          textColor: AppColors.kBlackFonts,
                          fonSize: width * 0.03,
                        ),
                        OrderInfoText(
                          text:
                              "subTotal :  ${orderDetailDataEntity.untiPrice! * orderDetailDataEntity.quantity!.toInt()} \$",
                          textColor: AppColors.kBlackFonts,
                          fonSize: width * 0.03,
                        ),
                        OrderInfoText(
                          text:
                              "Total :  ${orderDetailDataEntity.totalPrice} \$",
                          textColor: AppColors.kBlackFonts,
                          fonSize: width * 0.03,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}

List<BoxShadow> shadows = [
  const BoxShadow(
    blurRadius: 10.0,
    // color: Color(0xffedecf1),
    color: Color(0xff6e003c),
    offset: Offset(-10, -10),
  ),
  // inner
  const BoxShadow(
    blurRadius: 10.0,
    color: Color(0xffedecf1),
    offset: Offset(8, 8),
  ),
];

class OrderInfoText extends StatelessWidget {
  const OrderInfoText({
    Key? key,
    required this.fonSize,
    required this.text,
    this.textColor,
  }) : super(key: key);
  final double fonSize;
  final String text;
  final Color? textColor;
// final
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: fonSize,
            color: textColor,
          ),
    );
  }
}
