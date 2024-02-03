import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:mini_ecommerce/features/favorite/presentation/widgets/favorite_list.dart';
import 'package:mini_ecommerce/injection_container.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => sl<FavoriteCubit>()..getFavoriteData(context),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.01,
        ),
        child: BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            BlocProvider.of<FavoriteCubit>(context)
                .showMessage(state: state, context: context);
          },
          builder: (context, state) {
            if (state is FavoriteErrorState) {
              return const Center(
                child: Text("No Data Found"),
              );
            } else if (state is FavoriteLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return FavoriteList(
              height: height,
              width: width,
              allFavoriteData:
                  BlocProvider.of<FavoriteCubit>(context).favoriteProductsList,
            );
          },
        ),
      ),
    );
  }
}
