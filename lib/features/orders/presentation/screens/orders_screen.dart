import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/orders/presentation/cubit/order_cubit.dart';
import 'package:mini_ecommerce/features/orders/presentation/widgets/filter_section.dart';
import 'package:mini_ecommerce/features/orders/presentation/widgets/orders_section.dart';
import 'package:mini_ecommerce/injection_container.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => sl<OrderCubit>()
          ..getOrderData(
              context: context, where: 'user_id_order=${getUserId()}'),
        child: Builder(builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
              vertical: size.height * 0.002,
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Text(
                  'my_orders'.tr(context),
                  style: Theme.of(context).textTheme.headline1,
                ),
                FilterSection(
                  height: size.height * 0.095,
                  width: size.width,
                ),
                BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    if (state is OrderLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is OrderErrorState) {
                      return Center(
                        child: Text(state.status),
                      );
                    } else if (state is OrderSuccessState) {
                      return OrdersSection(
                        size: size,
                        headOrderEntity: state.headOrderEntity,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
