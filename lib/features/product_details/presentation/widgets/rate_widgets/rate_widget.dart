import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/custom_widgets/snack_bar_message.dart';
import 'package:mini_ecommerce/features/product_details/presentation/cubit/rate_cubit/rate_cubit.dart';
import 'package:mini_ecommerce/features/product_details/presentation/widgets/rate_widgets/review_dialog.dart';
import 'package:mini_ecommerce/injection_container.dart';

import 'rate_percentage.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    Key? key,
    required this.screenWidth,
    required this.itemId,
    required this.stars,
    required this.publicRate,
  }) : super(key: key);
  final int itemId;
  final int stars;
  final double publicRate;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ValueNotifier<int> currentStar =
        ValueNotifier<int>(stars == 0 ? -1 : stars);

    return BlocProvider(
      create: (context) => sl<RateCubit>(),
      child: Builder(builder: (context) {
        return BlocListener<RateCubit, RateState>(
          listener: (context, state) async {
            if (state is RateBoughtState) {
              await showReviewDialog(
                itemId: itemId,
                context: context,
                length: currentStar.value,
                size: size,
                onPressed: () {
                  currentStar.value = stars == 0 ? -1 : stars;
                  Navigator.pop(context);
                },
              );
            } else {
              currentStar.value = -1;
              showSnackMessage(
                context: context,
                bkgColor: Colors.redAccent,
                message: 'you have to buy it before Rating',
                textColor: AppColors.kWhiteFonts,
              );
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.alphabetic,
            children: [
              ...List.generate(
                5,
                (index) => InkWell(
                  onTap: () async {
                    await BlocProvider.of<RateCubit>(context)
                        .checkBeforeRate(itemId: itemId);
                    currentStar.value = index;
                    if (kDebugMode) {
                      print(currentStar.value + 1);
                    }
                  },
                  child: ValueListenableBuilder(
                    valueListenable: currentStar,
                    builder: ((context, int value, child) => Icon(
                          shadows: AppColors.boxCategoriesShadows,
                          index < currentStar.value
                              ? Icons.star
                              : Icons.star_border_outlined,
                          color: const Color(0xffE78335),
                        )),
                  ),
                ),
              ),
              const Spacer(),
              RatePercentage(
                text2: '(10)',
                text: publicRate.toString(),
              ),
              SizedBox(
                width: screenWidth * 0.01,
              ),
            ],
          ),
        );
      }),
    );
  }
}
