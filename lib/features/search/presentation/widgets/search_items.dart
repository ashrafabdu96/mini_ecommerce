import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/features/search/domain/entities/search_item_entity.dart';
import 'package:mini_ecommerce/features/search/presentation/cubit/search_cubit.dart';
import 'package:mini_ecommerce/injection_container.dart';

class SearchItems extends StatelessWidget {
  const SearchItems({
    Key? key,
    this.query,
  }) : super(key: key);
  final String? query;

  @override
  Widget build(BuildContext context) {
    List<SearchItemDataEntity>? items = [];
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => sl<SearchCubit>()
        ..searchForProduct(query: query.toString(), context: context),
      child: Builder(builder: (context) {
        SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
        return BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {
          if (state is SearchSuccessState) {
            items = state.searchItemEntity.searchItemDataEntity;
          }
        }, builder: (context, state) {
          if (state is SearchSuccessState) {
            return ListView.builder(
                itemCount: items!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutesName.itemDetails,
                          (route) => false,
                          arguments: [items![index].itemsId],
                        );
                      },
                      leading: SizedBox(
                        width: size.width * 0.25,
                        child: Image.network(
                          "${ApiLinks.kLinkItemsImages}/${items![index].itemsImage}",
                        ),
                      ),
                      title: Text(
                        items![index].itemsName.toString(),
                        // state.allItems![index].itemsName.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: AppColors.kBlackFonts,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        // state.allItems![index].itemsDescription.toString(),
                        items![index].itemsDescription.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          // color: AppColors.kBlackFonts,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      trailing: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.kShapesColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "${items![index].itemsPrice.toString()} \$",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.kWhiteFonts,
                            fontSize: size.width * 0.035,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: RefreshProgressIndicator(),
            );
          }
        });
      }),
    );
  }
}
