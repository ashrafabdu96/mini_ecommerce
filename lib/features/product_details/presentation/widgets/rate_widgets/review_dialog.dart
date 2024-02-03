import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/rate_cubit/rate_cubit.dart';
import 'package:mini_ecommerce/features/product_details/presentation/widgets/rate_widgets/dialog_review_text_button.dart';
import 'package:mini_ecommerce/features/product_details/presentation/widgets/rate_widgets/review_message_status.dart';
import 'package:mini_ecommerce/features/product_details/presentation/widgets/rate_widgets/review_text_form_field.dart';
import 'package:mini_ecommerce/injection_container.dart';

showReviewDialog(
    {required BuildContext context,
    required int length,
    required Size size,
    required int itemId,
    void Function()? onPressed}) {
  showDialog(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => sl<RateCubit>(),
          child: Builder(builder: (context) {
            return AlertDialog(
              backgroundColor: AppColors.kBackGroundColor,
              content: SizedBox(
                // height: size.height * 0.8,
                width: size.width * 0.9,
                // height: size.height * 0.3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Ashraf Abdo",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    //stars
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          length + 1,
                          (index) => const Icon(
                            shadows: AppColors.boxCategoriesShadows,
                            Icons.star,
                            color: Color(0xffE78335),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    BlocConsumer<RateCubit, RateState>(
                      listener: (context, state) {
                        if (state is RateAddingOrUpdatingSuccessState) {
                          Future.delayed(const Duration(seconds: 2))
                              .then((value) {
                            Navigator.pop(context);
                          });
                        }
                      },
                      builder: (context, state) {
                        if (state is RateAddingOrUpdatingLoadingState) {
                          return const Center(
                            child: RefreshProgressIndicator(),
                          );
                        } else if (state is RateAddingOrUpdatingSuccessState) {
                          return AddOrUpdateReviewMessageStatus(
                            message: state.result['message'],
                            iconData: Icons.check_circle_outline,
                            size: size,
                          );
                        } else if (state is RateAddingOrUpdatingFailureState) {
                          return AddOrUpdateReviewMessageStatus(
                            message: 'Failure',
                            iconData: Icons.error_outline_outlined,
                            size: size,
                          );
                        }
                        return ReviewTextFormField(
                          size: size,
                        );
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                DialogReviewTextButton(
                  onPressed: () {
                    BlocProvider.of<RateCubit>(context)
                        .addOrUpdateReview(itemId: itemId, stars: length + 1);
                    // BlocProvider.of<ItemDetailCubit>(context)
                    //     .getData(itemId, context);
                  },
                  title: 'Share',
                ),
                DialogReviewTextButton(
                  onPressed: onPressed,
                  title: 'Cancel',
                ),
              ],
            );
          }),
        );
      });
}
