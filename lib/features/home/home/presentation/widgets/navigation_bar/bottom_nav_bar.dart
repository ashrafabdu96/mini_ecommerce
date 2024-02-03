import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/custom_widgets/custom_bottom_navigation_bar/bnb_custom_painter.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/base_home_cubit/base_home_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseHomeCubit, BaseHomeState>(
      builder: (context, state) {
        return state is BaseHomeInitial
            ? BottomNavigationBar(
                selectedItemColor: AppColors.kShapesColor,
                unselectedItemColor: AppColors.grey2800,
                backgroundColor: AppColors.kShapesColor,
                currentIndex: state.currentIndex,
                selectedIconTheme: IconThemeData(
                  color: AppColors.kShapesColor,
                  size: height * 0.032,
                ),
                // unselectedIconTheme: IconThemeData(
                //   color: AppColors.grey2800,
                //   size: height * 0.03,
                // ),
                // selectedLabelStyle: TextStyle(
                //   color: AppColors.kShapesColor,
                //   fontSize: width * 0.032,
                //   fontWeight: FontWeight.bold,
                // ),
                unselectedLabelStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.bold,
                ),
                items: [
                  ...List.generate(
                    state.pages.length,
                    (index) => BottomNavigationBarItem(
                      icon: Column(
                        children: [
                          Container(
                            height: height * 0.03,
                            width: width * 0.1,
                            decoration: BoxDecoration(
                              color: Color(0xF5E5A96F),
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              border: Border.all(
                                color: AppColors.grey2800,
                                width: 1.5,
                              ),
                            ),
                            child: Icon(
                              state.bottomAppBarIconList[index],
                            ),
                          ),
                          Text(
                            state.bottomAppBarTitleList[index],
                            style: TextStyle(color: AppColors.kShapesColor),
                          )
                        ],
                      ),
                      // label: state.bottomAppBarTitleList[index]
                      label: '',
                      activeIcon: Icon(
                        state.bottomBarActiveIconList[index],
                      ),
                    ),
                  ),
                ],
                onTap: (index) {
                  BlocProvider.of<BaseHomeCubit>(context).changePage(index);
                },
              )
            : const SizedBox();
      },
    );
  }
}

class BottomNavBarUsingBottomAppBar extends StatelessWidget {
  const BottomNavBarUsingBottomAppBar(
      {Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: AppColors.kShapesColor,
      child: SizedBox(
        height: height * 0.068,
        child: IconTheme(
            data: IconThemeData(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: LayoutBuilder(
              builder: (context, constraint) {
                return BlocBuilder<BaseHomeCubit, BaseHomeState>(
                  builder: (context, state) {
                    if (state is BaseHomeInitial) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: constraint.maxWidth * 0.15,
                          ),
                          ...List.generate(state.pages.length, (index) {
                            return Expanded(
                              child: CustomButtonNavigationBar(
                                title: state.bottomAppBarTitleList[index],
                                width: constraint.maxWidth,
                                height: constraint.maxHeight,
                                active:
                                    index == state.currentIndex ? true : false,
                                icon: state.bottomAppBarIconList[index],
                                onPressed: () {
                                  BlocProvider.of<BaseHomeCubit>(context)
                                      .changePage(index);
                                },
                              ),
                            );
                          })
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              },
            )),
      ),
    );
  }
}
