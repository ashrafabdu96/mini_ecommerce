import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/rate_cubit/reviews_cubit.dart';
import 'package:mini_ecommerce/injection_container.dart';

class Reviews extends StatelessWidget {
  const Reviews({Key? key, required this.size, required this.itemId})
      : super(key: key);
  final Size size;
  final int itemId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ReviewsCubit>()
        ..getItemReviews(
          itemId: itemId,
          context: context,
        ),
      child: Builder(builder: (context) {
        return BlocBuilder<ReviewsCubit, ReviewsState>(
          builder: (context, state) {
            if (state is ReviewsLoadingState) {
              return const Center(
                child: RefreshProgressIndicator(),
              );
            } else if (state is ReviewsFailureState) {
              return Center(
                child: Text(state.status),
              );
            } else if (state is ReviewsSuccessState) {
              return SizedBox(
                height: size.height * 0.4,
                child: ListView.builder(
                    itemCount: state.reviewsEntity.reviewsDataEntity!.length,
                    // shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          isThreeLine: true,
                          leading: SizedBox(
                              width: size.width * 0.1,
                              child:
                                  Image.asset('assets/images/user_image.jpg')),
                          title: Text(
                            state.reviewsEntity.reviewsDataEntity![index]
                                .usersName
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.reviewsEntity.reviewsDataEntity![index]
                                    .content
                                    .toString(),
                              ),
                              Row(
                                children: [
                                  ...List.generate(
                                    state.reviewsEntity
                                        .reviewsDataEntity![index].stars!
                                        .toInt(),
                                    (index) => const Icon(
                                      shadows: AppColors.boxCategoriesShadows,
                                      Icons.star,
                                      color: Color(0xffE78335),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return const Center(
                child: Text(
                  'There\'s No Reviews Yet',
                ),
              );
            }
          },
        );
      }),
    );
  }
}
