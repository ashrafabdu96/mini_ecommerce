import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/home_cubit.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/offer/offer_indicator.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/offer/offer_item.dart';

class OffersWidget extends StatefulWidget {
  const OffersWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double height;
  final double width;

  @override
  State<OffersWidget> createState() => _OffersWidgetState();
}

class _OffersWidgetState extends State<OffersWidget> {
  var _selectedIndex = 0;
  List items = [];
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: _selectedIndex,
    );
    // goToNext();
    super.initState();
  }

  @override
  void dispose() {
    // currentIndex = 0;
    pageController.dispose();
    print('dispose object');
    super.dispose();
  }

  void goToNext() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (_selectedIndex < items.length) {
        _selectedIndex++;
      } else {
        _selectedIndex = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          _selectedIndex,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutCirc,
        );
      }
      goToNext();
    });
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<HomeCubit>(context).getData(context);

    return Container(
      height: widget.height,
      decoration: BoxDecoration(
          color: AppColors.grey2800.withOpacity(0.2),
          borderRadius: BorderRadius.circular(widget.width * 0.05)),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccessState) {
            items = state.homeEntity.items!.toList();
            return Column(
              children: [
                SizedBox(
                  height: widget.height * 0.92,
                  child: PageView.builder(
                    controller: pageController,
                    physics:
                        const ScrollPhysics(parent: ClampingScrollPhysics()),
                    onPageChanged: (index) {
                      setState(() {
                        _selectedIndex = index;
                        print(_selectedIndex);
                      });
                    },
                    // controller: PageController(viewportFraction: ),
                    itemBuilder: (context, index) {
                      return OfferItem(
                        itemsEntity: state.homeEntity.items![index],
                        height: widget.height,
                        width: widget.width,
                      );
                    },
                    itemCount: state.homeEntity.items!.length,
                  ),
                ),
                SizedBox(
                  height: widget.height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        state.homeEntity.items!.length,
                        (indicatorIndex) => OfferIndicator(
                          height: widget.height,
                          width: widget.width,
                          isActive:
                              indicatorIndex == _selectedIndex ? true : false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeErrorState) {
            return Text(state.status);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
