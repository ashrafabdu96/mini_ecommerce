import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/helpers/translate_data_base_lang.dart';
import 'package:mini_ecommerce/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:mini_ecommerce/features/home/home/presentation/screens/category_screen/category_screen.dart';
import 'package:mini_ecommerce/features/home/home/presentation/screens/home_screen.dart';
import 'package:mini_ecommerce/features/orders/presentation/screens/orders_screen.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/screen/profile_screen.dart';
import 'package:mini_ecommerce/injection_container.dart';

part 'base_home_state.dart';

class BaseHomeCubit extends Cubit<BaseHomeState> {
  late int currentIndex;
  changePage(int index) {
    currentIndex = index;
    // emit(state);
    emit(BaseHomeInitial(currentIndex: index));
  }

  BaseHomeCubit() : super(BaseHomeInitial(currentIndex: 0));
}
