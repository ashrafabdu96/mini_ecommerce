import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/home_cubit.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/home_title.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/items/new_item_card.dart';

class NewItemListCard extends StatelessWidget {
  const NewItemListCard({Key? key, required this.height, required this.width})
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
                title: "new".tr(context),
                press: () {
                  Navigator.pushNamed(context, AppRoutesName.itemScreen,
                      arguments: state.allItems);
                },
              ),
              SizedBox(
                height: height * 0.9,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: width * 0.5,
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
                        child: NewItemCardHome(
                            allItemsEntity: state.homeEntity.allItems![index],
                            maxWidth: width,
                            maxHeight: height),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: width * 0.05,
                  ),
                  itemCount: state.homeEntity.allItems!.length,
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
