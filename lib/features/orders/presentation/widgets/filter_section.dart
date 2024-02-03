import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/orders/presentation/cubit/order_cubit.dart';
import 'package:mini_ecommerce/injection_container.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    print('fone');
    ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
    return SizedBox(
      //this sized box is for listView
      height: height,
      width: width,
      child: DecoratedBox(
          decoration: const BoxDecoration(
              // color: AppColors.kShapesColor,
              ),
          child: LayoutBuilder(builder: (context, constraint) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ValueListenableBuilder<int>(
                  valueListenable: currentIndex,
                  builder: ((context, int value, child) {
                    print('listen');
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(getFiltersTitles(context).length,
                            (index) {
                          return FilterItem(
                              isSelected:
                                  currentIndex.value == index ? true : false,
                              title: getFiltersTitles(context)[index],
                              onTap: () {
                                filterData(index, context);
                                currentIndex.value = index;
                              },
                              height: constraint.maxHeight,
                              width: constraint.maxWidth);
                        }),
                      ],
                    );
                  })),
            );
          })),
    );
  }
}

filterData(int index, BuildContext context) {
  switch (index) {
    case 0:
      BlocProvider.of<OrderCubit>(context).getOrderData(
        context: context,
        where: 'user_id_order=${getUserId()}',
      );
      break;
    case 1:
      BlocProvider.of<OrderCubit>(context).getOrderData(
        context: context,
        where: 'user_id_order=${getUserId()} and is_delivered=1',
      );
      break;
    default:
      BlocProvider.of<OrderCubit>(context).getOrderData(
        context: context,
        where: 'user_id_order=${getUserId()} and is_delivered=0',
      );
      break;
  }
}

List<String> getFiltersTitles(BuildContext context) =>
    ['all'.tr(context), 'delivered'.tr(context), 'processing'.tr(context)];

class FilterItem extends StatelessWidget {
  const FilterItem(
      {Key? key,
      required this.isSelected,
      required this.title,
      required this.height,
      required this.width,
      this.onTap})
      : super(key: key);
  final bool isSelected;
  final String title;
  final double height;
  final double width;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.kShapesColor : null,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(height * 0.15),
          left: Radius.circular(height * 0.15),
        ),
      ),
      margin: EdgeInsets.only(
        right: width * 0.02,
        // left: width * 0.02,
      ),
      height: height * 0.5,
      width: width * 0.25,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors.kWhiteFonts : AppColors.kBlackFonts,
              fontSize: height * 0.18,
              fontWeight: FontWeight.bold,
            ),
            // textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
