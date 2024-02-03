import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/custom_widgets/custom_floating_action_button.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/base_home_cubit/base_home_cubit.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/navigation_bar/bottom_nav_bar.dart';
import 'package:mini_ecommerce/features/search/presentation/screens/search_product.dart';

import '../widgets/home_drawer/drawer_nav.dart';

class BaseHomeScreen extends StatelessWidget {
  const BaseHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.white,
        bottomNavigationBar: BottomNavBarUsingBottomAppBar(
            height: size.height, width: size.width),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: CustomFloatingActionButton(
            width: size.width,
            onPressed: () {
              // Navigator.pushNamed(context, AppRoutesName.cartScreen);
              Navigator.pushNamed(context, AppRoutesName.cartScreen2);
            }),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchProduct());
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        // bottomNavigationBar: const CustomBottomNavigationBar(),
        drawer: const DrawerNav(),
        body: BlocBuilder<BaseHomeCubit, BaseHomeState>(
          buildWhen: (p, c) {
            if (p is BaseHomeInitial || c is BaseHomeInitial) {
              return true;
            }
            return true;
          },
          builder: (context, state) {
            return state is BaseHomeInitial
                ? state.pages[state.currentIndex]
                : null;
          },
        ));
  }
}
