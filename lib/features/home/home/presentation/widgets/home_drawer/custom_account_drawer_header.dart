import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/cubit/profile_cubit.dart';
import 'package:mini_ecommerce/injection_container.dart';

class CustomAccountDrawerHeader extends StatelessWidget {
  const CustomAccountDrawerHeader({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileCubit>()..getUserProfileInfo(),
      child: Builder(
          builder: (context) => BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                if (state is ProfileSuccessState) {
                  return UserAccountsDrawerHeader(
                    accountName: Text(
                      state.userEntity.userName.toString(),
                      style: TextStyle(
                        color: AppColors.grey2800,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.035,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    accountEmail: Text(
                      state.userEntity.userEmail.toString(),
                      style: TextStyle(
                        color: AppColors.grey2800,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.03,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    currentAccountPicture: CircleAvatar(
                      // backgroundImage: AssetImage("assets/images/person.jpg"),
                      child: ClipOval(
                        child: Image.network(
                          "${ApiLinks.kLinkUserImages}/${state.userEntity.imageUrl.toString()}",
                          height: size.width * 0.2,
                          width: size.width * 0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/user_bk.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: AppColors.kShapesColor,
                    ),
                    arrowColor: AppColors.kShapesColor,
                  );
                } else {
                  return const SizedBox();
                }
              })),
    );
  }
}
