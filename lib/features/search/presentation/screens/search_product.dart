import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/helpers/chekStringInputLanguage.dart';
import 'package:mini_ecommerce/features/search/domain/entities/search_item_entity.dart';
import 'package:mini_ecommerce/features/search/presentation/cubit/search_cubit.dart';
import 'package:mini_ecommerce/features/search/presentation/widgets/search_items.dart';
import 'package:mini_ecommerce/injection_container.dart';

class SearchProduct extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.search),
      ),
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close_outlined),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        // close(context, buildSuggestions(context));
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios_outlined,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchItems(
      query: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => sl<SearchCubit>()..getSuggestion(context: context),
      child: Builder(builder: (context) {
        return BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
            if (state is SearchSuccessState) {
              List<SearchItemDataEntity>? itemsFilter =
                  searchCubit.suggestionFilter(
                      query: query,
                      allItems: state.searchItemEntity.searchItemDataEntity);
              return ListView.builder(
                  itemCount: itemsFilter!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          query = isArabic(query)
                              ? itemsFilter[index]
                                  .itemsNameAr
                                  .toString()
                                  .toLowerCase()
                              : itemsFilter[index]
                                  .itemsName
                                  .toString()
                                  .toLowerCase();
                          showResults(context);
                        },
                        leading: SizedBox(
                          width: size.width * 0.25,
                          child: Image.network(
                            "${ApiLinks.kLinkItemsImages}/${itemsFilter[index].itemsImage}",
                            // "${ApiLinks.kLinkItemsImages}/${state.allItems![index].itemsImage}",
                          ),
                        ),
                        title: Text(
                          itemsFilter[index].itemsName.toString(),
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
                          itemsFilter[index].itemsDescription.toString(),
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
                            "${itemsFilter[index].itemsPrice.toString()} \$",
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
          },
        );
      }),
    );
  }
}
