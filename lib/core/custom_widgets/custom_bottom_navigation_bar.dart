import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: const NavigationBarThemeData(),
      child: NavigationBar(
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            selectedIcon: Icon(
              Icons.home,
              color: AppColors.kShapesColor,
            ),
          ),
          NavigationDestination(
            icon: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutesName.favoriteScreen);
              },
              child: const Icon(Icons.favorite_border_outlined),
            ),
            selectedIcon: const Icon(Icons.favorite_border_outlined),
            label: "Favorite",
          ),
          const NavigationDestination(
              icon: Icon(Icons.shopping_cart_rounded), label: "Cart"),
          const NavigationDestination(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
