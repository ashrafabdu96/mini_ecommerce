import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/item_variation/item_variation_cubit.dart';

class CustomItemsColors extends StatelessWidget {
  const CustomItemsColors({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.06,
      width: width,
      child: LayoutBuilder(builder: (context, constraint) {
        return BlocBuilder<ItemVariationCubit, ItemVariationState>(
          builder: (context, state) {
            if (state is ItemVariationSuccessState) {
              return Row(
                children: [
                  ...List.generate(
                      state.itemVariationEntity.itemVariationsData!.length,
                      (index) {
                    return Container(
                      height: constraint.maxHeight * 0.35,
                      width: constraint.maxWidth * 0.06,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(int.parse(state.itemVariationEntity
                            .itemVariationsData![index].colorValue
                            .toString())),
                      ),
                    );
                  }),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        );
      }),
    );
  }
}
