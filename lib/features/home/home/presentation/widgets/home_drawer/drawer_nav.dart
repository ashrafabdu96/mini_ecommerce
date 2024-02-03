import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/base_home_cubit/base_home_cubit.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/home_drawer/custom_account_drawer_header.dart';
import 'package:mini_ecommerce/features/home/home/presentation/widgets/home_drawer/drawer_item.dart';
import 'package:mini_ecommerce/features/orders/presentation/screens/orders_screen.dart';
import 'package:mini_ecommerce/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          CustomAccountDrawerHeader(
            size: size,
          ),

          DrawerItem(
            title: 'my_orders'.tr(context),
            icon: Icons.list_alt_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const OrdersScreen(),
                ),
              );
            },
          ),
          BlocBuilder<BaseHomeCubit, BaseHomeState>(
            builder: (context, state) {
              if (state is BaseHomeInitial) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return DrawerItem(
                      onTap: () {
                        BlocProvider.of<BaseHomeCubit>(context)
                            .changePage(index);
                        Navigator.pop(context);
                      },
                      title: state.bottomAppBarTitleList[index],
                      icon: state.bottomAppBarIconList[index],
                    );
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.pages.length,
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          //log out

          ListTile(
            style: ListTileStyle.drawer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: BorderSide(
                color: AppColors.grey.withOpacity(0.8),
                width: 1.5,
              ),
            ),
            onTap: () {
              // sl<SharedPreferences>().setString('step', 'one');
              sl<SharedPreferences>().clear();

              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutesName.login, (route) => false);
            },
            title: Text("logOut".tr(context)),
            leading: const Icon(
              Icons.logout,
              color: AppColors.kShapesColor,
            ),
          ),
        ],
      ),
    );
  }
}
