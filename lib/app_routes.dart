import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/features/auth/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:mini_ecommerce/features/auth/presentation/screens/forget_password/reset_password_screen.dart';
import 'package:mini_ecommerce/features/auth/presentation/screens/forget_password/success_reset_password_screen.dart';
import 'package:mini_ecommerce/features/auth/presentation/screens/language_screen.dart';
import 'package:mini_ecommerce/features/auth/presentation/screens/login_screen.dart';
import 'package:mini_ecommerce/features/auth/presentation/screens/signup_screen.dart';
import 'package:mini_ecommerce/features/auth/presentation/screens/success_signup_screen.dart';
import 'package:mini_ecommerce/features/auth/presentation/screens/verify_code_signup.dart';
import 'package:mini_ecommerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:mini_ecommerce/features/cart/presentation/screens/second/cart_screen2.dart';
import 'package:mini_ecommerce/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';
import 'package:mini_ecommerce/features/home/home/presentation/cubit/base_home_cubit/base_home_cubit.dart';
import 'package:mini_ecommerce/features/home/home/presentation/screens/base_home_screen.dart';
import 'package:mini_ecommerce/features/orders/presentation/screens/order_details_screen.dart';
import 'package:mini_ecommerce/features/orders/presentation/screens/orders_screen.dart';
import 'package:mini_ecommerce/features/product_details/presentation/screen/item_details_screen.dart';
import 'package:mini_ecommerce/features/products/presentation/screens/products_screen.dart';
import 'package:mini_ecommerce/features/products_by_category/presentation/screens/product_by_cat_screen.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/screen/account_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/presentation/screens/forget_password/verify_code_screen.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

class AppRoute {
  AppRoute();

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.myDefault:
        final String? appStep = di.sl<SharedPreferences>().getString("step");
        if (appStep == "one") {
          return MaterialPageRoute(
            builder: (_) => const LoginScreen(),
            // builder: (_) => const BaseHomeScreen(),
          );
        } else if (appStep == "two") {
          // final String userId = profile_f.arguments as String;
          // final String userId = jsonDecode(sl<SharedPreferences>()
          //     .getString("CACHED_USER")
          //     .toString())["userId"];

          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => BaseHomeCubit(),
              child: const BaseHomeScreen(
                  // userId: userId,
                  ),
            ),
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => const LanguageScreen(),
          );
        }
      case AppRoutesName.signup:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case AppRoutesName.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case AppRoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );
      case AppRoutesName.verifyCode:
        final String email = settings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => VerifyCodeScreen(
            email: email,
          ),
        );
      case AppRoutesName.resetPassword:
        final String email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ResetPasswordScreen(
            email: email,
            isChange: false,
          ),
        );
      case AppRoutesName.successResetPass:
        return MaterialPageRoute(
            builder: (_) => const SuccessResetPassScreen());
      case AppRoutesName.successSignup:
        return MaterialPageRoute(builder: (_) => const SuccessSignupScreen());
      case AppRoutesName.verifyCodeSignup:
        final String email = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => VerifyCodeSignUpScreen(
                  email: email,
                ));

      case AppRoutesName.orderDetailsScreen:
        final int orderId = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => OrderDetailsScreen(
                  orderId: orderId,
                ));
      case AppRoutesName.orderScreen:
        return MaterialPageRoute(
          builder: (_) => const OrdersScreen(),
        );
      case AppRoutesName.accountSettingsScreen:
        return MaterialPageRoute(
          builder: (_) => const AccountSettings(),
        );

      case AppRoutesName.itemDetails:
        final List arguments = settings.arguments as List;

        int? itemId;
        BaseItemEntity? itemsEntity;
        arguments.add(itemId);
        arguments.add(itemsEntity);
        return MaterialPageRoute(
            builder: (_) => ItemDetailScreen(
                  itemId: arguments[0],
                  // itemsEntity: arguments[1],
                ));
      case AppRoutesName.homeScreen:
        // final String userId = settings.arguments as String;
        // jsonDecode(sl<SharedPreferences>().getString("CACHED_USER").toString())["userId"];

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => BaseHomeCubit(),
            child: const BaseHomeScreen(
                // userId: userId,
                ),
          ),
        );
      case AppRoutesName.itemScreen:
        List<AllItemsEntity>? allItemsEntity =
            settings.arguments as List<AllItemsEntity>;
        return MaterialPageRoute(
          builder: (_) => ProductsScreen(
            allItemEntity: allItemsEntity,
          ),
        );
      case AppRoutesName.itemByCatScreen:
        final String userId = jsonDecode(sl<SharedPreferences>()
            .getString("CACHED_USER")
            .toString())["userId"];
        List? categoriesEntityList;
        int? selectedCatId;
        final List arguments = settings.arguments as List;
        arguments.add(selectedCatId);
        arguments.add(categoriesEntityList);

        return MaterialPageRoute(
          builder: (_) => ProductsByCatScreen(
            categoriesEntity: arguments[1]!,
            userId: int.parse(
              userId,
            ),
            selectedCatId: arguments[0], //we get it from CategoryItemHome
          ),
        );
      case AppRoutesName.cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case AppRoutesName.favoriteScreen:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case AppRoutesName.cartScreen2:
        return MaterialPageRoute(builder: (_) => const CartScreen2());
      default:
        return null;
    }
  }
}
