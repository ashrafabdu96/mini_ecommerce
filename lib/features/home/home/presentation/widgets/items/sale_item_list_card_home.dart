import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/home_cubit.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/home_title.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/items/sale_item_card.dart';

class SaleItemListCard extends StatelessWidget {
  const SaleItemListCard({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          return Column(
            children: [
              SectionTitle(
                title: "sale".tr(context),
                press: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutesName.itemScreen,
                    arguments: state.allItems!
                        .where((element) => element.itemsDiscount != 0)
                        .toList(),
                  );
                },
              ),
              SizedBox(
                height: height * 0.9,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: width * 0.5,
                      // outer container
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(width * 0.025),
                          ),
                          color: AppColors.white.withAlpha(120),
                          boxShadow: AppColors.containersShadow,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: height * 0.01,
                        ),
                        child: SaleItemCardHome(
                            itemsEntity: state.homeEntity.items![index],
                            maxWidth: width,
                            maxHeight: height),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: width * 0.05,
                  ),
                  itemCount: state.homeEntity.items!.length,
                ),
              ),
            ],
          );
        } else if (state is HomeErrorState) {
          return Center(
            child: Text(state.status),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
